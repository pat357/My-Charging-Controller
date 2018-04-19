#!/system/bin/sh
# My Charging Controller
# mcc Boot 2 (201804191)
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
files_dir=$mod_dir/files;
mcc_bin=$mod_dir/busybox;
busybox=$mcc_bin/busybox;
set -x 2>>$files_dir/boot.log;
rm -rf $mcc_bin $mod_dir/lock $files_dir/yield;
mkdir $mcc_bin;
cp $(readlink $(which busybox) || which busybox) $mcc_bin/;
chmod 0755 $busybox; chown 0:2000 $busybox;
$busybox --install $mcc_bin/;
sleep 120;
chmod 0755 $(ls /system/xbin/mcc || ls /system/bin/mcc);
no_ver_logs=true mcc --launch-daemon </dev/null >/dev/null 2>&1;
ps | awk '!/ awk / && / {mcc} / && / \-\-launch\-daemon$/' >&2;
) 2>>${0%/*}/files/boot_err.log &
