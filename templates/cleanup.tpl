#!/bin/bash
while read -r line; do declare  "$line"; done <file
ssh-keygen -f ~/.ssh/known_hosts -R `cat ./.dots/${vars.module_name}_ipv4`
rm -rf .dots/ansible
exit 0