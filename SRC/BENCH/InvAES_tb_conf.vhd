library IEEE;
use IEEE.std_logic_1164.all;
library LIB_RTL;

configuration InvAES_tb_conf of InvAES_tb is
	for InvAES_tb_arch
		for DUT : InvAES
			use configuration LIB_RTL.InvAES_conf;
		end for ;
		
	end for ;
end InvAES_tb_conf;
