defmodule ClientMinerSup do
    
    def begin(ipofsnode) do
        {:ok,[{ip,_,_}|tail]}=:inet.getif()
        [{ip2,_,_}|tail2]=tail
        ipofcnode =to_string(:inet.ntoa(ip))
        cnode=String.to_atom("adnode@"<>ipofcnode)
        Node.start cnode
        Node.set_cookie :dmahajan
        snode = String.to_atom("adnode@"<>ipofsnode)
        abc = Node.connect(snode)
        IO.inspect abc
        :global.sync()
        IO.inspect :global.whereis_name(snode)
        IO.inspect :global.whereis_name(:ioserver)
        IO.puts "thid is id of server"
        Process.group_leader(self(),:global.whereis_name(:ioserver))
        send :global.whereis_name(snode), { :hello, self() }
        receiver()
    end
    def receiver() do
        receive do
        { :k_valmsg, k_val } ->
        IO.puts "tock in client"
        n = System.schedulers_online*4 
        n_miners = Enum.to_list 1..n
        lcnode = String.slice(to_string(Node.self),-3..-1)
        Enum.map(n_miners, fn(x)->Node.spawn_link(Node.self(), Miner,:"process",[k_val,Integer.to_string(x),lcnode]) end)
        end
        receiver()
    end
end