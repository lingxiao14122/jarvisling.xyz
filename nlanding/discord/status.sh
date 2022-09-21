#!/bin/bash

##
# Website status check script
# Author: Jarvis Ling
# Date: 20/6/2021
##

discord_hook="https://discord.com/api/webhooks/856556156394012703/O7YWUapQ_gSrBj6ThUZTzrsOBLwYD9-5LvniLVET-jpzxCK7L91k6IfKoeZcfazfZCD8"

websites_list="http://status.jarvisling.xyz/"

DATE=`date`

for website in ${websites_list} ; do
        status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${website})
        echo $status_code
        CPULOAD=$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]

    if [[ "$status_code" -ne 200 ]] ; then
        # POST request to Discord Webhook with the domain name and the HTTP status code
        curl -H "Content-Type: application/json" -X POST -d '{"content":"'" ${DATE} ${website} returned: ${status_code} 🔴 ⚠ \n CPU Load : ${CPULOAD}"'"}' $discord_hook
    else
        curl -H "Content-Type: application/json" -X POST -d '{"content":"'" ${DATE} ${website} returned: ${status_code} 🔴 ⚠ \n CPU Load : ${CPULOAD}"'"}' $discord_hook
        echo "${website} is running! 🟢"
    fi
done
