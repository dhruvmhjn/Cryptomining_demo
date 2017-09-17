defmodule ServMinerSup do
    def init({[],[k_val],[]},snode) do
        n_miners = Enum.to_list 1..500
        Enum.map(n_miners, fn(x)->Node.spawn_link(snode, Miner,:"process",[k_val,x,snode]) end) #spawn_monitor(Miner,:"process",[k_val,x])        
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        end
    end
    def init({[],[],[]},_) do
             IO.puts "No k value received"
     end
    
end