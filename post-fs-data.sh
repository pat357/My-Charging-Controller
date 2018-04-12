#!/system/bin/sh
# MC's Charging Controller
# mcc Post FS-Data ( 201804111 )
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
cache_dir=$mod_dir/cache;
mcc_bin=$mod_dir/busybox;
mcc_main=$(ls $mod_dir/system/xbin/mcc $mod_dir/system/bin/mcc | head -1);
set -x 2>$cache_dir/boot_act.log;
chmod 0644 $mcc_main;
rm -rf $cache_dir/lock $mcc_bin; mkdir $mcc_bin;
if ! sed -i "s|^mod_dir=.*|mod_dir=$mod_dir;|g" $mcc_main; then
    sed -i "s|^mod_dir=.*|mod_dir=$mod_dir;|g" <$mcc_main >$mcc_main;
fi;
grep "^mod_dir=$mod_dir;$" $mcc_main >&2;
touch $mod_dir/pfsd_done;
) 2>${0%/*}/cache/boot_act_err.log) &)
