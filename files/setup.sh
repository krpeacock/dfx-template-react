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
