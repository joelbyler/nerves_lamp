#!/bin/sh

MIX_TARGET=rpi0 MIX_ENV=prod mix firmware
MIX_TARGET=rpi0 MIX_ENV=prod mix nerves_hub.firmware sign --key lampkey
MIX_TARGET=rpi0 MIX_ENV=prod mix nerves_hub.firmware publish --key lampkey
