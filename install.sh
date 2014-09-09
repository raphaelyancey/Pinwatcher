#!/bin/bash

echo "[+] Installing Pinwatcher..."

cd ~
USERPATH=`pwd`
INSTALLPATH=$USERPATH/Library/Application\ Support/Pinwatcher
PLIST_FILE="fr.raphaelyancey.pinwatcher.plist"

if [ -d "$INSTALLPATH" ]; then
	echo "[+] Seems like Pinwatcher is already installed, aborting."
	exit 1
fi

echo "[-] Install path is "$INSTALLPATH
echo "[-] Copying files and symlinking launchd job file"

cp pinwatcher.php $INSTALLPATH
cp $PLIST_FILE $INSTALLPATH
ln -s $INSTALLPATH/$PLIST_FILE $USERPATH/Library/LaunchAgent/$PLIST_FILE

echo "[-] Loading launchd job"

launchctl list | grep fr.raphaelyancey.pinwatcher 2>&1>/dev/null

# load only if it's not loaded
if [ $? = 0 ]; then
	echo "[+] Seems like Pinwatcher job is already loaded, aborting."
	exit 1
fi

launchctl load -w $USERPATH/Library/LaunchAgent/$PLIST_FILE

echo "[+] Installation done! Use uninstall.sh to uninstall."

exit 0