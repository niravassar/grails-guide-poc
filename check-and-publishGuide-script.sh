################################
# Invokes Reusable gradlew tasks which working grails guides use.
################################

#!/bin/bash
set -e

export EXIT_STATUS=0
export GUIDE_NAME=${PWD##*/}
export GUIDE_BRANCH_TRIMMED=${GUIDE_BRANCH##*refs/heads/}

echo "Running gradlew check for $GITHUB_REPOSITORY"

./gradlew -Dgeb.env=chromeHeadless check || EXIT_STATUS=$?

if [[ $EXIT_STATUS -ne 0 ]]; then
    echo "Check failed"
    exit $EXIT_STATUS
fi

echo "Running gradlew publishGuide for $GITHUB_REPOSITORY"

./gradlew publishGuide || EXIT_STATUS=$?
if [[ $EXIT_STATUS -ne 0 ]]; then
    echo "PublishGuide failed"
    exit $EXIT_STATUS
fi
exit 0
