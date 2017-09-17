defmodule ServMinerSup do

    def init({[],[k_val],[]}) do
       # pids= Enum.map(1..5, fn(_)->spawn(Miner,:"callMiner",[k_val])end)
       # IO.inspect k_val
        #pids= Enum.map(1..5, fn(_)->spawn(Miner,:"process",[k_val])end)
        #IO.puts "Starting Miners"
        #Miner.process(k_val)
        #list = [1..500]
        #I0.puts list
        n_miners = Enum.to_list 1..500
        IO.puts inspect(n_miners)
        pids= Enum.map(1..500, fn(_)->spawn(Miner,:"process",[k_val])end)        
        
        receive do
            msg ->
                IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        end
        #pid2 = spawn(Miner,:"process",[k_val])
    end
    def init({[],[],[]}) do
             IO.puts "No k value received"
     end
    
end