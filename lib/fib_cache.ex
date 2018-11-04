defmodule FibCache do
  alias FibCache.Cache

  defdelegate get(), to: Cache
  defdelegate update(key, value), to: Cache
  defdelegate get_and_update(key, value), to: Cache
end
