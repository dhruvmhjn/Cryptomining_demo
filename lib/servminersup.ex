defmodule ServMinerSup do
    def init({[],[k_val],[]},snode) do
        n = System.schedulers_online*4 
        n_miners = Enum.to_list 1..n

        lsnode = String.slice(to_string(snode),-3..-1)
        Enum.map(n_miners, fn(x)->Node.spawn_link(snode, Miner,:"process",[k_val,Integer.to_string(x),lsnode]) end) #spawn_monitor(Miner,:"process",[k_val,x])        
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        end
    end
    def init({[],[],[]},_) do
             IO.puts "No k value received"
     end
    
end
