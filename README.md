###### MC's Charging Controller
###### mcc README ( 201802111 )
###### MCMotherEffin' @ XDA Developers

###### Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar

### Links

* [Source](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)
* [Donate](https://paypal.me/JayminSuthar)
* [Battery University](http://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_batteries)

### Description

* ##### It is meant to prolong Lithium batteries' life by controlling charging
* ##### It allows you to turn charging ON / OFF by rules you define or manually
* ##### In daemon mode, charging is controlled automatically by these twos: up_ / down_threshold
* ##### Also you can manually set specific ON / OFF time period or desired percent
* ##### Talking more there are battery stats reset and some other useful info
* ##### Everything has error handling, so don't worry while configuring

### Usage

##### mcc [ ARG_1 ] [ ARG_2 ].....

##### Arguments can be :

    [ --set ] [ DISABLE % ] [ ENABLE % ]
        :- Set thresholds ( % ) used by daemon mode for turning charging ON / OFF
        :- This will keep battery level within set boundaries while the device is plugged
        :---  [ ENABLE % ] is optional
        :---  Defaults :- 85 70

    [ --shut ] [ SHUT % ]
        :- Set threshold ( % ) for automatically powering the device OFF
        :---  Default  :- 20

    [ --force ] [ ARGS ACCORDINGLY ].....
        :- Same as [ --set ] [ DISABLE % ] [ ENABLE % ]
        :---    or [ --shut ] [ SHUT % ]
        :---  Except for no limitations are applied

    [ --enable ] [ % / time ]
        :- Enable charging for given time / until certain % 
        :---  [ % / time ] is optional
        :---  Time can be 30 ( 30 seconds ), 8m ( 8 minutes ) or 2h ( 2 hours )
        :---  Level can be 60%, 55% or 19%

    [ --disable ] [ % / time ]
        :- Same as above, except for charging is disabled

    [ --donate ]
        :- Redirect to my paypal donate page

    [ --daemon ]
        :- Toggle Magisk daemon mode ON / OFF
        :---  Default  :- ON

    [ --autoshut ]
        :- Toggle automatic power-off ON / OFF
        :---  Default  :- ON

    [ --ckservice ]
        :- Check whether mcc Service is running
        :---  If not, fork a new process for it

    [ --default ]
        :- Reset all thresholds to defaults

    [ --info ]
        :- Show some useful information about current status

    [ --statreset ]
        :- Reset battery statistics

    [ --reconf ]
        :- Re-configure sysfs references ( plug in charger first! )

    [ --help ]
        :- Show this help message

### Notes

* It has been built and tested against 'mksh R52'
* Device must be charging while installing / [ --reconf ]
* 85 70 for daemon and 20 for shut is optimal balanced configuration
* [ --statreset ] might not work on some ROMs
* It re-installs busybox to /cache/mcc_busybox ( about 1MB, don't remove )
* Every task is executed once per 10 seconds
* If you like my work, feel free to donate to me

### Thanks to

* @VR25 for his 'Magic Charging Switch', an inspiration to beta versions of mcc ( unreleased )
* @CCL108XIV for being my beta testing and UI improvements specialty
* Many other resources of my shell script code ( i.e., stackoverflow )
* Me for developing, organizing, and perfecting mcc

### Changelog

##### 1.1

* Fixed battery stats not resetting
* Check busybox version instead of comparing at binary level
*  --------    Speeds up environment setup
* Added [ --donate ]
*  --------    Use it if you like my work
* Charging will be enabled by installer if mcc is detected
*  --------    which make 'mcc --enable' no longer needed
* Service will always return if no references already set
*  --------    In such case, run [ --reconf ] and then [ --ckservice ]
* Rebirth based on computer coding
*  --------    Previous versions were coded / built using my phone ( with DroidEdit )
* For advanced users only ( user request )
*  --------    It will always use return instead of exit
*  --------    Useful for using it's internal functions outside ( via 'source mcc' )

##### Jalebis MR1

* Changed defaults to 85 70 for daemon
* Updated README

##### Jalebis MR

* Some minor, but important changes

##### Jalebis

* Moved mcc-check command to mcc as [ --ckservice ]

##### Imerty MR

* Fixed mcc-check running exec instead of fork
* Fixed service logging with mcc-check

##### Imerty

* Added a new command 'mcc-check'
*  --------    Use it if you feel mcc Service has been killed

* README is improved and partly rewritten
*  --------    thanks to [0xCA](https://t.me/Hi10pH264)

##### Handwo

* Fixed a bug with never resuming charging with some typical kernels
* Daemon is more stable, now checking battery current
* Battery stats are now reset on power-off
* [ --reset ] is now [ --set ]
*  --------    thanks to [0xCA](https://t.me/Hi10pH264) for his extensive testing, reporting and reasoning

* Fixed rebooting while checking compatibility
* Added /sys/module into references lookup path
* Improved charging control
* Better environment setup
* Other code improvements
