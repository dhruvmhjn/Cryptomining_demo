defmodule God do
    @name :"dnode@192.168.0.12"
    def main(args) do 
        parse_args(args,@name)
    end
    defp parse_args(args,snode) do
        cmdarg = OptionParser.parse(args) 
        {[],[argumentstr],[]} = cmdarg
        kregex = ~r/^\d{1,2}$/
        ipregex = ~r/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
        
        # Become client
        if Regex.match?(ipregex,argumentstr)do
            IO.puts "Matched IP value"
            ClientMinerSup.begin(snode)
        
        # SERVER GOD  
        else if Regex.match?(kregex,argumentstr) do
            IO.puts "Matched K value"
            Process.flag(:trap_exit, true)
            #nameofsnode = :"dnode@192.168.0.13"
            Node.start snode
            Node.set_cookie :dmahajan
            :global.register_name(snode, self())
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