###### MC's Charging Controller
###### mcc README ( 201803061 )
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
  if you re-distribute it ( wherever you do, it is public ),
  You should do so by sending me a Private Message at xda-developers.com

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
* It works in either of these ways, 1) daemon mode and 2) manual run
* Mostly you might want to configure daemon mode to work automatically,
  but you might also need manual run for some other ( Advanced ) purposes
* With daemon mode ( background activity ), you get the following twos
* 1) Auto switch ( automatic switching ) :-
  It operates based on these twos, 1) up_threshold and 2) down_threshold,
  It will disable charging if battery level goes above the first and
  re-enable charging once it hits the second threshold ( if plugged in ),
  So, it will keep the battery level bounded within these two thresholds
  while the device is plugged in
* 2) Auto shut ( automatic power-off ) :-
  It operates based on shut_threshold,
  It will power-off the device if battery level goes below the threshold
* With manual run, you can enable / disable charging for
  either some time ( seconds, minutes or hours ) or until certain percents
* You can also reset battery statistics with it ( see 'Keep in mind' )
* Some other options are listed in 'Arguments can be' section

### How to use

* You should use a terminal for the purpose,
  most custom ROMs come with one built-in, using which I will recommend
* You don't need to run 'su' first, but it be better if you do so
* You also don't need to worry while running mcc ( it is intelligent ),
  as it has error-checking for every user input taken
* Finally, from Terminal, run "mcc [ ARG_1 ] [ ARG_2 ] [ ARG_3 ]..."

##### Arguments can be

    [ --switch ] [ DISABLE % ] [ ENABLE % ]
        :- Set thresholds ( % ) used by auto awitch
        :-- [ ENABLE % ] is optional
        :-- Defaults :- 80 70

    [ --shut ] [ SHUT % ]
        :- Set threshold ( % ) used by auto shut
        :-- Default  :- 20

    [ --force ] [ ARGS ACCORDINGLY ]...
        :- Same as [ --switch ] [ DISABLE % ] [ ENABLE % ]
        :--     or [ --shut ] [ SHUT % ]
        :-- Except for all values are taken valid

    [ --enable ] [ % / TIME ]
        :- Enable charging for given time / until certain %
        :-- [ % / TIME ] is optional
        :-- Time can be as 40s, 10m, or 1h
        :-- and level must be as 65%

    [ --disable ] [ % / TIME ]
        :- Same as above, except for charging is disabled

    [ --auto-switch ]
        :- Toggle auto switch ON / OFF
        :-- Default  :- ON

    [ --auto-shut ]
        :- Toggle auto shut ON / OFF
        :-- Default  :- ON

    [ --daemon-mode ]
        :- Toggle daemon mode ON / OFF
        :-- Default  :- ON

    [ --re-daemon ]
        :- Launch the daemon unless running

    [ --default ]
        :- Reset all thresholds to defaults

    [ --info ]
        :- Show info about current status

    [ --rm-stats ]
        :- Reset battery statistics

    [ --reconf ]
        :- Re-configure sysfs references

    [ --help ]
        :- Show this help message

### Keep in mind

* mcc requires Magisk >= 1400 and does not support recovery installation
* Device must be charging while installing mcc /  running [ --reconf ]
* mcc will create upto four ( min. two ) processes for some stuff
  --> Except for the daemon, which ( if launched by Magisk on boot or
      by running [ --re-daemon ] ) needs only one process
* 0 and 100 are not valid thresholds, so they wiil always give an error
* [ --rm-stats ] might not work on some Nougat ROMs / retired devices
* If you upgrade from a version older than 1.2.1
  --> configurations from older one will not be restored ( incompat... )
* For developers
  --> I built it specifically for Android, so I used mksh as the Shell??
      so please do not do that bash shit with this module ( Blah!!!... )
      and also please always try to retain the original coding style
  --> I'm always here at XDA for any help / discussion you might want
  --> Finally, if you add anything to it, please ( you should ) tell me
      so that I can think of merging your changes to the original source

### Support / Bugs

* Finally, as you have read all of the above and still need some help
  or you have some topic to be discussed about and you believe others
  might also be wondering the same, please use the official XDA thread
* Also, if you think you really have found a bug in mcc
  ( please always use common sense first, also see if you can fix it ),
  please report that at the thread, and also please include the following
* 1) Nature of the bug ( how does it act / react, etc,... )
* 2) How to reproduce that bug or if is that device specific
* 3) What did you do to troubleshoot it
* 4) Which device, ROM, kernel you're using
* 5) and attach /cache/mcc_e*.log and /sbin/.core/img/mcc/cache/verbose*.log,
  please note that all the 'Support my device' posts will only be noticed
  only for some widely used devices and assuming you like experimenting,
  else your best bet is to flash a different kernel

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

### What's new

##### 1.2.4.MR

* Fix Magisk Manager crashes

##### 1.2.4

* Fix compatibility check ( Installer / mcc ) for some devices
  --> add support for some weird devices I saw ( mostly Honor )
* Fix some faulty BusyBox setup code
* Fix image sizes for resizing
  --> mcc never shrinks them, so expand only to needs
* Fix regression opened by @pat357
* Free Magisk daemon child after mcc daemon is launched
* Abort installation for Magisk < 1400
* Update README ( and indirectly [ --help ] )
