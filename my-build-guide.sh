#!/bin/bash
set -e

export EXIT_STATUS=0
export GUIDE_NAME=${PWD##*/}
export GUIDE_BRANCH_TRIMMED=${GUIDE_BRANCH##*refs/heads/}

##### WORKS
#echo "Publishing guide for branch $GITHUB_REPOSITORY"
#
#./gradlew -Dgeb.env=chromeHeadless check || EXIT_STATUS=$?
#
#if [[ $EXIT_STATUS -ne 0 ]]; then
#    echo "Check failed"
#    exit $EXIT_STATUS
#fi
#
#./gradlew publishGuide || EXIT_STATUS=$?
#if [[ $EXIT_STATUS -ne 0 ]]; then
#    echo "PublishGuide failed"
#    exit $EXIT_STATUS
#fi
#######################

#if [ "$TRAVIS_BRANCH" = "master" ] || [ "$TRAVIS_BRANCH" = "grails3" ]; then
#    if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then
#        echo "Publishing Documentation"
#        git config --global user.name "$GIT_NAME"
#        git config --global user.email "$GIT_EMAIL"
#        git config --global credential.helper "store --file=~/.git-credentials"
#        echo "https://$GH_TOKEN:@github.com" > ~/.git-credentials
#
#        git clone https://${GH_TOKEN}@github.com/grails/grails-guides.git -b gh-pages gh-pages --single-branch > /dev/null
#
#        echo "Updating Guides JSON"
#        ./gradlew updateGuidesJson || EXIT_STATUS=$?
#        if [[ $EXIT_STATUS -ne 0 ]]; then
#            echo "updateGuidesJson failed"
#            rm -rf gh-pages
#            exit $EXIT_STATUS
#        fi
#
#        cd gh-pages
#
#        if [ "$TRAVIS_BRANCH" = "grails3" ]; then
#            mkdir -p "grails3/$GUIDE_NAME"
#            cp -r ../build/docs/. "./grails3/$GUIDE_NAME/"
#        fi
#        if [ "$TRAVIS_BRANCH" = "master" ]; then
#             # If this is the master branch then update the snapshot
#            mkdir -p "$GUIDE_NAME"
#            cp -r ../build/docs/. "./$GUIDE_NAME/"
#        fi
#
#        if git diff --quiet; then
#            echo "No changes in Guide"
#        else
#            git add .
#            git commit -a -m "Publishing Grails Guide for Travis Build: https://travis-ci.org/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID"
#            git push origin HEAD
#        fi
#        cd ..
#        rm -rf gh-pages
#    fi
#fi
exit 0
