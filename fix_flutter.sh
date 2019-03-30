#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
MYFILE="$DIR/lib/flutter/packages/flutter_tools/pubspec.yaml"
sed -i 's/linter: \^0\.1\.21/linter: 0\.1\.29/' "$MYFILE"
sed -i '/analyzer: any/a \ \ cli_util: any' "$MYFILE"
echo "Successfully fixed $MYFILE"
exit 0
