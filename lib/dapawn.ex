defmodule Dspawn do
    def greet do
        receive do
            {sender, msg} ->
                pid2 = self()
                send sender, { :okk, "Hello, #{msg}"<>pid2 }
        end
    end
end
    # here's a client
pid = spawn(Dspawn, :greet, [])
send pid, {self(), "World!"}
receive do
    {:okk, message} ->
        IO.puts message
end