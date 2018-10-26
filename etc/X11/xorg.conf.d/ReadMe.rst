xorg.conf
################################################################################

File Map
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
====== ===============
Prefix Description
------ ---------------
00-09  Global Settings
10-19  GPUs
20-29  Monitors
30-39  Screens
40-49  Input
50-59  Layouts
60-99  (Reserved)
====== ===============

Notes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
- Make sure to remove the files in ``/usr/share/X11/xorg.conf.d``, as these
  conflict with the files in this directory, and there is no elegant way to
  disable reading them.  
  There is a bash script in this directory, which can be used to move said files
  into a backup dir;  and back thence, if run again.
- You may need to tweak certain files for your particular installation and
  preferences.
