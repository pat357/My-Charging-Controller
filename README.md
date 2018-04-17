###### My Charging Controller
###### mcc README (201804171)
###### JayminSuthar @ xda-developers

###### Copyright (c) 2018 Jaymin Suthar. All rights reserved.

## Legal

* This file is a part of "My Charging Controller (mcc)".

* mcc is released under the terms of the GNU GPL v3, as been
   published by the Free Software Foundation. And permission
   hereby is granted to use, modify or redistribute it maybe
   partially or entirely under GPLv3 only.

* mcc was written in a hope of being useful. And any kind of
   WARRANTY is NOT provided. And I can't be held responsible
   for anything caused by it.

* You should already have received a copy of GPLv3 with mcc,
   if not, see <http://www.gnu.org/licenses/>.

## Links

* [Git Repository](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)

## Introduction

* #### Control how to charge your battery in an advanced way

## Usage

* A good way of using mcc is from a Terminal. Custom ROMs do
   have one under 'Development settings'
* mcc does not require a root shell, but having is better so
* From a Terminal, run 'mcc [OPTIONS] [ARGUMENTS]', see them
   below

## Options

* [-f/--force] [-s/--switch] [-p/--shut] [-rt/--default]
* [-ts/--auto-switch] [-tp/--auto-shut]
* [-e/--enable] [-d/--disable] [-rd/--re-daemon]
* [-r/--rm-stats] [-c/--clean] [-rc/--reset-cfg]
* [-i/--info] [-h/--help]

## Arguments

* 'mcc -s 85 65'   -->   Set auto switch thresholds to 85 65
* 'mcc -s 55'      -->   Set auto switch up threshold to 55
* 'mcc -f -s 95'   -->   Force set auto swi* up threshold 95
* 'mcc -p 15'      -->   Set auto shut threshold to 15
* 'mcc -f -p 3'    -->   Force set auto shut threshold to 3
* 'mcc -rt'        -->   Reset all thresholds to defaults
* 'mcc -e 30s'     -->   Enable charging for 30 seconds
* 'mcc -d 45m'     -->   Disable charging for 45 minutes
* 'mcc -e 2h'      -->   Enable charging for 2 hours
* 'mcc -d 30%'     -->   Disable charging until 30 percents
* 'mcc -e 95%'     -->   Enable charging until 95 percents
* 'mcc -e/-d'      -->   Enable/Disable charging for ever
* 'mcc -ts'        -->   Toggle auto switch ON / OFF
* 'mcc -tp'        -->   Toggle auto shut ON / OFF
* 'mcc -rd'        -->   Launch the daemon unless running
* 'mcc -r'         -->   Reset battery statistics
* 'mcc -c'         -->   Clean mcc processes and files
* 'mcc -rc'        -->   Reconfigure mcc internals
* 'mcc -i'         -->   Show info about current status
* 'mcc -h'         -->   Show this README page

## Tips/Misc...

* The [-s/--switch] option will automatically figure out the
   other threshold based on the given
* All mcc tasks are done in background, so you can close the
   Terminal leaving mcc running
* For longer operations, you might disable logging by giving
   env variable no_ver_logs=true
* If you need to pause the daemon, create an emply file with
   path MOUNTPOINT/mcc/lock
* If you see 'mcc internals are not properly configured', do
   run [-rc/--reset-cfg]

## Remember

* mcc requires Magisk >= 1400 and installs by Magisk Manager
* mcc Installer/[-rc/--reset-cfg] requires charging ON while
   taking a few minutes
* Resetting battery stats may not work for a few old devices

## Support/Discussions

* Please use the support thread for discussions, bug reports
   and other queries
* Please post details and do mention me whenever is required

## Encourage Me

* Please hit 'Thanks' on the support thread if you like this
   Project as it took me painful hours creating it

## Release Notes

#### 2.0

* This version is re-written from scratch, so please perform
   a CLEAN INSTALLATION.
