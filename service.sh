#!/system/bin/sh
# MC's Charging Controller
# mcc Service ( 201803081 )
# MCMotherEffin' @ XDA Developers

# Copyright (c) 2018 Jaymin " MCMotherEffin' " Suthar. All rights reserved.

# This file is a part of the project "MC's Charging Controller ( mcc )"

# I MCMotherEffin', hereby declare that "MC's Charging Controller"
## is licensed under the GNU GPL v3 and you are allowed to modify or
## re-distribute it under the terms of the GNU GPL v3 as published by
## the Free Software Foundation or any later version provided that you
## include the above copyright notice and this declaration

# Given the above rights, you are required to inform me
## if you re-distribute it ( wherever you do, it is public )
## you should do so by sending me a Private Message at xda-developers.com

# Finally, you should obtain a copy of the GNU GPL v3 from <http://gnu.org/licenses/>

# Logger
set -x 2>${0%/*}/cache/service.log;

# Launch the daemon after proper setup
(sleep 120; no_file_logs=true mcc --launch-daemon &) &
