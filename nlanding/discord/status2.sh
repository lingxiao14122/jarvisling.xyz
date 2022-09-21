#!/bin/bash

##
# Website status check script
# Author: Jarvis Ling
# Date: 20/6/2021
##

discord_hook="https://discord.com/api/webhooks/856034529894858752/Iu8lmGU5Czosc2qhc4MNIkHICxq_iJoyCEBjJGCrA4oyy7Mduz8uf5bWwl2-oXsaaYCu"

websites_list="https://www.jarvisling.xyz/test"

# DATE=`date`

# # for website in ${websites_list} ; do
        status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${websites_list})
#         echo $status_code
        

#     if [[ "$status_code" -ne 200 ]] ; then
#         # POST request to Discord Webhook with the domain name and the HTTP status code
        curl -H "Content-Type: application/json" -X POST -d '{"content":"'" DATE \n websites_list returned: status_code 🔴 ⚠ \n CPU LOAD: CPULOAD"'"}' $discord_hook
        echo "discord done"
    # else
    #     echo "${website} is running! 🟢"
    # fi
# done
