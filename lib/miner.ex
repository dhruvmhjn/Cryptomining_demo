defmodule Miner do
  def process(k_value,x,nid) do
    input_srt= "dhruvmhjn"<>nid<>x<>Base.encode64(:crypto.strong_rand_bytes(20))
    hashed_srt = Base.encode16(:crypto.hash(:sha256, input_srt))
    coin_regex = ~r/^0{#{k_value}}/
    if Regex.match?(coin_regex,hashed_srt) do
      IO.puts input_srt<>"\t"<>hashed_srt
    end
    process(k_value,x,nid)
  end
end