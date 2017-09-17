defmodule God do
    @name :"dnode@192.168.0.13"
    def main(args) do
        
        parse_args(args,nameofsnode)
        
    end
    defp parse_args(args,snode) do
        cmdarg = OptionParser.parse(args) 
        {[],[argumentstr],[]} = cmdarg
        kregex = ~r/^\d{1,2}$/
        ipregex = ~r/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/

        if Regex.match?(ipregex,argumentstr)do
            IO.puts "Matched IP value"
        else if Regex.match?(kregex,argumentstr) do
            IO.puts "Matched K value"
            Process.flag(:trap_exit, true)
            nameofsnode = :"dnode@192.168.0.13"
            Node.start nameofsnode
            Node.set_cookie :dmahajan
            :global.register_name(@name, self())
            spid = Node.spawn_link(snode, ServMinerSup,:"init",[cmdarg,snode])
            #ServMinerSup.init(cmdarg,snode)
            receive do
                {:EXIT, pid, reason} ->
                  :timer.sleep(500)
                  IO.puts "Child process exits with reasson #{reason}" 
                #   if pid === spid do
                #     Node.spawn_link(snode, ServMinerSup,:"init",[cmdarg,snode]) 
                  end
        else
            IO.puts "Invalid input"
        end 
        end
        
        end
    end
end