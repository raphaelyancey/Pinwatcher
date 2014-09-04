Pinwatcher
==========

Pinwatcher is a little script that allows you to regularly backup Pinterest pictures from a profile to your drive.

*****

### What does it do?

Pinwatcher retrieve, **every 3 hours** (by default), the last **50 pins** of a Pinterest user's profile and save only new pins to the local drive.

*****

### Requirements
- command-line `php`
- a job manager (`cron` for example, or `launchd` under OS X)

*****

### Installation (OS X)

A `.plist` file is included for loading into `launchd` (OS X job manager) and run Pinwatcher script every 3 hours.

* Edit `pinwatcher.php` and specify the Pinterest username and the path where the pictures will be saved
* Edit the `.plist` file and specify the path of `pinwatcher.php`.
* Load the `.plist` into `launchd` by executing the following command: `launchctl load -w /path/to/fr.raphaelyancey.pinwatcher.plist`
(enter the actual path to the `.plist` file)

Now, Pinwatcher will check every 3 hours (by default) if new pictures have been pinned to the specified user's profile and save them!