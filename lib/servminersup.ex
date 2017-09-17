defmodule ServMinerSup do

    def init({[],[k_val],[]}) do
        n_miners = Enum.to_list 1..500
        Enum.map(n_miners, fn(x)->spawn_monitor(Miner,:"process",[k_val,x])end)        
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        end
    end
    def init({[],[],[]}) do
             IO.puts "No k value received"
     end
    
end