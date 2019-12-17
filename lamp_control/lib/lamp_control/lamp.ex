defmodule LampControl.Lamp do
  use GenServer

  alias Blinkchain.Color
  alias Blinkchain.Point
  require Logger

  # Client API
  defmodule State do
    defstruct [:color]
  end

  def start_link(opts \\ []) do
    initial_state = %State{
      color: "#4B0082"
    }

    {:ok, _pid} = GenServer.start_link(__MODULE__, initial_state, opts)
  end

  def set_color(color \\ "#4B0082") do
    Logger.info("LampControl setting color #{color}")

    GenServer.cast(:lamp, {:set_color, color})
  end

  # Server implementation
  def init(state) do

    {:ok, state}
  end

  def handle_cast({:set_color, color}, state) do
    Logger.info("LampControl setting color from cast #{color}")
    c = Color.parse(color)
    Blinkchain.set_pixel(%Point{x:  0, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  1, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  2, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  3, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  4, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  5, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  6, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  7, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  8, y: 0}, c)
    Blinkchain.set_pixel(%Point{x:  9, y: 0}, c)
    Blinkchain.set_pixel(%Point{x: 10, y: 0}, c)
    Blinkchain.set_pixel(%Point{x: 11, y: 0}, c)
    Blinkchain.render()
    {:noreply, %State{state | color: color}}
  end
end

# red: ff000c
# orange: ffa304
# yellow: fffa18
# green: 19ff02
# blue: 000dff
# violet: 7b00ff
# magenta: ff00fd



# LampControl.Lamp.set_color("#4B0082")

# Blinkchain.set_pixel(%Blinkchain.Point{x: 0, y: 0}, Blinkchain.Color.parse("#4B0082"))
# Blinkchain.set_pixel(%Blinkchain.Point{x: 0, y: 0}, Blinkchain.Color.parse("#0000ff"))

# Blinkchain.set_pixel(%Blinkchain.Point{x: 0, y: 0}, Blinkchain.Color.parse("#4B0082"))
# Blinkchain.render()


# 00:00:02.310 [info]  Application blinkchain exited: Blinkchain.Application.start(:normal, []) returned an error: shutdown: failed to start child: Blinkchain.HAL
#     ** (EXIT) an exception was raised:
#         ** (MatchError) no match of right hand side value: %Blinkchain.Config.Matrix{count: {1}, direction: {:right}, origin: {0, 0}, progressive: true, spacing: {1, 1}}
#             (blinkchain) lib/blinkchain/config/matrix.ex:53: Blinkchain.Config.Matrix.to_strip_list/1
#             (elixir) lib/enum.ex:1336: Enum."-map/2-lists^map/1-0-"/2
#             (blinkchain) lib/blinkchain/config/channel.ex:99: Blinkchain.Config.Channel.set_arrangement/2
#             (blinkchain) lib/blinkchain/config/channel.ex:73: Blinkchain.Config.Channel.new/2
#             (blinkchain) lib/blinkchain/config.ex:47: Blinkchain.Config.load/1
#             (blinkchain) lib/blinkchain/hal.ex:27: Blinkchain.HAL.start_link/1
#             (stdlib) supervisor.erl:379: :supervisor.do_start_child_i/3
#             (stdlib) supervisor.erl:365: :supervisor.do_start_child/2
