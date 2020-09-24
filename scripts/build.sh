set -e

# SETUP
SRC_DIR='./source'
OUT_DIR='./output'
OUT_DIR_WEB='./output/web'

mkdir -p $OUT_DIR
mkdir -p $OUT_DIR_WEB

BUILD_PDF=false
BUILD_HTML=true

# OLD VERSION FOR COPYING STYLESHEET
# if $BUILD_HTML; then
# echo "builing html"
# mkdir -p $OUT_DIR/config
# rsync --checksum config/theme.css output/theme.css
# bundle exec asciidoctor --base-dir=.  -a linkcss \
#     -D $OUT_DIR \
#     $SRC_DIR/*.adoc
# fi

if $BUILD_HTML; then
echo "builing html"
mkdir -p $OUT_DIR/config
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
