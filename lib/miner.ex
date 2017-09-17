defmodule Miner do
  def process(k_value,x) do
    length = :rand.uniform(10) 
    input_srt= "dhruvmhjn"<>Integer.to_string(x)<>Base.encode64(:crypto.strong_rand_bytes(length))
    hashed_srt = Base.encode16(:crypto.hash(:sha256, input_srt))
    regex = ~r/^0{#{k_value}}/
    if Regex.match?(regex,hashed_srt) do
      IO.puts input_srt<>"\t"<>hashed_srt
    end
    process(k_value,x)
  end
end
