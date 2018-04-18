#!/system/bin/sh
# My Charging Controller
# mcc Boot 1 (201804181)
# JayminSuthar @ xda-developers

# Copyright (c) 2018 Jaymin Suthar. All rights reserved.

# This file is a part of "My Charging Controller (mcc)".

# mcc is released under the terms of the GNU GPL v3, as been
## published by the Free Software Foundation. And permission
## hereby is granted to use, modify or redistribute it maybe
## partially or entirely under GPLv3 only.

# mcc was written in a hope of being useful. And any kind of
## WARRANTY is NOT provided. And I can't be held responsible
## for anything caused by it.

# You should already have received a copy of GPLv3 with mcc,
## if not, see <http://www.gnu.org/licenses/>.

(
mod_dir=${0%/*};
mcc_main=$(ls $mod_dir/system/xbin/mcc || ls $mod_dir/system/bin/mcc);
set -x 2>$mod_dir/files/boot.log;
chmod 0644 $mcc_main;
if ! sed -i "s|^mod_dir=.*|mod_dir=$mod_dir;|g" $mcc_main; then
    cat $mcc_main | sed "s|^mod_dir=.*|mod_dir=$mod_dir;|g" | tee $mcc_main;
fi;
grep '^mod_dir=' $mcc_main >&2;
) 2>${0%/*}/files/boot_err.log &
