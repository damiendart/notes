<!--
  ---
  author: Damien Dart
  author_website: https://www.robotinaponcho.net/
  description: Damien Dart's notes on setting up, using, and troubleshooting Synology DiskStations.
  javascript_external: /assets/prettydate.js
  title: Synology Notes
  ---
-->

Synology Notes
==============

<div class="admonition admonition--metadata">
  <ul class="metadata-list">
    <li class="metadata-list__item"><b>Last Updated</b>: <i>See accompanying <code>addlastupdated</code> script.</i></li>
    <li class="metadata-list__item">
      <b>Licence</b>: <a href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>
    </li>
  </ul>
</div>


Setting up a Synology DiskStation
---------------------------------

  - Ensure the DiskStation is given a static IP.
  - Instead of using the default _admin_ account, create a new user and
    give them admin privileges, then disable both the default _admin_
    and any guest accounts.
  - Enable SMB 3 in the _File Services_ control panel in DSM.
  - Hide the _homes_ shared folder in "My Network Places" by setting the
    adforementioned option in the _Shared Folder_ control panel in DSM.
    This is purely for aesthetic purposes.
  - Go through the _Security_ control panel in DSM. (Check the control
    panel on a regular basis for new features.)
  - When creating folders, remember to set reasonable permissions.
  - Use rsync to transfer files. If using a different copying method,
    rsync's dry-run mode with the `c` flag can be used to check
    everything has copied correctly.
  - Run the _Security Advisor_ to see if anything else needs attention,
    and enable the regular scan schedule to perform a weekly scan.
  - Make sure daily backup stuff (S3, external hard-drive) is set up.
  - Git from the _Package Center_ in DSM craps out whenever you tried to
    do anything via HTTPS. Fortunately, the [solution is simple][3]:
    download [a recent CA Root certificate bundle][4] to your
    DiskStation and point Git to it by setting `http.sslCAinfo` to the
    location of that file in your global or system-wide _.gitignore_.
  - Set up custom scheduled tasks.
    - Use [getmail][5] to backup email every three hours.
    - Use [mirrorgithub][6] to backup public GitHub repositories daily.
    - Use [pinboardbackup][7] to backup Pinboard bookmarks daily.
    - Even with NTP synchronisation enabled in DSM's _Regional Options_
      control panel the date and time will occasionally get out of sync.
      Creating a daily scheduled task to run the `ntpdate -u -b
      [SOME-NTP-SERVER]` command as root seems to keep things in check.
    - Daily and weekly scheduled tasks should be run at night.
  - Manually downloaded Python packages are regularly removed as part of
    some updates, so when reinstalling save time by keeping any source
    code in _~/src_ or any easily reachable folder.
  - When setting up DNS-O-Matic DDNS support in the _External Access_
    control panel, use `all.dnsomatic.com` for the hostname and replace
    any `@` characters in the username with `%30`.
  - If using _File Station_'s shared links functionality, ensure the
    _Advanced_ tab in the _External Access_ control panel is filled out
    so that correct URLs are generated.
  - Enable bad sector and disk lifespan warnings in _Storage Manager_.

[3]: <http://stackoverflow.com/a/8467406>
[4]: <http://curl.haxx.se/ca/cacert.pem>
[5]: <http://pyropus.ca/software/getmail/>
[6]: <https://www.robotinaponcho.net/git/#robotinaponcho>
[7]: <https://www.robotinaponcho.net/git/#toolbox>

Miscellaneous things
--------------------

  - The _Task Scheduler_ control panel in DSM doesn't tell you whether a
    task's last run failed or succeeded.  Running the command
    `synoschedtask --get` provides detailed information about tasks,
    including their last run statuses.
  - Extracting _tar.gz_ files with tar: `tar -zxvf [FILENAME]` (I'm
    always forgetting the combination of flags).
