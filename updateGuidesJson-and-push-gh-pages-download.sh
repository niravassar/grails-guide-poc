###################################
# Downloads the reusable scripts from infrastructure and invokes them
###################################

#!/bin/bash
set -e

curl -O https://raw.githubusercontent.com/grails/grails-guides/master/action-scripts/updateGuidesJson-and-push-gh-pages-script.sh
chmod 777 updateGuidesJson-and-push-gh-pages-script.sh
