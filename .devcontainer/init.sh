#!/bin/sh
if [ ! -f stata.lic ]
 then
    if [ -z ${STATA_LIC_BASE64} ]
    then
        echo "No license found."
    else
        echo "${STATA_LIC_BASE64}" | base64 -d > stata.lic 
    fi
fi
# Install rclone
curl https://rclone.org/install.sh | sudo bash
# done.
echo "init done."