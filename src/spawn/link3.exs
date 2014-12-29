defmodule Link3 do
	
	import :timer, only: [sleep: 1]

	def sad_function() do
		sleep(500)
		exit(:boom)
	end

	def run() do
		Process.flag(:trap_exit, true)
		spawn_link(Link3, :sad_function, [])
		receive do
			msg ->
				IO.puts("Message received: #{inspect msg}")
		after 1000 ->
						IO.puts("Nothing happened as far as I am concerned.")
		end
	end

end

IO.puts("A process that traps exits gets a message whenever")
IO.puts("a linked process ends.")
Link3.run()
