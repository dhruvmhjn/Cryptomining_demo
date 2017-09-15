defmodule Example do
  @moduledoc """
  Documentation for Example.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Example.hello
      :world

  """
  def main(args) do
    args |> parse_args |> process
  end

  def process({[],[],[]}) do
    IO.puts "No arguments given"
  end

  def process({_, [options], _}) do
    #Myspawn.createprocess
    x = [options]
    IO.puts x
    IO.puts "You want #{options} leading zeroes"
    IO.puts "Now lets try to compute a random string hash"
    abc = :rand.uniform(40)
    IO.puts "The length of the random string is "<>to_string(abc+10)
    rand_string = random_string(abc+10)
    IO.puts "dhruvmhjn"<>rand_string
    IO.puts Base.encode16(:crypto.hash(:sha256, "dhruvmhjn"<>rand_string))
    #process(,x,) MAKE THIS TAIL RECURSIVE, CANT CALL PROCESS 
  end

  defp random_string(length) do
    Base.encode64(:crypto.strong_rand_bytes(length))
  end

  defp parse_args(args) do
     cmdarg = OptionParser.parse(args)
     cmdarg
  end
 end
