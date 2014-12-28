defmodule Spawn3 do
	def greet() do
		receive do
			{sender, msg} ->
				send(sender, {:ok, "Hello, #{msg}, from Elixir!"})
		end
	end
end

