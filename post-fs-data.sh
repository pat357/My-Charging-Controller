#!/system/bin/sh
# My Charging Controller
# mcc Boot 1 (201804241)
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
MOD_DIR=${0%/*};
TMP_FILE=$MOD_DIR/tmp_file;
MAIN_PATH=$(ls $MOD_DIR/system/xbin/mcc || ls $MOD_DIR/system/bin/mcc);

set -x 2>$MOD_DIR/data/boot.log;

rm -f $TMP_FILE;
while read -r LINE; do
  if (echo "$LINE" | grep "^MOD_DIR=" >/dev/null); then
    echo "MOD_DIR=$MOD_DIR;" >>$TMP_FILE;
  else
    echo "$LINE" >>$TMP_FILE;
  fi;
done <$MAIN_PATH;
mv -f $TMP_FILE $MAIN_PATH;

chmod 0644 $MAIN_PATH;

cat $MAIN_PATH | grep "^MOD_DIR=" >&2;

) 2>${0%/*}/data/boot_err.log &
