################################
# Invokes Reusable gradlew tasks which working grails guides use.
################################

#!/bin/bash
set -e

export EXIT_STATUS=0
export GUIDE_NAME=${PWD##*/}
export GUIDE_BRANCH_TRIMMED=${GUIDE_BRANCH##*refs/heads/}

###################################
echo "******* cat guides.json before the gradlew call"
cat gh-pages/guides.json
##################################

echo "****** Run Updating Guides JSON"
./gradlew updateGuidesJson || EXIT_STATUS=$?
if [[ $EXIT_STATUS -ne 0 ]]; then
    echo "updateGuidesJson failed"
    rm -rf gh-pages
    exit $EXIT_STATUS
fi

###################################
echo "******* cat guides.json after the gradlew call"
cat gh-pages/guides.json
##################################

exit 0
