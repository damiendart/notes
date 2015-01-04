Synology Notes
==============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Setting up a Synology DiskStation
---------------------------------

### Kinda-obvious Setup Stuff I Might Forget To Do

  - Ensure the Synology DiskStation is given a static IP.
  - Instead of using the default _admin_ account, create a new user and
    give them admin privileges, then disable both the default _admin_
    and any guest accounts.
  - Go through the _Security_ control panel in DSM.
  - When creating folders, remember to set reasonable permissions.
  - Use rsync to transfer files. If using a different copying method,
    rsync's dry-run mode with the `c` flag can be used to check
    everything has copied correctly.
  - Make sure backup stuff (S3, external hard-drive) is set up.
  - I'm not sure how prevalent this is, but even with NTP
    synchronisation enabled in DSM's _Regional Options_ control panel
    the date and time will occasionally get out of sync. Creating a
    daily scheduled task to run the `ntpdate -u -b [SOME-NTP-SERVER]`
    command as root seems to keep things in check.
  - Daily scheduled tasks should be run at night, where possible.
  - Run the _Security Advisor_ to see if anything else needs attention.
  - Backing up email: Use [getmail][3].
  - Backing up remote Git repositories: Use Git (see _Fixing Git_) to
    create mirrors (use the `--mirror` flag) and create an
    daily scheduled task to run the `/bin/su - root -c 'for DIR
    in [LOCATION-OF-REPOS]*.git; do [ -d "$DIR" ] && cd $DIR && [ -e
    "FETCH_HEAD" ] && git fetch --q; done'` command.

[3]: <http://pyropus.ca/software/getmail/>

### Fixing Git

The Git build from the _Package Center_ in DSM craps out whenever you
tried to do anything via HTTPS. Fortunately, the [solution is
simple][4]: download <http://curl.haxx.se/ca/cacert.pem> and point Git
to it by setting `http.sslCAinfo` to the location of that file in your
global or system-wide _.gitignore_.

[4]: <http://stackoverflow.com/a/8467406>


Miscellaneous Things
--------------------

  - The _Task Scheduler_ control panel in DSM doesn't tell you whether a
    task's last run failed or succeeded.  Running the command
    `synoschedtask --get` provides more information about tasks,
    including their last run statuses.
  - Extracting _tar.gz_ files with tar: `tar -zxvf [FILENAME]` (I'm
    always forgetting the combination of flags).
