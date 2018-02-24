#!/system/bin/sh
# MC's Charging Controller
# mcc Service ( 201802251 )
# MCMotherEffin' @ XDA Developers

# Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar

# Logger
set -x 2>${0%/*}/cache/service.log

# Launch the daemon after proper setup
(sleep 120; no_file_logs=true mcc --launch_daemon;) &
