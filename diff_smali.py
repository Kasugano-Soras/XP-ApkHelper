"""Diff two smali files line by line (ignores trailing blank lines)."""
import sys, difflib, io

a_path, b_path = sys.argv[1], sys.argv[2]
a = io.open(a_path, encoding='utf-8').read().splitlines()
b = io.open(b_path, encoding='utf-8').read().splitlines()

diff = list(difflib.unified_diff(a, b, fromfile=a_path, tofile=b_path, lineterm='', n=2))
print("\n".join(diff) if diff else "IDENTICAL")
