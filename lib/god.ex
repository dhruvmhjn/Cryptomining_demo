defmodule God do
    def main(args) do
        Process.flag(:trap_exit, true)
        nameofsnode = :"dnode@192.168.0.12"
        Node.start nameofsnode
        #IO.inspect Node.self
        Node.set_cookie :dmahajan
        parse_args(args,nameofsnode)
        
    end
    defp parse_args(args,snode) do
        cmdarg = OptionParser.parse(args) 
        {[],[argumentstr],[]} = cmdarg
        kregex = ~r/^\d{1,2}$/
        ipregex = ~r/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/

        if Regex.match?(ipregex,argumentstr)do
            IO.puts "Matched IP value"
            Node.spawn_link(snode, ClientMinerSup,:"begin",[snode]) 
        else if Regex.match?(kregex,argumentstr) do
            IO.puts "Matched K value"
            spid = Node.spawn_link(snode, ServMinerSup,:"init",[cmdarg,snode])
            #ServMinerSup.init(cmdarg,snode)
        else
            IO.puts "Invalid input"
        end 
        end
        receive do
            {:EXIT, pid, reason} ->
              :timer.sleep(500)
              IO.puts "Child process exits with reasson #{reason}" 
              if pid === spid do
                Node.spawn_link(snode, ServMinerSup,:"init",[cmdarg,snode]) 
              end
            #add case here
        end
    end
end