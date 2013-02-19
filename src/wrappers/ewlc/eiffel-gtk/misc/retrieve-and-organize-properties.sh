#!/bin/sh

for doc in /usr/share/doc/libgtk2.0-doc/gtk/Gtk*.html; do
    class=$(basename $doc)
    class=${class%.html}
    echo Properties of  "$class"
    links -dump -no-numbering $doc | \
	egrep "\"[a-z-]+\"[[:space:]]*[A-Za-z]+[[:space:]]*:.*"
	## Regexp matching 
    ## egrep -10 "The .* property"
done