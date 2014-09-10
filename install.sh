#!/bin/bash

echo "[+] Installing Pinwatcher..."

USERNAME=`id -u -n` # get the username
INSTALL_PATH=/Users/$USERNAME/Library/Application\ Support/Pinwatcher_ # setting the install path
PLIST_FILE="fr.raphaelyancey.pinwatcher.plist"

if [ -d "$INSTALL_PATH" ]; then
	echo "[+] Seems like Pinwatcher is already installed, aborting."
	exit 1
fi

echo "[-] Install path is "$INSTALL_PATH
echo "[-] Copying files and symlinking launchd job file"

# replacing the username in files
sed -i .bak "s/\[username\]/$USERNAME/g" fr.raphaelyancey.pinwatcher.plist
sed -i .bak "s/\[username\]/$USERNAME/g" pinwatcher.php
rm pinwatcher.php.bak
rm $PLIST_FILE.bak

mkdir "$INSTALL_PATH"
cp pinwatcher.php "$INSTALL_PATH"
cp $PLIST_FILE "$INSTALL_PATH"
ln -s $INSTALL_PATH/$PLIST_FILE /Users/$USERNAME/Library/LaunchAgent/$PLIST_FILE
ln -s $INSTALL_PATH/Pinwatcher.log /Users/$USERNAME/Library/Logs/Pinwatcher.log

echo "[-] Loading launchd job"

launchctl list | grep fr.raphaelyancey.pinwatcher 2>&1>/dev/null

# load only if it's not loaded
if [ $? = 0 ]; then
	echo "[+] Seems like Pinwatcher job is already loaded, aborting."
	exit 1
fi

launchctl load -w /Users/$USERNAME/Library/LaunchAgent/$PLIST_FILE

echo "[+] Installation done! Pins will be saved in your ~/Pictures folder."
#echo "(note: use uninstall.sh to uninstall)"

exit 0