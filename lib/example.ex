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
    IO.puts Myspawn.printhello
    IO.puts "You want #{options} leading zeroes"

    IO.puts "Now lets try to compute hash a"
    
    IO.puts Base.encode16(:crypto.hash(:sha256, "foobar"))

    IO.puts random_string(10)
  end
  defp random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64
  end

  defp parse_args(args) do
     cmdarg = OptionParser.parse(args)
     cmdarg
  end
 end
