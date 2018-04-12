###### MC's Charging Controller
###### mcc README ( 201804111 )
###### MCMotherEffin' @ XDA Developers

###### Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

## Legal

* This file is a part of the project "MC's Charging Controller ( mcc )".

* I MCMotherEffin', hereby declare that mcc is originally distributed from
   me under the terms of the GNU GPL v3 and you are allowed to use, modify
   or re-distribute the work done for mcc under v3 or any later version of
   GNU GPL as published by the Free Software Foundation provided that this
   declaration and the above copyright notice is included.

* mcc was entirely written for helping people extend their batteries' life
   by controlling charging, without any kind of WARRANTY, and I can not be
   held responsible for any damage, or just anything bad happened.

* Finally, you should have received a copy of the GPL v3 with mcc, if not,
   see <http://gnu.org/licenses/>.

## Links

* [Source Code](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)

## Introduction

* #### Control when to enable / disable charging your battery
* #### With most of things required to extend batteries' life

## Usage

* You should use a terminal for interacting with the mcc, for
  a custom ROM, see 'Development settings'
* mcc checks every input for any little error, so don't worry
* Having a root shell is not necessary, but still recommended
* From a terminal, run 'mcc ARGS...', ARGS are detailed below

## Options

* [ -f / --force ] [ -s / --switch ] [ -p / --shut ]
* [ -e / --enable ] [ -d / --disable ]
* [ -ts / --auto-switch ] / [ -tp / --auto-shut ] /
  [ -dm / --daemon-mode ]
* [ -rd / --re-daemon ] / [ -df / --default ] /
  [ -r / --rm-stats ]
* [ -i / --info ] / [ -h / --help ]
* [ -ri / --reset-int ]

## Examples

* 'mcc -s 85 65'   -->   Sets auto switch thresholds to 85 65
* 'mcc -s 55'      -->   Sets auto switch up threshold to 55
* 'mcc -f -s 95'   -->   Force sets auto swi* up threshold 95
* 'mcc -p 15'      -->   Sets auto shut threshold to 15
* 'mcc -f -p 3'    -->   Force sets auto shut threshold to 3
* 'mcc -df'        -->   Resets all thresholds to defaults
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
* 'mcc -ri'        -->   Resets mcc internal configurations
* 'mcc -h'         -->   Shows this README page

## Miscellanous

* Auto switch and auto shut are part of the daemon mode, thus
  they can't be used without the daemon mode
* The [ -s / --switch ] option will automatically figure down
  threshold based on the up one
* [ -ri / --reset-int ] must be ran after you flash different
  kernel

## Remember

* mcc requires Magisk >= 1410 and 'MM' as installation medium
* mcc Installer expects MagiskHide disabled, or it'd conflict
* mcc Installer or [ -ri / --reset-int ] requires charging ON
* Installation / [ -ri / --reset-int ] can take a few minutes
* Resetting battery stats might not work for some old devices

## Support / Bugs / Feature request

* All the support, bug, and feature related posts should take
  place in my official XDA thread
* Explain clearly what assistance you are seeking, mention me
  if required
* Explain clearly how the bug affects the program, mention me
  always so I can notice
* Explain clearly how the feature is to behave, mention me if
  required

## Thanks

* @topjohnwu for making such a platform
* Other resources of the scripting code
* I don't know why is the last one me??

## Encourage Me

* I don't accept donation, so if you like my work, please hit
  the 'Thanks' button on the official thread to encourage me.

## Release Notes

#### 1.6

* Placeholder

#### 1.5.1.MR

* Hi users,
* This build is to fix two major bugs which I identified just
  now. First is the well-known, conflict of the mcc Installer
  and the mcc daemon, and the second is the daemon misbehaves
  if refs are not set or the lock file is created. Both of em
  have been fixed. While the first prevents mccs installtion,
  the second causes unwanted reboots for cases while the user
  has misused the lock file feature or have modified the conf
  file. After this fixations, I can proudly say that mcc does
  not have no bugs now...
* Another thing is that mcc now patches the Main before Magic
  mounting has happened, so in theory, there will not be need
  to make any modifications if Magisk changes its mount point
  again, just enjoy!!! Regarding boot scripts, they log their
  errors now too as well as commands executed.
* And also while some advanced users did directly run the mcc
  daemon, I have also prevented the daemon from running, only
  mcc internals can fork it, and that should be when required
  by mcc. This blocking also helps the initial daemon call on
  the boot a great algorithmic space, so is great.
