###### MC's Charging Controller
###### mcc README ( 201803111 )
###### MCMotherEffin' @ XDA Developers

###### Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

##### Legal

* This file is a part of the project "MC's Charging Controller ( mcc )"

* I MCMotherEffin', hereby declare that "MC's Charging Controller"
  is licensed under the GNU GPL v3 and you are allowed to modify or
  re-distribute it under the terms of the GNU GPL v3 as published by
  the Free Software Foundation or any later version provided that you
  include the above copyright notice and this declaration

* Given the above rights, you are required to inform me
  if you re-distribute it ( wherever you do, it is public )
  --> You should do so by sending me a Private Message at xda-developers.com

* Finally, you should obtain a copy of the GNU GPL v3 from [here](http://gnu.org/licenses/)

### Links

* [Source Code](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)
* [Battery University](http://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_batteries)
* [Donate to Me](https://paypal.me/JayminSuthar)

### Introduction

* ##### Control when to enable / disable charging on your device
* ##### Contains some of basic things for extending battery life

### Description

* The base inspiration for creating mcc is to extend batteries' life
* mcc works in either of these ways, 1) daemon mode and 2) manual run
* Mostly you might want to configure daemon mode to work automatically,
  but you might also need manual run for some other ( Advanced ) purposes
* With daemon mode ( background activity ), you get the following twos
* 1) Auto switch ( automatic switching ) :-
  It operates based on these twos, 1) up_threshold and 2) down_threshold
  --> It will disable charging if battery level goes above the first and
  re-enable charging once it hits the second threshold ( if plugged in ),
  so, it will keep the battery level bounded within these two thresholds
  while the device is plugged in
* 2) Auto shut ( automatic power-off ) :-
  It operates based on shut_threshold
  --> It will power-off the device if battery level goes below the threshold
* With manual run, you can enable / disable charging for
  either some time ( seconds, minutes or hours ) or until certain percents
* You can also reset battery statistics with it ( see 'Keep in mind' )
* Some other options are listed in 'Arguments can be' section

### How to use

* You should use a terminal for the purpose,
  most custom ROMs come with one built-in, using which I will recommend
* You don't need to run 'su' first, but it be better if you do so
* You also don't need to worry while running mcc ( mcc is intelligent ),
  as it has error-checking for every user input taken
* Finally, from Terminal, run "mcc [ ARG_1 ] [ ARG_2 ] [ ARG_3 ]..."

##### Arguments can be

    [ -s / --switch ] [ DISABLE % ] [ ENABLE % ]
        :- Set thresholds ( % ) used by auto awitch
        :-- [ ENABLE % ] is optional
        :-- Defaults :- 80 70

    [ -p / --shut ] [ SHUT % ]
        :- Set threshold ( % ) used by auto shut
        :-- Default  :- 20

    [ -f / --force ] [ ARGS ACCORDINGLY ]...
        :- Same as [ -s ] [ DISABLE % ] [ ENABLE % ]
        :--     or [ -p ] [ SHUT % ]
        :-- Except for all values are taken valid

    [ -e / --enable ] [ % / TIME ]
        :- Enable charging for given time / until certain %
        :-- [ % / TIME ] is optional
        :-- Time can be as 40s, 10m, or 1h
        :-- and level must be as 65%

    [ -d / --disable ] [ % / TIME ]
        :- Same as above, except for charging is disabled

    [ -ts / --auto-switch ]
        :- Toggle auto switch ON / OFF
        :-- Default  :- ON

    [ -tp / --auto-shut ]
        :- Toggle auto shut ON / OFF
        :-- Default  :- ON

    [ -dm / --daemon-mode ]
        :- Toggle daemon mode ON / OFF
        :-- Default  :- ON

    [ -rd / --re-daemon ]
        :- Launch the daemon unless running

    [ -df / --default ]
        :- Reset all thresholds to defaults

    [ -i / --info ]
        :- Show info about current status

    [ -r / --rm-stats ]
        :- Reset battery statistics

    [ -rc / --reconf ]
        :- Re-configure sysfs references

    [ -h / --help ]
        :- Show this help message

### Keep in mind

* mcc requires Magisk >= 1410 and does not support recovery installation
* Device must be charging while installing /  running [ -rc / --reconf ]
* mcc will create upto four ( and min. two ) processes for some stuff
  --> Except for the daemon, which ( if launched by Magisk on boot or
      by running [ -rd / --re-daemon ] ) needs only one process
* 0 and 100 are not valid thresholds, so they wiil always give an error
* [ -r / --rm-stats ] might not work on some Nougat ROMs / retired devices
* If you upgrade from a version older than 1.2.1
  --> configurations from older one will not be restored ( incompat... )
* For developers
  --> I built it specifically for Android, so I used mksh as the Shell??
      so please do not do that bash shit with this module ( Blah!!!... )
      and also please always try to retain the original coding style
  --> I'm always here at XDA for any help / discussion you might want
  --> Finally, if you add anything to mcc, please ( you should ) tell me,
      so that I can think of merging your changes to the original source

### Support / Bugs / Feature request

* Finally, as you have read all of the above and still need some help
  or you have some topic to be discussed about and you believe others
  might also be wondering the same, please use the official XDA thread
* If you think you have found a bug in mcc
  ( please always use common sense first, also see if you can fix it ),
  please report that at the thread, and also please include the following
* 1) Nature of the bug ( how does it act / react, etc,... )
* 2) How to reproduce that bug or if is that device specific
* 3) What did you do to troubleshoot it
* 4) Which device, ROM, kernel you're using
* 5) and attach /cache/mcc_e*.log and /sbin/.core/img/mcc/cache/verbose*.log,
* If you have mcc working with the above mentioned functionalities,
  and wish to have a new feature added, please ask that at the thread,
  but be sure to explain in detail how that feature is intended to function

### Thanks to

* @VR25 for 'Magic Charging Switch',
  which inspired me to develop mcc ( mcc's built from scratch )
* @topjohnwu for creating such a platform
* @CCL108XIV for being the mcc development MVP
* Many other resources of my shell script code ( i.e., stackoverflow )
* Me for developing, organizing, and perfecting mcc

### Donate to Me

* All of the work that I have done comes out of my free time,
  I'm a 17 year old student and I do it all as a hobby ( maybe habit ),
  so if you like my work, and want to encourage further development
  --> Please feel free to donate to me ( just a tea, run "mcc --donate" )

### Release notes

##### 1.3

* Hi users,
* Firstly, I'm sorry for the sucking 'No references set' bug,
  I forgot to split out the switch file which resulted in as an
  unrecognized switch by mcc, So, whenever mcc was ran, it did not
  detect switches and so the bug happened, this bug has been  fixed now
* And now, so mcc provides manual run option, and which takes time as an
  argument, for which, mcc will fork a session which will keep sleeping
  for the given time, and mcc will check for that process every second,
  but it gave false positives when another shell process was also sleeping
  for the same time as mcc ( child ) did, that bug has also been fixed
* I also recently intoduced a new feature said 'Revert Magic Mount'
  live from booted Android, but I realized that with A / B devices,
  it is completely different, which made it unusable for such devices,
  but now, the feature is working completely on A / B devices now, for which
  mcc requires Magisk >= 1410 from now ( would not matter for most users )
* I have also put in a hell lot of efforts in making mcc rock stable,
  I started from the top of every single component and kept analyzing, and
  analyzing, and analyzing, and analyzing, and analyzing, and analyzing,
  and Finally, I'm glad to declare most unless all bugs are flushed out
* I also have effingly strived harder to workaround many non-mcc flaws which I found
* So, the complete changelog is
  --> Fix the 'No references set' bug
  --> Fix false positives for time-based run
  --> Fix 'Revert Magic Mount' for A / B devices
  --> Re-analyze and re-write the entire project
  --> Workaround many non-mcc flaws
  --> Require Magisk >= 1410
