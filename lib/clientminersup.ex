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
        receiver()
    end
    def receiver() do
        receive do
        { :k_valmsg, k_val } ->
        IO.puts "tock in client"
        n = System.schedulers_online*4 
        n_miners = Enum.to_list 1..n
<<<<<<< HEAD
        lcnode = String.slice(to_string(Node.self),-3..-1)
        Enum.map(n_miners, fn(x)->Node.spawn_link(Node.self(), Miner,:"process",[k_val,Integer.to_string(x),lcnode]) end)
=======
        Enum.map(n_miners, fn(x)->Node.spawn_link(Node.self(), Miner,:"process",[k_val,x,Node.self()]) end)
        after 1000 ->
            if Process.alive?(:global.whereis_name(snode))do
            else
                exit(:lostserver)
            end
>>>>>>> 79eeb33597bc988868abdaf673c01da00068cc9d
        end
        receiver()
    end
end