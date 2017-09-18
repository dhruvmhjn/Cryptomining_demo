defmodule ClientMinerSup do
    
    def begin(ipofsnode) do
        {:ok,[_,{mytuple,_,_}]}=:inet.getif()
        ipofcnode =to_string(:inet.ntoa(mytuple))
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
        receiver(snode)
    end
    def receiver(snode) do
        receive do
        { :k_valmsg, k_val } ->
        IO.puts "tock in client"
        n = System.schedulers_online*4 
        n_miners = Enum.to_list 1..n
        Enum.map(n_miners, fn(x)->Node.spawn_link(Node.self(), Miner,:"process",[k_val,x,Node.self()]) end)
        end
        receiver(snode)
    end
end