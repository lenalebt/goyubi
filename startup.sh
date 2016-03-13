#!/bin/bash
set -e

gpg-agent --daemon --enable-ssh-support --write-env-file ~/.gpg-agent-info > ~/.bashrc 2>/dev/null
PUBLIC_KEY_ID=$(gpg --card-status | grep "Signature key" | sed -e 's/Signature key ....: //' | sed -e 's/ //g')
echo "importing public key \"$PUBLIC_KEY_ID\" from smartcard"
gpg --keyserver pool.sks-keyservers.net --recv-keys $PUBLIC_KEY_ID 2>&1 >/dev/null
echo -n "syncing gpg database with smartcard..."
gpg --card-status >/dev/null
echo "done"
echo "setting ultimate ownertrust for public key that is connected to smart card..."
echo ${PUBLIC_KEY_ID}:6: | gpg --import-ownertrust
echo "done"
alias gpg='gpg --armor'
bash                    
