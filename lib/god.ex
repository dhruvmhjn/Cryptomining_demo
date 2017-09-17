defmodule God do
    def main(args) do
        nameofsnode = :"dnode@192.168.0.13"
        Node.start nameofsnode
        IO.inspect Node.self
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
        else if Regex.match?(kregex,argumentstr) do
            IO.puts "Matched K value"
            ServMinerSup.init(cmdarg,snode)
        else
            IO.puts "Invalid input"
        end 
        end
       
    end
end