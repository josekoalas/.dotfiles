#!/bin/zsh

set -e

osascript - <<EOF
tell application "iTerm2"
    activate
    create window with default profile
end tell
EOF
