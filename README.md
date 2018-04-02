Group Members:

1) Ashvini Patel
2) Dhruv Mahajan

<<<<<<< HEAD
NOTE: The distributed implementation of this program depends on the init.getif() system call. If the first IP 			address returned is not the address of the machine on the local network, no node can be named correctly. 		Hence nodes can’t connect. In such a case, the server needs to be given it’s correct IP.

1) Size of Work Unit
	
	This has two subparts, first we determine the number of logical processors on any machine (any worker) with a system call. Next with extensive trial and error we determined the ideal numbers of miners/actors a single  logical core can handle. For this will looked at both the CPU utilization numbers and the time function/CPU time to real time ratio. After trying many combinations, we arrived at the minimum number of miners/workers per core that gave us a very high ratio. (3.9 for a 4 core machine). For our implementation, we think that 4 to 5 workers (miners) per core or about 20 miners for a typical 4 core machine is that minimum number. So, our code scales the number of workers spawned on a node  depending on the number of cores available to the Erlang VM  

	Moreover, by appending ID’s  and using a strong random byte generator in the workers’ input, we can say that the miners/actors will always work on separate problems. 

Generation of Random Strings:

	Each miner/actor is passed two strings, the first one is unique to the node it belongs to, i.e. the name of the node. And the second one is a number that is created when the worker is launched. To this String the worker adds a variable lenght random string. This insures that no two workers across nodes will be working on the same problem.
=======
Note 1: The distributed implementation of this program depends on the init.getif() system call. If the first IP address returned is not the address of the machine on the local network, no node can be named correctly. Hence nodes can’t connect. In such a case, the server needs to be given it’s correct IP.
Note 2: epmd -daemon command needs to be run before running the project

1) Size of Work Unit
	This has two subparts, first we determine the number of logical processors on any machine (any worker) with a system call. Next with extensive trial and error we determined the ideal numbers of miners/actors a single  logical core can handle. For this we looked at both the CPU utilization numbers and the time function/CPU time to real time ratio. After trying many combinations, we arrived at the minimum number of miners/workers per core that gave us a very high ratio. (~3.9 for a 4 core machine). For our implementation, we think that 4 to 5 workers (miners) per core or about 20 miners for a typical 4 core machine is that minimum number. We've tested this only for Intel Laptop processors (core i5/i7). So, our code scales the number of workers spawned on a node depending on the number of cores available to the Erlang VM.  

	Moreover, by appending ID’s  and using a strong random byte generator in the workers’ input, we can say that the miners/actors will always work on separate problems. 

Generation of Randon Strings:
	Each miner/actor is passed two strings, the first one is unique to the node it belongs to, i.e. the name of the node. And the second one is a number that is assinged when the worker/miner is created. To this String the worker/miner adds a variable length random string. This insures that no two workers across any node will be working on the same problem.
>>>>>>> 24ea2e8c41752150a68155c58d5532e703eeed01

	Final Input Str: <GatorLink ID> + <Str 1: Node> + <Str 2: Worker Number> + <Variable length random string>

Note: The last part, ie <Variable lenght random string> changes everytime the worker calls itself.


2) Results for running ./project1 4 (For ~10 Sec runtime only)

$ ./project1 4
dhruvmhjn0.1108uneoYwYzVaIknng3slwjw==  000084E1FEB78846766F228B6AA25BA17D3C1FD7AFA6FFC85E0D9E7D391865B3
dhruvmhjn0.112lpr8oKo1sOR06Zk=  0000E0309CFD2CA908987BD7BF1DEC2E5649CB5240310BB7957F1DE2EDB6CC9F
dhruvmhjn0.14ORY7jmA=   0000D4E7FB4098BDC202AA9352CC0D79A57734EDBEB4796394D862006F5E8399
dhruvmhjn0.15plgBDuR2FE3R       0000A8BBE7B92260755D2CF2A73DCAAA3F89362ECEBBDEFB449C08817E854CD8
dhruvmhjn0.114EY1lLvGzE6PRXtNyMdXC15yY  00006A29B7D1DB11B3B772C261802E09AE73112928F0A974021743C71C4946B5
dhruvmhjn0.15bqu3YLbH5mZ10ExGARa+2UM=   00000E42C8AE41879E14B12FF9933B7D2110E09E4BA714FE02ECD189C2FE27B0
dhruvmhjn0.15ZNU2oweKVA==       00000750266AE1055763BE34300A9B69A4C9EBAF1B295EE3FFE28E5C1DAFB902
dhruvmhjn0.11ysIY35yLL97xbAPuED0VAIX9LQ==       00004F505BC3B11DA14654119FB32AFBC60A4343A47CFFB33AA900DBDCEE999B
dhruvmhjn0.113MPh9      00009A868875FDCD56508B66AD28A186B90569B0146692E87CEA5327A4940C51
dhruvmhjn0.14SHMks9f189LdzbBe   00004012899723EEDDC0E43B07F1DFCF6A97657B45551C5A6F1F5145AA4DD433
dhruvmhjn0.113UIAsXQ==  00004E9EEAD34DC520BEE8A630089431E36BEF37AC0D11BE3BF389AFBE261535
dhruvmhjn0.15Tm1TAW+srEuD       0000E2CF3ACE561D0C19C5998A66CF2AFDBBEFB17C78715F5B196EAFE82FDAA8
dhruvmhjn0.115H83AUkj50A==      0000BB731B3A0E2078B83F332DD31686745B4825C74D8BCE4F2CD3D4126E95F8
dhruvmhjn0.191kQz1JfqFxMW+Qy2aNg=       0000CC900B017820A32654299E35DB0F2CA453A6294CC958DCB9FB0321ED2902
dhruvmhjn0.12SFsZApajnqHcQ2FuWivqq5W9   0000DADD79DD0DAC2B27474D4C16AC1F3B6FDF2685BDCC503803B7BD4EF4D2F6
dhruvmhjn0.19ygyXGjg=   00005027F5D5AC056E2E651166B2F2C18053EB4A56189556AF5E95096F6823BE
dhruvmhjn0.16+vE=       000036473C179DD4FAEB812EDE02DFC4CEC051474D7F2DCC4DE72B03958B06CE
dhruvmhjn0.112cGAFAlnqLB4=      0000BD5E6BED46D1889C75157E466A25754355751A8A36076536DE7E65CA3556
dhruvmhjn0.111q0+QsAti79M2EPQ=  0000D8D57D48B6D6F35AC801FD3A71A8827A072E100C5150F13F37BE11FFD771
dhruvmhjn0.116TbZmiEpNRTeClQ==  0000C03B65C9CBD3A39F98797AD7D1AA5592DAA8A984EAA31CF1A8169E6DF64A
dhruvmhjn0.17OEakBkqDSLkcfuGixeOOt8VBHQ==       0000EAB1FD23D02B6D70F6FE22FB902A36B83098E32A5544767155BCC592625F
dhruvmhjn0.111jjTnMB9uQoo6j8fv3IIY6/Fk3g==      0000EC2864269F9132C0B1115D5C7E6AFF0FB6435ADBF6C2266D11413965FEB7
dhruvmhjn0.112p5MrCHMiMzJqnTpV  0000D05355B07CECE78143146A49F37777E99C706ABE9E608AE05C892DF8F4C5
dhruvmhjn0.114Q70nDcTXcQ==      00009C340E4F580D9A6BC2E767D94F0507EDDF014EDB2CAC6842FAE1FFB2D146
dhruvmhjn0.14Y5WxLo+P7rnYUw==   00007ECEF67A5D321A52DC9377B4D9FB22080610CAD158AF09DC01E344BDE47C
dhruvmhjn0.19rDdxnbZtLFRo       0000A63405D73B4915C723E1534FE9CFCA4E0178C0DADAA235826ABF2E2AFD7C
dhruvmhjn0.111ML5I4++TbzF9      00001F06232CF855A24EC718EBD83F6B3BE0D5A83D77044F459F38AE3A9C9623
dhruvmhjn0.12Ax/WEg==   000004B1D73BA6E530F5EF4547594A4109EE1BB8197BF7A9BDCCDBA276CE1987
dhruvmhjn0.19dzfM       0000E7CBFCBA8366C9483CCD3A5FDBD7CC4C6344D19A933AFBD4A170843850F0
dhruvmhjn0.13JIH/vzto1xFh3mxBMGnx/dI=   000062C664C7E297CAE848708333E3BBD9FA295312A4F7EC3A833369FF298503


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


