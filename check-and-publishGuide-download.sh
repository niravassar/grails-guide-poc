###################################
# Downloads the reusable scripts from infrastructure and invokes them
###################################

#!/bin/bash
set -e

curl -O https://raw.githubusercontent.com/grails/grails-guides/master/action-scripts/check-and-publishGuide-script.sh
chmod 777 check-and-publishGuide-script.sh
