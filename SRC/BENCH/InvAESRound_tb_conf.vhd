library IEEE;
use IEEE.std_logic_1164.all;
library LIB_RTL;

configuration InvAESRound_tb_conf of InvAESRound_tb is
	for InvAESRound_tb_arch
		for DUT : InvAESRound
			use configuration LIB_RTL.InvAESRound_conf;
		end for ;
		
	end for ;
end InvAESRound_tb_conf;

