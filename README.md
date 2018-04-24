###### My Charging Controller
###### mcc README (201804241)
###### JayminSuthar @ xda-developers

###### Copyright (c) 2018 Jaymin Suthar. All rights reserved.

## Legal

* This file is a part of "My Charging Controller (mcc)".

* mcc is released under the terms of the GNU GPL v3, as been
   published by the Free Software Foundation. And permission
   hereby is granted to use, modify or redistribute it maybe
   partially or entirely under GPLv3 only.

* mcc was written in a hope of being useful. And any kind of
   WARRANTY is NOT provided. See GPLv3 for details.

* You should already have received a copy of GPLv3 with mcc,
   if not see <http://www.gnu.org/licenses/>.

## Links

* [Git Repository](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)

## Introduction

* #### Control how to charge your device in a better manner.

## Usage

* mcc can be ran from a terminal, i.e. Termux is a good one.
* mcc doesn't require root shell, that mcc'd acquire itself.

*                 mcc [OPTIONS] [ARGUMENTS]

## Setup

* Install mcc from either Magisk Manager or custom recovery.
* Open terminal and run 'mcc; mcc -rc' to set mcc internals.
* mcc's setup! Now launch mcc daemon using the [-rd] option.

## Options

* [-f] [-s] [-p] [-rt] [-ts] [-tp] [-e] [-d]
* [-rd] [-r] [-c] [-rc]
* [-i] [-h]

## Examples

* 'mcc -s 85 65'   -->   auto_switch: set limits: 85 and 65.
* 'mcc -s 55'      -->   auto_switch: set limits: 55 and IN.
* 'mcc -f -s 95'   -->   auto_switch: force limits: 95, IN.
* 'mcc -p 15'      -->   auto_shut: set threshold: 15.
* 'mcc -f -p 3'    -->   auto_shut: force threshold: 3.
* 'mcc -rt'        -->   auto_switch, auto_shut: revert all.
* 'mcc -e 30s'     -->   session: enable for time: 30 secs.
* 'mcc -d 45m'     -->   session: disable for time: 45 mins.
* 'mcc -e 2h'      -->   session: enable for time: 2 hours.
* 'mcc -d 30%'     -->   session: disable until level: 30.
* 'mcc -e 95%'     -->   session: enable until level: 95.
* 'mcc -e/-d'      -->   session: en/disable: unconditional.
* 'mcc -ts'        -->   toggle: turn ON/OFF: auto_switch.
* 'mcc -tp'        -->   toggle: turn ON/OFF: auto_shut.
* 'mcc -rd'        -->   utilities: resume mcc daemon.
* 'mcc -r'         -->   utilities: reset batterystats.
* 'mcc -c'         -->   utilities: remove: processes, tmp.
* 'mcc -i'         -->   general: show info: current stats.
* 'mcc -h'         -->   general: show info: this README.
* 'mcc -rc'        -->   core: reconfigure mcc internals.

## Tips/Misc...

* You can leave the lower threshold for [-s], mcc is clever.
* You can close the terminal, mcc executes it in background.
* You can disable logs by setting in env no_ver_logs = true.
* You can touch file MOUNTPOINT/mcc/lock to lock mcc daemon.
* You can reconfigure mcc internals with given [-rc] option.

## Remember

* Device must be charging while reconfiguring mcc internals.
* Touching /cache/mcc_noo is needed if [-rc] reboots device.
* Resetting batterystats might not work for few old devices.

## Support/Discussions

* You can get support from the community at OFFICIAL thread.

## Encourage Me

* You can encourage me by hitting the threads THANKS button.

## Release Notes

#### 2.1

* Placeholder
