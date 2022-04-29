
library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvAES_conf of InvAES is
	for InvAES_arch -- architecture name
		for all : FSM
		    use entity LIB_RTL.FSM(FSM_arch_Moore);
		end for;

		for all : KeyExpansion_table
		    use entity LIB_RTL.KeyExpansion_table(KeyExpansion_table_arch);
		end for;

		for all : Counter
		    use entity LIB_RTL.Counter(Counter_arch);
		end for;

		for all : InvAESRound
		    use entity LIB_RTL.InvAESRound(InvAESRound_arch);
		end for;
	end for;
end InvAES_conf;
