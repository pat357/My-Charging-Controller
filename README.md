###### MC's Charging Controller
###### mcc README ( 201802251 )
###### MCMotherEffin' @ XDA Developers

###### Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar

### Links

* [Source code](https://github.com/Magisk-Modules-Repo/MC-s-Charging-Controller)
* [Support thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)
* [Battery university](http://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_batteries)
* [Donate to Me](https://paypal.me/JayminSuthar)

### Introduction

* ##### Control when to enable / disable charging on your device
* ##### Contains some of basic thangs for extending battery life

### Description

* The main goal is to extend lithium batteries' life
* You can configure it to work automatically or run it manually, too
* With daemon mode ( background activity ), you get two features
* 1) Auto switch
* it has two thresholds, 1) up_threshold and 2) down_threshold
* it will keep the battery level within these two thresholds
* while the device is plugged in
* 2) Auto shut
* it operates based on shut_threshold
* it will power-off the device if battery level goes below it
* With manual run, you can enable / disable for
* either some specified time or certain percentages
* You can also reset battery statistics with this
* Some other options are listed in 'Arguments can be' section

### How to use

* You should use a terminal for the purpose
* most custom ROMs come with it
* else uou can install it from Play Store or F-Droid
* You don't need to run "su" first, but better if done
* You also don't need to worry while calling mcc
* as it has error-checking for every user input taken
* From Terminal, run "mcc [ ARG_1 ] [ ARG_2 ] [ ARG_3 ]..."

##### Arguments can be

    [ --switch ] [ DISABLE % ] [ ENABLE % ]
        :- Set thresholds ( % ) used by auto awitch
        :-- [ ENABLE % ] is optional
        :-- Defaults :- 80 70

    [ --shut ] [ SHUT % ]
        :- Set threshold ( % ) used by auto shut
        :-- Default  :- 20

    [ --force ] [ ARGS ACCORDINGLY ].....
        :- Same as [ --switch ] [ DISABLE % ] [ ENABLE % ]
        :--     or [ --shut ] [ SHUT % ]
        :-- Except for no limitations are applied

    [ --enable ] [ % / TIME ]
        :- Enable charging for given time / until certain %
        :-- [ % / TIME ] is optional
        :-- Time can be 40s, 10m, or 1h
        :-- and level must be as 65%

    [ --disable ] [ % / time ]
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
        :- Resume / Run the mcc daemon

    [ --default ]
        :- Reset all thresholds to defaults

    [ --info ]
        :- Show information about current status

    [ --rm-stats ]
        :- Reset battery statistics

    [ --reconf ]
        :- Re-configure sysfs references

    [ --help ]
        :- Show this help message

### Notes

* Device must be charging while installing / [ --reconf ]
* 0 and 100 are not valid thresholds, so will result in error
* [ --rm-stats ] might not work on some ROMs
* If you upgrade from a version older than 1.2.1
* --> configurations from older version will not be restored
* For developers
* --> it has been built against mksh, not bash
* --> if you add anything to it, please create a pull request

### Thanks to

* @VR25 for 'Magic Charging Switch',
* which inspired me to develop mcc ( mcc was built from scratch )
* @CCL108XIV for being the mcc development MVP
* Many other resources of my shell script code ( i.e., stackoverflow )
* Me for developing, organizing, and perfecting mcc

### Donate to Me

* All of the work I have done comes out of my free time
* I'm a 17 yr old student and I do it all as a hobby
* so if you like my work, and want to encourage development
* and also are capable of donating me a few bucks
* Please feel free to donate to me ( run "mcc --donate" )

### What's new

##### 1.2.1

* All previous versions are considered incompatible


* Fix installations for Magisk Manager 5.6.0+
* Fix some faulty busybox setup code
* Correct some terminology ( see 'Arguments can be' )
* Improve the [ --re-daemon ] option
* Change defaults to 80 70 ( it be optimal )
* Rewrite README ( which directly means [ --help ] )
* Add messages to UI for some tasks
* Reduce checking intervals to 10ms
* Reduce max switches to two from four
* Add error handling for new code
* Port commit from Magisk to mcc Installer
* --> 'Round sizes to nearest integer'
* --> also repair image first if found
* Put errors to a separate logfile
* Rebase some tests on common observations
* Remove and re-write some pieces of code
* For developers
* --> Revert the source mcc feature, to keep the code clean
