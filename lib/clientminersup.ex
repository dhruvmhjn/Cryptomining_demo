defmodule ClientMinerSup do
    
    def begin(snode) do
        IO.puts "started client receieved servernode as #{inspect(snode)}" 
        send :global.whereis_name(snode), { :hello, self() }
        receiver()
        #spawn_monitor(Miner,:"process",[k_val,x])
    end
    def receiver do
        receive do
        { :k_valmsg, k_val } ->
        IO.puts "tock in client"
        # k_val=5
        n_miners = Enum.to_list 1..500
        Enum.map(n_miners, fn(x)->Node.spawn_link(snode, Miner,:"process",[k_val,x]) end)
        end
        receiver
    end
end