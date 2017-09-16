defmodule MyTest do
     def sayhi do
        a = Kernel.inspect(Node.self)
        IO.puts "this is a text"<>a
        sayhi()
     end
end