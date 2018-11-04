defmodule FibCache.Application do
  use Application

  def start(_type, _args) do
    FibCache.Cache.start_link()
  end
end
