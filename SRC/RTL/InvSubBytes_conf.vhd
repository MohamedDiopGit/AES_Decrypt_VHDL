library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvSubBytes_conf of InvSubBytes is
	for InvSubBytes_arch -- architecture name
		for Lab_SubBytes1
			for Lab_SubBytes2
				for all : SubBytes
					use entity lib_rtl.SubBytes(SubBytes_arch);
				end for;
			end for;
		end for;
	end for;
end InvSubBytes_conf;

