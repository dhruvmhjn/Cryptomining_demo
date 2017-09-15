defmodule Example do
  # @moduledoc """
  # Documentation for Example.
  # """
  # @doc """
  # Hello world.
  # ## Examples
  #     iex> Example.hello
  #     :world
  # """
  def main(args) do
    args |> parse_args |> process
  end

  def process({[],[],[]}) do
    IO.puts "No arguments given"
  end

  def process({_, [k_value], _}) do
    #Myspawn.createprocess
    
    x = [k_value]
    IO.puts x
    
    IO.puts "You want #{k_value} leading zeroes"
    abc = :rand.uniform(40)
    IO.puts "The length of the random string is: "<>to_string(abc+10)
    rand_string = random_string(abc+10)
    input_srt= "dhruvmhjn"<>rand_string
    IO.puts input_srt
    hashed_srt = Base.encode16(:crypto.hash(:sha256, input_srt))
    IO.puts "SHA256, base 16 hash is: "<>hashed_srt
    regex = ~r/^0{#{k_value}}/
    checkvalid(Regex.match?(regex,hashed_srt),input_srt)
    #process(,x,) MAKE THIS TAIL RECURSIVE, CANT CALL PROCESS 
    process({_, x, _})
  end

  def checkvalid(true,input) do
    IO.puts "VALID Bitcoin for string: #{input}"
  end

  def checkvalid(false,_) do
    IO.puts "Invalid Bitcoin"
  end


  defp random_string(length) do
    Base.encode64(:crypto.strong_rand_bytes(length))
  end

  defp parse_args(args) do
     cmdarg = OptionParser.parse(args)
     cmdarg
  end
 end
