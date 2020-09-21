set -e

# SETUP
SRC_DIR='./source'
OUT_DIR='./output'
OUT_DIR_WEB='./output/web'

mkdir -p $OUT_DIR
mkdir -p $OUT_DIR_WEB

BUILD_PDF=false
BUILD_HTML=true

if $BUILD_HTML; then
echo "builing html"
bundle exec asciidoctor \
    -D $OUT_DIR \
    $SRC_DIR/*.adoc
fi

if $BUILD_PDF; then
echo "builing pdf"
bundle exec asciidoctor-pdf \
    -a pdf-themesdir=config -a pdf-theme=basic -a showtitle \
    -r asciidoctor-mathematical -a mathematical-format=svg \
    -D $OUT_DIR \
    $SRC_DIR/*.adoc
rm -f $SRC_DIR/stem-*.png
rm -f $SRC_DIR/stem-*.svg
fi
