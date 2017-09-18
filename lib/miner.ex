defmodule Miner do
  def process(k_value,x,nodename) do
    input_srt= "dhruvmhjn"<>to_string(nodename)<>Integer.to_string(x)<>Base.encode64(:crypto.strong_rand_bytes(20))
    hashed_srt = Base.encode16(:crypto.hash(:sha256, input_srt))
    coin_regex = ~r/^0{#{k_value}}/
    if Regex.match?(coin_regex,hashed_srt) do
      IO.puts input_srt<>"\t"<>hashed_srt
    end
    process(k_value,x,nodename)
  end
end