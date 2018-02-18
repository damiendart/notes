---
file_comment: |
  "synology.md" from Damien Dart's notes.

  Copyright (C) 2014-2018 Damien Dart, <damiendart@pobox.com>.
  This work is licensed under the Creative Commons Attribution 4.0
  International License. To view a copy of this license, visit
  <http://creativecommons.org/licenses/by/4.0/> or send a letter to
  Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
layout: note
page_description: View Damien Dart's notes on Synology devices.
page_licence: Creative Commons Attribution 4.0 International License
page_licence_website: "http://creativecommons.org/licenses/by/4.0/"
---

Synology Notes
==============


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
    do anything via HTTPS. Fortunately, the [solution is simple][1]:
    download [a recent CA Root certificate bundle][2] to your
    DiskStation and point Git to it by setting `http.sslCAinfo` to the
    location of that file in your global or system-wide _.gitignore_.
  - Set up custom scheduled tasks.
    - Use [getmail][3] to backup email every three hours.
    - Use [mirrorgithub][4] to backup public GitHub repositories daily.
    - Run [nfsnddns][5] hourly to have poor-man's dynamic DNS
      functionality with NearlyFreeSpeech.NET-managed domains.
    - Use [pinboardbackup][6] to backup Pinboard bookmarks daily.
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

[1]: <http://stackoverflow.com/a/8467406>
[2]: <http://curl.haxx.se/ca/cacert.pem>
[3]: <http://pyropus.ca/software/getmail/>
[4]: <https://www.robotinaponcho.net/git/?p=robotinaponcho.git;a=blob;f=bin/mirrorgithub>
[5]: <https://www.robotinaponcho.net/git/?p=toolbox.git;a=blob;f=nfsnddns>
[6]: <https://www.robotinaponcho.net/git/?p=toolbox.git;a=blob;f=pinboardbackup>

Miscellaneous things
--------------------

  - The _Task Scheduler_ control panel in DSM doesn't tell you whether a
    task's last run failed or succeeded.  Running the command
    `synoschedtask --get` provides detailed information about tasks,
    including their last run statuses.
  - Extracting _tar.gz_ files with tar: `tar -zxvf [FILENAME]` (I'm
    always forgetting the combination of flags).
