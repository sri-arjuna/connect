Connect 0.3
===========

After I had written single scripts to connect to SAMBA, a NAS/SAN (cifs), and several wifi attempts,
that after the final working wifi script, i decided to start collecting them under a single project.

Connect was born.



What does it do?
----------------

After you have configured a given task, it connects as easy as:

	connect <TASK> <LABEL>

Where TASK currently is either **nas** or **wifi**.



Labels, what for?
-----------------

Regardless of where you are, you dont have to remember the proper AP its name, 
you simply use the label to describe your location.

Reserved words are:

*) start
*) stop
*) status
*) restart
*) new
*) link

A lazy way could be, you're at your friends residence, so you simply put his name, lets say ***Gregory*** as label.

When you're at him, you simply call:

	connect wifi greg



Troubleshoot:
-------------

If you should not be able to connect to wifi, be sure no daemon hung up itself:

	connect wifi restart
	
If you should not be able to connect to your NAS, be sure it is powered up and connected.

Also, if there was a kernel reboot, you must reboot first.



Dependencies:
-------------

This tool requires these packages/programs:
*)	wpa_supplicant
*)	dhpcd
*)	cifs-utils
*)	[TUI](https://github.com/sri-arjuna/tui)