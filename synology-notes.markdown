Synology Notes
==============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Setting up a Synology DiskStation
---------------------------------

### Setup Stuff I Might Forget To Do

  - Ensure the DiskStation is given a static IP.
  - Instead of using the default _admin_ account, create a new user and
    give them admin privileges, then disable both the default _admin_
    and any guest accounts.
  - Enable SMB 3 in the _File Services_ control panel in DSM.
  - Go through the _Security_ control panel in DSM.
  - When creating folders, remember to set reasonable permissions.
  - Use rsync to transfer files. If using a different copying method,
    rsync's dry-run mode with the `c` flag can be used to check
    everything has copied correctly.
  - Run the _Security Advisor_ to see if anything else needs attention,
    and enable the regular scan schedule to perform a weekly scan.
  - Make sure daily backup stuff (S3, external hard-drive) is set up.
  - The Git build from the _Package Center_ in DSM craps out whenever
    you tried to do anything via HTTPS. Fortunately, the [solution is
    simple][4]: download [a recent CA Root certificate bundle][5] to
    your DiskStation and point Git to it by setting `http.sslCAinfo` to
    the location of that file in your global or system-wide
    _.gitignore_.
  - Daily and weekly scheduled tasks should be run at night.
    - Use [getmail][3] to backup email every three hours.
    - Backing up remote Git repositories: After creating mirrors, create
      a daily scheduled task to run the `/bin/su - root -c 'for DIR in
      [LOCATION-OF-REPOS]*.git; do [ -d "$DIR" ] && cd $DIR && [ -e
      "FETCH_HEAD" ] && git fetch --q; done'` command.
    - I'm not sure how prevalent this is, but even with NTP
      synchronisation enabled in DSM's _Regional Options_ control panel
      the date and time will occasionally get out of sync. Creating a
      daily scheduled task to run the `ntpdate -u -b [SOME-NTP-SERVER]`
      command as root seems to keep things in check.
  - When setting up DNS-O-Matic DDNS support in the _External Access_
    control panel, use "all.dnsomatic.com" for the hostname. 

[3]: <http://pyropus.ca/software/getmail/>
[4]: <http://stackoverflow.com/a/8467406>
[5]: <http://curl.haxx.se/ca/cacert.pem>

Miscellaneous Things
--------------------

  - The _Task Scheduler_ control panel in DSM doesn't tell you whether a
    task's last run failed or succeeded.  Running the command
    `synoschedtask --get` provides more information about tasks,
    including their last run statuses.
  - Extracting _tar.gz_ files with tar: `tar -zxvf [FILENAME]` (I'm
    always forgetting the combination of flags).
