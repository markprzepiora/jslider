#!/usr/bin/env bash
set -e

mkdir -p bin

rm -f bin/jquery.slider.all.js bin/jquery.slider.min.js

cat js/jshashtable-2.1_src.js js/jquery.numberformatter-1.2.3.js \
    js/tmpl.js js/jquery.dependClass-0.1.js js/draggable-0.1.js \
    js/jquery.slider.js \
    > bin/jquery.slider.all.js

cat <(uglifyjs js/jshashtable-2.1_src.js) \
    <(uglifyjs js/jquery.numberformatter-1.2.3.js) \
    <(uglifyjs js/tmpl.js) \
    <(uglifyjs js/jquery.dependClass-0.1.js) \
    <(uglifyjs js/draggable-0.1.js) \
    <(uglifyjs js/jquery.slider.js) \
    > bin/jquery.slider.min.js


cat css/jslider.css css/jslider.blue.css css/jslider.plastic.css \
    css/jslider.round.css css/jslider.round.plastic.css \
    > bin/jquery.slider.all.css

java -jar tools/yuicompressor-2.4.7.jar --type=css bin/jquery.slider.all.css \
    > bin/jquery.slider.min.css
