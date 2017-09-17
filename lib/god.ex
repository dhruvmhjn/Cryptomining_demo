defmodule God do
    def main(args) do
        args |> parse_args 
    end

    defp parse_args(args) do
        cmdarg = OptionParser.parse(args) 
        {[],[argumentstr],[]} = cmdarg
        kregex = ~r/^\d{1,2}$/
        ipregex = ~r/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/

        if Regex.match?(ipregex,argumentstr)do
            IO.puts "Matched IP value"
        else if Regex.match?(kregex,argumentstr) do
            IO.puts "Matched K value"
            ServMinerSup.init(cmdarg)
        else
            IO.puts "Invalid input"
        end 
        end
       
    end
end