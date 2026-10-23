#!/bin/bash
# 把 /cv/zh/ 和 /cv/en/ 两个排版页用无头 Chrome 导出成 PDF，放到 assets/cv/。
# 用法：bash tools/build_cv.sh（改过 _data 里的内容后重新运行，再提交 PDF）
set -euo pipefail
cd "$(dirname "$0")/.."
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

bundle exec jekyll build >/dev/null
mkdir -p assets/cv
for lang in zh en; do
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="assets/cv/Qianlong-Nie-CV-$lang.pdf" \
    "file://$PWD/_site/cv/$lang/index.html" 2>/dev/null
  echo "生成：assets/cv/Qianlong-Nie-CV-$lang.pdf"
done
