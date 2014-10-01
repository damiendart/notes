Synology Notes
==============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Setting up a Synology DS213j
----------------------------

### First-time Setup Stuff I Might Forget

This list is by no means exhaustive and a lot of this will seem obvious,
but I'll probably forget at least half of this when I have to set up
another Synology DiskStation.

  - Make sure your router is configured to give your Synology
    DiskStation a static IP.
  - Instead of using the default _admin_ account, create a new user and
    give them admin privileges and SSH access (by editing /etc/passwd).
    Afterwards, disable both the default _admin_ and guest accounts.
  - Go through the _Security_ control panel in DSM.
  - When creating folders, remember to set reasonable permissions.
  - If transferring a bunch of files from OS X remember to disable
    .DS\_Store file creation on network shares. Similarly, strip out all
    Desktop.ini-type files if working in Windows. Also, use rsync
    where possible (you can use rsync's dry-run mode to check everything
    has copied correctly if you've used a different copying method;
    remember to use the _c_ flag to use checksums to compare files).
  - Perl requires a compiler, so I don't bother with it.
  - Make sure backup stuff is set up.
  - This might be DS213j-specific, but even with NTP synchronisation
    enabled in DSM's _Regional Options_ control panel the date and time
    will occasionally get out of sync. Creating a daily scheduled task
    to run the `ntpdate -u -b [NTP-SERVER]` command as root seems to
    keep things in check.
  - Other modifications:
    - Backing up email: Use [getmail][3] (requires Python, available
      from the _Package Center_).
    - Backing up remote Git repositories: Use Git (see _Fixing Git_) to
      create mirrors (remember to use the `--mirror` flag) and create an
      daily scheduled task to run the `/bin/su - [ADMIN-USER] -c 'for
      DIR in [LOCATION-OF-REPOS]*.git; do [ -d "$DIR" ] && cd $DIR && [
      -e "FETCH_HEAD" ] && git fetch --q; done'` command as root.

[3]: <http://pyropus.ca/software/getmail/>

### Fixing Git

Git is available from the _Package Center_ in DSM, however it would
crap out whenever you tried to do anything via HTTPS. Fortunately, the
[solution is simple][4]: download <http://curl.haxx.se/ca/cacert.pem>
and point Git to it by setting `http.sslCAinfo` to the location of that
file in your global or system-wide _.gitignore_.

[4]: <http://stackoverflow.com/a/8467406>


Miscellaneous Things
--------------------

  - The Task Scheduler control panel in DSM doesn't give any indication
    as to whether a task's last run failed or succeeded. Running the
    command `synoschedtask --get` provides more information about tasks,
    including their last run statuses.
