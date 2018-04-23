#!/system/bin/sh
# My Charging Controller
# mcc Boot 2 (201804231)
# JayminSuthar @ xda-developers

# Copyright (c) 2018 Jaymin Suthar. All rights reserved.

# This file is a part of "My Charging Controller (mcc)".

# mcc is released under the terms of the GNU GPL v3, as been
## published by the Free Software Foundation. And permission
## hereby is granted to use, modify or redistribute it maybe
## partially or entirely under GPLv3 only.

# mcc was written in a hope of being useful. And any kind of
## WARRANTY is NOT provided. See GPLv3 for details.

# You should already have received a copy of GPLv3 with mcc,
## if not see <http://www.gnu.org/licenses/>.

(
NULL=/dev/null;
MOD_DIR=${0%/*};
DATA_DIR=$MOD_DIR/data;
BIN_DIR=$MOD_DIR/busybox;
BB_PATH=$BIN_DIR/busybox;

set -x 2>>$DATA_DIR/boot.log;

rm -rf $BIN_DIR $MOD_DIR/lock $DATA_DIR/block 2>$NULL;
mkdir $BIN_DIR;

cp $(readlink $(which busybox) || which busybox) $BIN_DIR/;
chown 0:2000 $BB_PATH; chmod 0755 $BB_PATH;
$BB_PATH --install $BIN_DIR/;

sleep 120;
chmod 0755 $(ls /system/xbin/mcc || ls /system/bin/mcc);

no_ver_logs=true mcc --launch-daemon <$NULL >$NULL 2>&1;
ps | awk "!/ awk / && / {mcc} / && / \-\-launch\-daemon$/" >&2;

) 2>>${0%/*}/data/boot_err.log &
