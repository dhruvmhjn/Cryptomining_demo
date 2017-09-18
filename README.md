# Dos1

Note: The distributed implementation of this program depends on the init.getif() system call. If the first IP address returned is not the address of the machine on the local network, no node can be named correctly. Hence nodes can’t connect. In such a case, the server needs to be given it’s correct IP.

1) Size of Work Unit
	This has two subparts, first we determine the number of logical processors on any machine (any worker) with a system call. Next with extensive trial and error we determined the ideal numbers of miners/actors a single  logical core can handle. For this will looked at both the CPU utilization numbers and the time function/CPU time to real time ratio. After trying many combinations, we arrived at the minimum number of miners/workers per core that gave us a very high ratio. (3.9 for a 4 core machine). For our implementation, we think that 4 to 5 workers (miners) per core or about 20 miners for a typical 4 core machine is that minimum number. So, our code scales the number of workers spawned on a node  depending on the number of cores available to the Erlang VM  

Moreover, by appending ID’s  and using a strong random byte generator in the workers’ input, we can say that the miners/actors will always work on separate problems. 

Generation of 


2)

3)
By running code ./project1 5 on a machine with 4 logical threads.

dhruv@dhruv-pc:~/Desktop/dos/dos1$ time ./dos1 5

real    1m2.598s
user    4m2.892s
sys     0m0.628s


This ratio is approximately 3.9 for machines with 4 logical threads. We have tested this extensively.


4)The coin with the most 0s.
Found 2 coins with 8 leading zeros, by using a cluster of 3 machines each with 4 logical threads running for about 20 mins.


Coin 1: 
dhruvmhjnadnode@192.168.0.14174zcoeKF2UinOf1Q==	00000000AF276705318259FD80A0B3031E2F63785E4476B6FA456757031816D7

Coin 2: dhruvmhjnadnode@192.168.0.1413648kbMlw=	00000000539445806CFC40A81186C764B3A1E5FF7C80BFD29F1F2224890A74CB

5) The largest number of working machines you were able to run your code
with: Total of 4 machines. 3 were just workers, last one both a server and worker.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/dos1](https://hexdocs.pm/dos1).

