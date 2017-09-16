defmodule ServMinerSup do

    def init({[],[k_val],[]}) do
       # pids= Enum.map(1..5, fn(_)->spawn(Miner,:"callMiner",[k_val])end)
       # IO.inspect k_val
        #pids= Enum.map(1..5, fn(_)->spawn(Miner,:"process",[k_val])end)
        #IO.puts "Start Miners"
        #Miner.process(k_val)

        pid1 = Process.spawn(Miner,:"process",[k_val],[])
        #pid2 = spawn(Miner,:"process",[k_val])
    end
    def init({[],[],[]}) do
             IO.puts "No k value received"
     end
    
end