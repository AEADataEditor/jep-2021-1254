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
echo "init done."