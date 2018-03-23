###### MC's Charging Controller
###### mcc README ( 201803231 )
###### MCMotherEffin' @ XDA Developers

###### Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

##### Legal

* This file is a part of the project "MC's Charging Controller ( mcc )".

* I MCMotherEffin', hereby declare that mcc is originally distributed from
   me under the terms of the GNU GPL v3 and you are allowed to use, modify
   or re-distribute the work done for mcc under v3 or any later version of
   GNU GPL as published by the Free Software Foundation provided that this
   declaration and the above copyright is included.

* mcc was entirely written to help people extend their device's battery by
   controlling charging, without any kind of WARRANTY, and I will not take
   responsibility for any damage, or just anything bad happened.

* Finally, you should obtain a copy of the GNU GPL v3 from [here](http://gnu.org/licenses/).

### Links

* [Source Code](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)
* [Battery University](http://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_batteries)
* [Donate to Me](https://paypal.me/JayminSuthar)

### Introduction

* ##### Control when to enable / disable charging your device
* ##### Contains most basic things for extending battery life

### Usage

* You should use a terminal for interacting with the mcc, for
   a custom ROM, see 'Development settings'
* mcc checks every input for any little error, so don't worry
* Having a root shell is not necessary, but still recommended
* From a terminal, run 'mcc ARGS...', ARGS are detailed below

### Options

    [ -s / --switch ] [ -p / --shut ] [ -f / --force ] [ -e / --enable ]
    [ -d / --disable ] [ -ts / --auto-switch ] [ -tp / --auto-shut ]
    [ -dm / --daemon-mode ] [ -rd / --re-daemon ] [ -df / --default ]
    [ -i / --info ] [ -r / --rm-stats ] [ -rc / --reconf ] [ -h / --help ]

### Examples

* 'mcc -s 85 65'   -->   Sets auto switch thresholds to 85 65
* 'mcc -s 55'      -->   Sets auto switch up threshold to 55
* 'mcc -f -s 95'   -->   Force sets auto swi* up threshold 95
* 'mcc -p 15'      -->   Sets auto shut threshold to 15
* 'mcc -f -p 3'    -->   Force sets auto shut threshold to 3
* 'mcc -df'        -->   Resets all the thresholds to default
* 'mcc -ts'        -->   Toggles auto switch ON / OFF
* 'mcc -tp'        -->   Toggles auto shut ON / OFF
* 'mcc -dm'        -->   Toggles daemon mode ON / OFF
* 'mcc -rd'        -->   Launches the daemon unless running
* 'mcc -e 30s'     -->   Enables charging for 30 seconds
* 'mcc -d 45m'     -->   Disables charging for 45 minutes
* 'mcc -e 2h'      -->   Enables charging for 2 hours
* 'mcc -d 30%'     -->   Disables charging until 30 percents
* 'mcc -e 95%'     -->   Enables charging until 95 percents
* 'mcc -i'         -->   Shows info about current status
* 'mcc -r'         -->   Resets battery statistics
* 'mcc -rc'        -->   Re-configures sysfs references
* 'mcc -h'         -->   Shows this README page

### Miscellanous

* Auto switch and auto shut are part of the daemon mode, thus
   they can't be used without the daemon mode
* The [ -s / --switch ] argument automatically sets the lower
   threshold based on the higher one
* [ -rc / --reconf ] must be ran whenever you flash different
   kernel

### Remember

* mcc requires Magisk >= 1410 and 'MM' as installation medium
* Installation / [ -rc / --reconf ] requires charging enabled
* Installation / [ -rc / --reconf ] can take a few sec / mins
* Resetting battery stats might not work for some old devices

### Support / Bugs / Feature request

* All the support, bug, and feature related posts should take
   place in my official XDA thread
* Explain clearly what assistance you are seeking, mention me
   if required
* Explain clearly how the bug affects the program, mention me
   always so I can notice
* Explain clearly how the feature is to behave, mention me if
   required

### Thanks

* @topjohnwu for making such a platform
* Other resources of the scripting code
* Do not know why is the last one me ??

### Donate

* All of the work that I have done comes out of my free time,
  I am just a 17 year old student, who does it all as a hobby
  so if you like my works, and want to encourage further work
* Feel free to donate to me ( a lil tea, run 'mcc --donate' )

### Release Notes

##### 1.4.3

* Hi users,
* A small + sensitive release is here, which is aimed on some
  minor code errors, and a better way of eliminating failures
  due to interference with the daemon.
* All the bugs fixed are reported by users at XDA, and I will
  not detail them here, but "Please toggle auto switch OFF if
  compatibility check fails upgrading".
* What I am gonna detail is a new feature of the daemon. From
  this version on, mcc daemon can be paused with a lock file.
  Users, or anyone else, can create the file CACHE_DIR/lock_d
  and the daemon will go sleep until it exists. This is to be
  used by Installer, but not limited. So changelog reads...
* ...Fix 'Permission denied' while running mcc
* ...Fix daemon not launching for some devices
* ...Fix bad compatibility check failures
* ...Bring back initial 120 seconds delay
* ...Add a lock file to pause the daemon

##### 1.4.2

* Hi users,
* This is another lil bug fix release, which is to fix a very
  serious bug, which makes auto switch non-functional, thanks
  to @pat357 for pointing the buggy thing out and providing a
  quick fix
