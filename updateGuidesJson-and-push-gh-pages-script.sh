################################
# Invokes Reusable gradlew tasks which working grails guides use.
################################

#!/bin/bash
set -e

export EXIT_STATUS=0
export GUIDE_NAME=${PWD##*/}
export GUIDE_BRANCH_TRIMMED=${GUIDE_BRANCH##*refs/heads/}

echo "***** Run updateGuidesJson to copy a new index into gh-pages"

./gradlew updateGuidesJson || EXIT_STATUS=$?
if [[ $EXIT_STATUS -ne 0 ]]; then
    echo "updateGuidesJson failed"
    rm -rf gh-pages
    exit $EXIT_STATUS
fi

echo "***** Copy guide docs into gh pages"

cd gh-pages
mkdir -p "$GUIDE_NAME"
cp -r ../build/docs/. "./$GUIDE_NAME/"

exit 0
