#!/bin/bash
set -e
git config --global push.default simple # we only want to push one branch — master
# specify the repo on the live server as a remote repo, and name it 'production'
# <user> here is the separate user you created for deploying
git remote add production ssh://lsalazar@173.255.204.36/usr/share/nginx/html/docteamdemosite2
git push production master # push our updates
gatsby build
