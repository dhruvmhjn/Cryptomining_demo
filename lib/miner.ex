defmodule Miner do

  # def main(args) do
  #   args |> parse_args |> process
  # end
  # def callMiner(k) do
  #   IO.inspect k
  #   IO.puts "Miner called upon with k value #{k}"
  #  end

  #  def process([]) do
  #    IO.puts "No arguments given"
  #  end



  def process(k_value) do
    abc = :rand.uniform(40)
    rand_string = random_string(abc+10)
    input_srt= "dhruvmhjn"<>rand_string
    hashed_srt = Base.encode16(:crypto.hash(:sha256, input_srt))
    regex = ~r/^0{#{k_value}}/
    if Regex.match?(regex,hashed_srt) do
      IO.puts input_srt<>"\t"<>hashed_srt
    end
    process(k_value)
  end

  defp random_string(length) do
    Base.encode64(:crypto.strong_rand_bytes(length))
  end

  # defp parse_args(args) do
  #    cmdarg = OptionParser.parse(args)
  #    cmdarg
  # end
 end
