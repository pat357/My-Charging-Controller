#!/system/bin/sh
# MC's Charging Controller
# mcc Service ( 201804111 )
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

# Finally, you should have received a copy of the GPL v3 with mcc, if not,
## see <http://gnu.org/licenses/>.

( ( (
mod_dir=${0%/*};
mcc_bin=$mod_dir/busybox;
busybox=$mcc_bin/busybox;
yielder=$mod_dir/pfsd_done;
while [[ ! -f $yielder ]]; do sleep 1; done;
set -x 2>>$mod_dir/cache/boot_act.log;
cp $(readlink $(which busybox) || which busybox) $mcc_bin/;
chmod 0755 $busybox; chown 0:2000 $busybox;
if $busybox --install $mcc_bin/; then echo 1; else echo 0; fi;
sleep 120;
chmod 0755 $(ls /system/xbin/mcc /system/bin/mcc | head -1);
for i in 1 2 3 4 5; do
    ( (no_file_logs=true mcc --launch-daemon) &); sleep 5;
done;
ps | grep -v ' grep ' | grep ' root ' | grep ' {mcc} ' | grep ' --launch-daemon$' >&2;
rm -f $yielder;
) 2>>${0%/*}/cache/boot_act_err.log) &)
