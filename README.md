Pinwatcher
==========

## NOTE: installation script does not work as expected. Please install by filling your username in the `php` and `plist` files and manually loading the `plist` file with `launchctl -w file]`.

Pinwatcher is a little script that allows you to regularly backup Pinterest pictures from a profile to your drive.

*****

### What does it do?

Pinwatcher retrieve, **every hours** (by default), the last **50 pins** of a Pinterest user's profile and save only new pins to the local drive.

*****

### Requirements
- Command-line `php`
- Job manager (`cron` for example, or `launchd` under OS X)

*****

### Installation (OS X)

*(tested on OS X 10.9 only)*

* Open your shell client (`Terminal.app` for example)
*  Go to your freshly downloaded `Pinwatcher`directory
> `cd /path/to/Pinwatcher`

* Execute the installation script
> `sh install.sh` 

* You can now delete the folder if you wish, as Pinwatcher is installed in `~/Library/Application Support/Pinwatcher` 
> `cd .. && rm -rf Pinwatcher/`

**Pinwatcher will check every hour (by default) if new pictures have been pinned to the specified user's profile and save them!**

*****

### Installed files

Every installed files are in the following directory
> `~/Application Support/Pinwatcher`

Symbolic links are created to
> ` ~/Library/LaunchAgents/`
> `~/Library/Logs/`

 *****

### TODO

* Uninstall script
