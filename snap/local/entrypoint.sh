#!/bin/bash

# Copyright 2022 Proyectos y Sistemas de Mantenimiento SL (eProsima).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export LD_LIBRARY_PATH=${SNAP}/lib:${SNAP}/usr/lib:${SNAP}/usr/local/lib:${SNAP}/usr/lib/${ARCH}:${LD_LIBRARY_PATH}

if [ -e "/var/lib/snapd/lib/gl/xorg/nvidia_drv.so" ]; then
    # special case for nvidia
    export LIBGL_DRIVERS_PATH=/var/lib/snapd/lib/gl/xorg
    export LD_LIBRARY_PATH=/var/lib/snapd/lib/gl:$LD_LIBRARY_PATH
else
    export LIBGL_DRIVERS_PATH=$SNAP/usr/lib/$ARCH/dri
fi

source "${SNAP}/opt/ros/humble/local_setup.bash"
source "${SNAP}/opt/vulcanexus/humble/local_setup.bash"

exec "$@"