#!/system/bin/sh
# MC's Charging Controller
# mcc Service ( 201803161 )
# MCMotherEffin' @ XDA Developers

# Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

# This file is a part of the project "MC's Charging Controller ( mcc )"

# I MCMotherEffin', hereby declare that mcc is originally distributed from
## me under the terms of the GNU GPL v3 and you are allowed to use, modify
## or re-distribute the work done for mcc under v3 or any later version of
## GNU GPL as published by the Free Software Foundation provided that this
## declaration and the above copyright is included

# mcc was entirely written to help people extend their device's battery by
## controlling charging, without any kind of WARRANTY, and I will not take
## responsibility for any damage, or just anything bad happened

# Finally, you should obtain a copy of the GNU GPL v3 from <http://gnu.org/licenses/>

# Define variables
mod_dir=${0%/*};
mcc_bin=$mod_dir/busybox;
srv_log=$mod_dir/cache/service.log;

# Define functions

log_srv() {
    echo ' ' >>$srv_log; echo "- $2" >>$srv_log;
    log -p $1 -t Magisk "- mcc Service :- $2";
}

is_runningd() {
    busybox ps | grep -v ' grep ' | grep ' root ' | grep ' {mcc} ' | busybox grep -q ' --launch-daemon$';
}

# Logger
set -x 2>$srv_log;

# Set mod_dir in the Main
(busybox sed -i "s|^mod_dir=.*|mod_dir=$mod_dir;|g" $(ls $mod_dir/xbin/mcc || ls $mod_dir/bin/mcc);

# Set BusyBox up
rm -rf $mcc_bin; mkdir $mcc_bin;
cp -a $(readlink $(which busybox) || which busybox) $mcc_bin/;
$mcc_bin/busybox --install $mcc_bin/;
if [ -x $mcc_bin/awk ]; then
    log_srv i 'BusyBox was set up successfully';
else
    log_srv e 'Failed to set BusyBox up';
fi;

# Launch the daemon
sleep 120;
for i in first second third fourth fifth; do
    (no_file_logs=true mcc --launch-daemon &);
    sleep 10;
    if is_runningd; then
        log_srv i 'mcc daemon was launched successfully'; break;
    else
        log_srv e "Failed to launch the daemon in $i attempt";
    fi;
done;
if ! is_running_d; then
    log_srv e 'Failed to launch the daemon in all attempts';
fi;) &
