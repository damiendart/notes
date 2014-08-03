Synology Notes
==============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Miscellaneous Things
--------------------

  - The Task Scheduler control panel in DSM doesn't give any indication
    as to whether a task's last run failed or succeeded. Running the
    command `synoschedtask --get` provides more information about tasks,
    including their last run statuses.
  - If the date and time keeps getting out of sync, even with NTP server
    syncronisation enabled in DSM's _Regional Options_ control panel,
    creating a daily scheduled task to run the `ntpdate -u -b [your NTP
    server of choice]` command as root seems to keep things in check.
