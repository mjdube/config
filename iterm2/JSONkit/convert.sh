
#! /bin/bash

gcc -o plist_to_json plist_to_json.m JSONKit.m -framework Foundation

#plutil -convert json -o iterm2.json iterm2clean.plist
#plutil -convert xml1 -o iterm2.xml iterm2clean.plist
