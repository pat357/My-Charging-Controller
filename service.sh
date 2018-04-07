#!/system/bin/sh
# MC's Charging Controller
# mcc Service ( 201804071 )
# MCMotherEffin' @ XDA Developers

# Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

# This file is a part of the project "MC's Charging Controller ( mcc )".

# I MCMotherEffin', hereby declare that mcc is originally distributed from
## me under the terms of the GNU GPL v3 and you are allowed to use, modify
## or re-distribute the work done for mcc under v3 or any later version of
## GNU GPL as published by the Free Software Foundation provided that this
## declaration and the above copyright notice is included.

# mcc was entirely written for helping people extend their batteries' life
## by controlling charging, without any kind of WARRANTY, and I can not be
## held responsible for any damage, or just anything bad happened.

# Finally, you should obtain a copy of the GNU GPL v3 from <http://gnu.org/licenses/>.

# Some info about this file.

# This file is the service script which will be ran for every boot session
## by the Magisk daemon. It firstly will set Magisk bundled BusyBox up via
## hardlinks. It will then modify the Main script to reflect the parent of
## this script for the current boot session. And finally, it will for five
## times maximum attempt to launch the mcc daemon.

mod_dir=${0%/*};
mcc_bin=$mod_dir/busybox;
busybox=$mcc_bin/busybox;
srv_log=$mod_dir/cache/service.log;
if ! mcc_main=$(ls /system/xbin/mcc || ls /system/bin/mcc); then exit 1; fi;

log_srv() { log -p $1 -t Magisk "- mcc Service :- $2"; }

is_runningd() {
    ps | grep -v ' grep ' | grep ' root ' | grep ' {mcc} ' | grep -q ' --launch-daemon$';
}

set -x 2>$srv_log;
( (
chmod 0644 $mcc_main;
sed -i "s|^mod_dir=.*|mod_dir=$mod_dir;|" $mcc_main;
rm -rf $mcc_bin; mkdir $mcc_bin;
cp -a $(readlink $(which busybox) || which busybox) $busybox;
chmod 0755 $busybox; chown 0:2000 $busybox;
$busybox --install $mcc_bin/;
if [[ -x $mcc_bin/awk ]]; then
    log_srv i 'BusyBox was set up successfully';
else
    log_srv e 'Failed to set BusyBox up';
fi;
chmod 0755 $mcc_main;
rm -f $mod_dir/cache/lock_d;
sleep 120;
for i in first second third fourth fifth; do
    if ! is_runningd; then (no_file_logs=true mcc --launch-daemon &); fi;
    sleep 15;
done;
if is_runningd; then
    log_srv i 'mcc daemon was launched successfully';
else
    log_srv e 'Failed to launch the mcc daemon';
fi;
) &)
