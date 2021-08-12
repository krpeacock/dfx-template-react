Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@krpeacock 
aviate-labs
/
workspace
1
0
0
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
workspace/files/setup.sh
@di-wu
di-wu Add Dockerfile.
Latest commit 72e90a2 1 hour ago
 History
 1 contributor
32 lines (24 sloc)  628 Bytes
  
#!/bin/sh

echo ""
echo "| USER CONFIG"
echo ""

name="you"
printf "User Name (%s): " "${name}"
read -r val
test -n "${val}" && name="${val}"

userid="1000"
group="${name}"
groupid="1000"
home="/home/${name}"
shell="/bin/bash"

test -d "/home/${name}" || mkdir "/home/${name}"

groupadd -g "${groupid}" "${group}"
useradd -s "${shell}" -d "${home}" -u "${userid}" -g "${groupid}" "${name}"
echo "${name} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
chown -R "${name}:${group}" "${home}"

echo ""
echo "| SETTING UP USER..."
echo ""

rsync -qavz /root/ "/home/${name}"
rsync -qavz /workspace/ "/home/${name}"

exec su - "${name}"
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete
