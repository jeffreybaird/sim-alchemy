defmodule ForestFireSim.World do
  def create(forest, fire_starter) do
    fire_starter.({{0,0},4})
    spawn_link(__MODULE__, :loop, [forest])
  end

  def loop(forest) do
    receive do
      {:debug_location, xy, reply_to} ->
        send(reply_to, {:debug_location_response, {:fire,ForestFireSim.Forest.get_location(forest,xy)}})
    end
    loop(forest)
  end

end
