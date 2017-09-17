defmodule ClientMinerSup do
    
    def begin(snode) do
        IO.puts "started client receieved servernode as #{inspect(snode)}" 
        k_val=5
        n_miners = Enum.to_list 1..500
        Enum.map(n_miners, fn(x)->Node.spawn_link(snode, Miner,:"process",[k_val,x]) end) #spawn_monitor(Miner,:"process",[k_val,x])        
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        end
    end
end