#!/usr/bin/env bash

# Micronucleus
if [ ! -f "/etc/udev/rules.d/49-micronucleus.rules" ] && [ ! -f "/lib/udev/rules.d/49-micronucleus.rules" ]; then
  echo "Update Micronucleus rules..."
  cat > /etc/udev/rules.d/49-micronucleus.rules <<EOF
SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{MTP_NO_PROBE}="1"
KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"
EOF
fi

# reload udev rules
echo "Reload rules..."
udevadm control --reload-rules
