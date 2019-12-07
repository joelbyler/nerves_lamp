# LampFirmware

**TODO: Add description**

## Targets

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi3` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves

## Building
```
MIX_TARGET=rpi0 MIX_ENV=prod mix firmware
```
## Deploying over otg
```
MIX_ENV=prod ./upload.sh
```

```
MIX_TARGET=rpi0 MIX_ENV=prod mix firmware && MIX_ENV=prod mix nerves_hub.firmware publish --key lampkey
```

## Hardware

### Building your lamp

**TODO**: Add fritzing diagram

**NOTE**: The author accepts NO LIABILITY for this project, proceed at your own risk.  Also see reference section for links which were used to inform this project.

### Connecting to your Raspberry Pi

This project is setup to use GPIO pin 18, which on a raspberry pi is mapped to physical pin number 12.  See the documentation for the [blinkchain](https://github.com/GregMefford/blinkchain) library for additional information on how to interact with various configurations of WS2812B NeoPixels

![GitHub Logo](doc/gpio_pin_diagram.jpg)


## References

  * [Diode Fix for Alkaline Batteries](https://learn.adafruit.com/battery-power-for-led-pixels-and-strips/diode)
  * [The Magic of NeoPixels](https://learn.adafruit.com/adafruit-neopixel-uberguide/the-magic-of-neopixels)
