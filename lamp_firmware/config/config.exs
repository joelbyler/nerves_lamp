# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :lamp_firmware, target: Mix.target()

config :lamp_firmware, :dioty,
  username: System.get_env("DIOTY_USERNAME"),
  password: System.get_env("DIOTY_PASSWORD")

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware,
  rootfs_overlay: "rootfs_overlay",
  provisioning: :nerves_hub

config :nerves_runtime, :kernel, use_system_registry: false

config :nerves_hub,
  fwup_public_keys: [:lampkey],
  remote_iex: true

# Use shoehorn to start the main application. See the shoehorn
# docs for separating out critical OTP applications such as those
# involved with firmware updates.

config :shoehorn,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: Mix.Project.config()[:app]

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger]

config :nerves_firmware_ssh,
  authorized_keys: [
    File.read!(Path.join(System.user_home!, ".ssh/nerves/id_rsa.pub"))
  ]

import_config "../../lamp_web_ui/config/config.exs"
import_config "../../lamp_control/config/config.exs"

config :nerves_network,
  regulatory_domain: "US"

config :nerves_network, :default,
  wlan0: [
    networks: [
      [
        ssid: "Codemash_Secure",
        psk: "3141592653589793",
        key_mgmt: :"WPA-PSK",
        priority: 100
      ],
      [
        ssid: "codemash",
        key_mgmt: :NONE,
        priority: 0
      ]
    ]
  ],
  eth0: [
    ipv4_address_method: :dhcp
  ]

if Mix.target() != :host do
  import_config "target.exs"
end

import_config "#{Mix.env()}.secret.exs"
