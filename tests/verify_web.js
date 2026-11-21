/* Fault-injection regression for the offline upload page. No browser packages needed. */
const fs = require("node:fs");
const vm = require("node:vm");
const assert = require("node:assert/strict");
const path = require("node:path");
const html = fs.readFileSync(path.join(__dirname, "../web-src/index.html"), "utf8");
const script = html.match(/<script>([\s\S]*?)<\/script>/)[1];

function page(userAgent) {
  const elements = new Map(), requests = [], windowEvents = {};
  for (const match of html.matchAll(/<[^>]+\bid="([^"]+)"[^>]*>/g)) {
    const attributes = {};
    for (const attr of match[0].matchAll(/([\w-]+)="([^"]*)"/g)) attributes[attr[1]] = attr[2];
    const classes = new Set();
    elements.set(match[1], {
      hidden: /\shidden(?:\s|>)/.test(match[0]), disabled: /\sdisabled(?:\s|>)/.test(match[0]),
      textContent: "", value: "", style: {}, events: {}, files: [],
      classList: { add(n) { classes.add(n); }, remove(n) { classes.delete(n); },
        toggle(n, enabled) { enabled ? classes.add(n) : classes.delete(n); } },
      setAttribute(k, v) { attributes[k] = v; }, removeAttribute(k) { delete attributes[k]; },
      getAttribute(k) { return attributes[k] === undefined ? null : attributes[k]; },
      addEventListener(k, fn) { this.events[k] = fn; }, click() {}
    });
  }
  function XHR() { this.upload = {}; this.headers = {}; requests.push(this); }
  XHR.prototype.open = function(method, url) { this.method = method; this.url = url; };
  XHR.prototype.setRequestHeader = function(k, v) { this.headers[k] = v; };
  XHR.prototype.send = function(body) { this.body = body; };
  const window = { addEventListener(k, fn) { windowEvents[k] = fn; } };
  vm.runInNewContext(script, {
    document: { getElementById(id) { assert(elements.has(id), id); return elements.get(id); } },
    navigator: { userAgent }, window, XMLHttpRequest: XHR
  });
  const $ = id => elements.get(id);
  const select = (name, bytes = 1048576) => {
    $("f").files = [{name, size: bytes}]; $("f").events.change(); return $("f").files[0];
  };
  return {$, window, requests, select};
}

const checks = {};
const android = page("Mozilla/5.0 (Linux; Android 12) Chrome/120");
assert.equal(android.$("f").getAttribute("accept"), null);
checks.android_picker_unrestricted = true;
for (const ua of ["Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)", "Desktop browser"]) {
  assert.match(page(ua).$("f").getAttribute("accept"), /application\/octet-stream/);
}
checks.apple_and_desktop_accept_list_preserved = true;

const p = page("Android 12");
const name = "QA124_微信 空格 '单引号'.APK.1";
let file = p.select(name);
assert.equal(p.$("upload").disabled, false);
assert.match(p.$("rename").textContent, /单引号'\.apk$/);
p.window.up();
assert.equal(p.requests.length, 1);
assert.equal(p.requests[0].method, "POST");
assert.equal(p.requests[0].url, "/upload?name=" + encodeURIComponent(name));
assert.equal(p.requests[0].headers["Content-Type"], "application/octet-stream");
assert.equal(p.requests[0].body, file);
assert.equal(p.$("f").disabled, true);
p.window.up();
assert.equal(p.requests.length, 1);
checks.raw_body_filename_encoding_and_duplicate_guard = true;
const request = p.requests[0];
request.upload.onprogress({lengthComputable: true, loaded: 524288, total: 1048576});
assert.equal(p.$("percent").textContent, "50%");
assert.equal(p.$("progress").getAttribute("aria-valuenow"), "50");
request.status = 200; request.responseText = "已保存到 Download: " + name.slice(0, -2); request.onload();
assert.equal(p.$("s").textContent, request.responseText);
assert.equal(p.$("percent").textContent, "100%");
assert.equal(p.$("f").disabled, false);
checks.progress_and_server_confirmed_success = true;

p.select("bad.txt");
assert.equal(p.$("upload").disabled, true);
assert.equal(p.$("selection").hidden, true);
assert.equal(p.$("error").hidden, false);
checks.invalid_reselection_clears_previous_file = true;
for (const fault of ["http400", "network", "timeout"]) {
  p.select("QA124_retry.apk");
  p.window.up();
  const r = p.requests[p.requests.length - 1];
  if (fault === "http400") { r.status = 400; r.responseText = "只支持 .apk 或 .apk.1 文件"; r.onload(); }
  else if (fault === "network") r.onerror();
  else r.ontimeout();
  assert.equal(p.$("upload").disabled, false);
  assert.equal(p.$("f").disabled, false);
  assert.equal(p.$("error").hidden, false);
  assert.equal(p.$("upload-label").textContent, "重新上传");
}
checks.http_error_network_timeout_can_retry = true;
const dropped = {name: "QA124_拖放.apk", size: 12345};
p.$("dropzone").events.drop({preventDefault(){}, dataTransfer:{files:[dropped]}});
assert.equal(p.$("filename").textContent, dropped.name);
assert.equal(p.$("upload").disabled, false);
p.$("dropzone").events.drop({preventDefault(){}, dataTransfer:{files:[dropped,dropped]}});
assert.equal(p.$("upload").disabled, true);
checks.single_file_drop_and_multiple_file_rejection = true;
const hostile = "<img src=x onerror=alert(1)>.apk";
p.select(hostile);
assert.equal(p.$("filename").textContent, hostile);
checks.filename_is_plain_text = true;
console.log(JSON.stringify(checks, null, 2));
