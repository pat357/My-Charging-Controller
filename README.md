###### MC's Charging Controller
###### mcc README ( 201803161 )
###### MCMotherEffin' @ XDA Developers

###### Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

##### Legal

* This file is a part of the project "MC's Charging Controller ( mcc )"

* I MCMotherEffin', hereby declare that mcc is originally distributed from
   me under the terms of the GNU GPL v3 and you are allowed to use, modify
   or re-distribute the work done for mcc under v3 or any later version of
   GNU GPL as published by the Free Software Foundation provided that this
   declaration and the above copyright is included

* mcc was entirely written to help people extend their device's battery by
   controlling charging, without any kind of WARRANTY, and I will not take
   responsibility for any damage, or just anything bad happened

* Finally, you should obtain a copy of the GNU GPL v3 from [here](http://gnu.org/licenses/)

### Links

* [Source Code](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)
* [Battery University](http://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_batteries)
* [Donate to Me](https://paypal.me/JayminSuthar)

### Introduction

* ##### Control when to enable / disable charging on your device
* ##### Contains most of basic things for extending battery life

### Usage

* You should use a terminal for the purpose,
   see 'Development settings' if using a custom ROM
* mcc will check every input for errors, no worries
* A root shell is not needed, but better if have so
* From Terminal, run 'mcc [ ARG_1 ] [ ARG_2 ] ....'

### Options

    [ -s / --switch ] [ -p / --shut ] [ -f / --force ] [ -e / --enable ]
    [ -d / --disable ] [ -ts / --auto-switch ] [ -tp / --auto-shut ]
    [ -dm / --daemon-mode ] [ -rd / --re-daemon ] [ -df / --default ]
    [ -i / --info ] [ -r / --rm-stats ] [ -rc / --reconf ] [ -h / --help ]

### Examples

* 'mcc -s 85 65' -->  Set auto switch thresholds to 85 65
* 'mcc -s 55'    -->  Set auto switch threshold to 55
* 'mcc -f -s 95' -->  Force set auto switch threshold 95
* 'mcc -p 15'    -->  Set auto shut threshold to 15
* 'mcc -f -p 3'  -->  Force set auto shut threshold to 3
* 'mcc -df'      -->  Reset all the threshold to defaults
* 'mcc -ts'      -->  Toggle auto switch ON / OFF
* 'mcc -tp'      -->  Toggle auto shut ON / OFF
* 'mcc -dm'      -->  Toggle daemon mode ON / OFF
* 'mcc -rd'      -->  Re-launch the daemon unless running
* 'mcc -e 30s'   -->  Enable charging for 30 seconds
* 'mcc -d 45m'   -->  Disable charging for 45 minutes
* 'mcc -e 2h'    -->  Enable charging for 2 hours
* 'mcc -d 30%'   -->  Disable charging until 30 percents
* 'mcc -e 95%'   -->  Enable charging until 95 percents
* 'mcc -i'       -->  Show info about current status
* 'mcc -r'       -->  Reset battery statistics
* 'mcc -rc'      -->  Re-configure sysfs references
* 'mcc -h'       -->  Show this help message

### Miscellanous

* Auto switch and auto shut are part of the daemon mode, so with
   no daemon, there is no auto s*
* The [ -s / --switch ] option will automatically figure out the
   lower threshold unless given
* [ -rc / --reconf ] must be ran when you have flashed different
   kernel
* You can use long options instead of the shorter ones for conv.

### Remember

* mcc requires Magisk >= 1410 and boot mode installation
* Device must be charging while installing and 'mcc -rc'
* Resetting battery stats might not work on some devices

### Support / Bugs / Feature request

* All the support, bug reports, and feature requests
   should take place in my official XDA thread
* Explain clearly what support you are seeking
* Explain clearly how the bug affects the prog
* Explain clearly how the feature will perform

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

##### 1.4

* Hi users,
* As always it calls for an apology that you all had to manually
  set references even after succeeding the compatibility check from the
  mcc Installer, it was a misspelled variable in the Installer, which
  has now been fixed, for which I want to thank @pat357 for his pull
  request
* Another critical bug was false positive compatibility successions, this
  bug appears when the device did not even have a recognized battery
  device / module, and so much funnier, the reason was just a single
  misplaced variable, that was used to detect if the check succeeded,
  this bug has also been fixed
* @RSDamasceno at XDA reported having soft reboots and device warm-ups
  with mcc, which I suspect a bug with kernel not handling switch writes
  correctly, but as mcc is entirely written in Shell, I have added some
  code that will detect the current switch status and write to it only if
  the status is different, so the issue is supposed to be fixed
* It fixes another issue when the user has given an invalid argument for
  manually enabling charging, issue appeared something like, mcc will
  first disable charging, then abort due to unrecognized argument, so
  charging will be disabled as opposed to be enabled, which has also
  been fixed
* With any older mcc build, the first execution of command always took
  some seconds, some people reported 2, some 5 and some even 8 seconds,
  which happened due to mcc's Magisk mount point finding and BusyBox
  setup, which I implemented just to make sure mcc can work with all the
  present and possibly any future Magisk version, but the logic has now
  been shifted to service, which on boot, will do it all once for the
  entire boot session
* The boot daemon launcher will now attempt 5 times to launch the daemon,
  which whether succeeded / failed will be logged in Magisk logs, so
  that users can check if the daemon was launched at boot time
* And now as Android P DP1 is out, which removes make_ext4fs, I have put
  a fallback for that to mke2fs, just as same with Magisk
* Also all the strings in the Installer and the Main have been re-written
  and some faulty code has been cleaned up and organized as always
* So, the complete changelog is
  --> Fix the Installer not setting references by @pat357
  --> Fix false positives with compatibility check
  --> Fix a bug with with kernels not handling switch changes correctly
  --> Fix a bug with manually enabling charging
  --> Fix image creation for Android P DP1
  --> Fast as hell first time execution
  --> A better boot daemon launcher
  --> Re-write all the strings
  --> Cleanup some code
