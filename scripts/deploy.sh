#!/bin/bash
#set -e
#eval "$(ssh-agent -s)" # Start ssh-agent cache
#chmod 600 scripts/id_rsa # Allow read access to the private key
#ssh-add .scripts/id_rsa # Add the private key to SSH
set -x
#git checkout master

gatsby build

git config --global push.default simple # we only want to push one branch — master
rm -f .gitignore
cp scripts/deployignore .gitignore
# specify the repo on the live server as a remote repo, and name it 'production'
# <user> here is the separate user you created for deploying
#git remote add production ssh://lsalazar@173.255.204.36:/usr/share/nginx/html/docteamdemosite2
git remote add production ssh://lsalazar@173.255.204.36:/home/lsalazar/gatsbybare.git
git add . && git commit -m "Gatsby build"
#git push production master # push our updates
git push -f production HEAD:master
#gatsby build
