defmodule God do
    def main(args) do
        args |> parse_args |> ServMinerSup.init()
    end

    defp parse_args(args) do
        cmdarg = OptionParser.parse(args)  
        cmdarg
    end



end