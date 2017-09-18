Group Members:

1) Ashvini Patel, UFID: 47949297
2) Dhruv Mahajan, UFID: 42111994

Note: The distributed implementation of this program depends on the init.getif() system call. If the first IP address returned is not the address of the machine on the local network, no node can be named correctly. Hence nodes can’t connect. In such a case, the server needs to be given it’s correct IP.

1) Size of Work Unit
	This has two subparts, first we determine the number of logical processors on any machine (any worker) with a system call. Next with extensive trial and error we determined the ideal numbers of miners/actors a single  logical core can handle. For this we looked at both the CPU utilization numbers and the time function/CPU time to real time ratio. After trying many combinations, we arrived at the minimum number of miners/workers per core that gave us a very high ratio. (~3.9 for a 4 core machine). For our implementation, we think that 4 to 5 workers (miners) per core or about 20 miners for a typical 4 core machine is that minimum number. We've tested this only for Intel Laptop processors (core i5/i7). So, our code scales the number of workers spawned on a node depending on the number of cores available to the Erlang VM.  

	Moreover, by appending ID’s  and using a strong random byte generator in the workers’ input, we can say that the miners/actors will always work on separate problems. 

Generation of Randon Strings:
	Each miner/actor is passed two strings, the first one is unique to the node it belongs to, i.e. the name of the node. And the second one is a number that is assinged when the worker/miner is created. To this String the worker/miner adds a variable length random string. This insures that no two workers across any node will be working on the same problem.

	Final Input Str: <GatorLink ID> + <Str 1: Node> + <Str 2: Worker Number> + <Variable length random string>

Note: The last part, ie <Variable lenght random string> changes everytime the worker calls itself.


2) Results for running ./project1 4 (For ~30 Sec runtime only)


3) By running code ./project1 5 on a machine with 4 logical threads. RATIO: 3.9 (FOR 4 CORE MACHINE)

Command: dhruv@dhruv-pc:~/Desktop/dos/project1$ time ./project1 5

Time:
real    1m2.598s
user    4m2.892s
sys     0m0.628s

This ratio is approximately 3.9 for machines with 4 logical threads. We have tested this extensively.


4)The coin with the most 0s.

Found 4 coins with 8 leading zeros, by using 3 machines each with 4 logical threads running for about 2 hours.


Coin 1: dhruvmhjnadnode@192.168.0.14174zcoeKF2UinOf1Q==	00000000AF276705318259FD80A0B3031E2F63785E4476B6FA456757031816D7

Coin 2: dhruvmhjnadnode@192.168.0.1413648kbMlw=	00000000539445806CFC40A81186C764B3A1E5FF7C80BFD29F1F2224890A74CB

Coin 3: dhruvmhjn0.133RWYutUAa8ioP4U6S1XZZayRuxuM=	00000000A0D4BA9EFE4428CCA10F5F368AF12C039DB12E1D6DF741E6FAEADFFA

Coin 4: dhruvmhjn0.1562GqXI09+9j9uFrsKysD09NbmOqRo=	0000000044400118A3EE6060D48444A4229F583D2C30FC83FB8C8F75B4626073


5) The largest number of working machines you were able to run your code with:

Ans:  Total of 4 machines. 3 were just workers, last one both a server and worker.


