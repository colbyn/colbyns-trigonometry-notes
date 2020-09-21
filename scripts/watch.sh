set -e

# watchexec --exts adoc,css,yml --ignore output/ -- './scripts/build.sh && echo reloaded && open --background output/main.pdf'

watchexec --exts adoc,css,yml --ignore output/ -- './scripts/build.sh && echo reloaded'