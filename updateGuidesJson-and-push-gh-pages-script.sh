################################
# Invokes Reusable gradlew tasks which working grails guides use.
################################

#!/bin/bash
set -e

export EXIT_STATUS=0
export GUIDE_NAME=${PWD##*/}

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

echo "***** Pushing Grails Guide: $GUIDE_NAME; GITHUB_WORKFLOW: $GITHUB_WORKFLOW"

git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
git add .
git commit -a -m "Pushing Grails Guide: $GUIDE_NAME; GITHUB_WORKFLOW: $GITHUB_WORKFLOW; GITHIB_RUN_NUMBER: $GITHUB_RUN_NUMBER"
git push origin HEAD

exit 0
