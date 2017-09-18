defmodule God do
    @name "dnode@192.168.0.13"
    def main(args) do 
        parse_args(args,@name)
    end
    defp parse_args(args,temp_asnode) do
        cmdarg = OptionParser.parse(args) 
        {[],[argumentstr],[]} = cmdarg
        kregex = ~r/^\d{1,2}$/
        ipregex = ~r/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
        
        # Become client
        if Regex.match?(ipregex,argumentstr)do
            IO.puts "Matched IP value"
            ClientMinerSup.begin(argumentstr)
        # SERVER GOD  
        else if Regex.match?(kregex,argumentstr) do
            {:ok,[{ip,_,_}|tail]}=:inet.getif()
            [{ip2,_,_}|tail2]=tail
            ipofsnode =to_string(:inet.ntoa(ip))
            snode=String.to_atom("adnode@"<>ipofsnode)
            Process.flag(:trap_exit, true)
            IO.puts snode
            Node.start snode
            Node.set_cookie :dmahajan
            #:observer.start
            :global.register_name(snode, self())
            :global.register_name(:ioserver, :erlang.group_leader)
            Node.spawn_link(snode, ServMinerSup,:"init",[cmdarg,snode])
            
        else
            IO.puts "Invalid input"
        end
        end
        god_receiver(argumentstr)
    end
    
    def god_receiver(k) do
        receive do
            {:hello, cpid} ->
                send cpid, {:k_valmsg, k}
            {:EXIT, pid, reason} ->
              :timer.sleep(500)
              IO.puts "Child process #{inspect(pid)} exits with reasson #{reason}" 
        end
        god_receiver(k)
    end

end
