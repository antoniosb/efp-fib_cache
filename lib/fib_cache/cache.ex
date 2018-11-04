defmodule FibCache.Cache do
  @moduledoc """
    Write a module that implements the cache for Fibonacci.
    It should use an agent, and that agent’s state should be the map.
  """

  @me __MODULE__

  def start_link() do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: @me)
  end

  def get() do
    Agent.get(@me, & &1)
  end

  def update(k, v) do
    cache = get()
    Agent.update(@me, fn cache -> Map.put(cache, k, v) end)
  end

  def get_and_update(k, v) do
    cache = get()

    Agent.get_and_update(@me, fn cache ->
      new_cache = Map.put(cache, k, v)
      {new_cache, new_cache}
    end)
  end
end
