library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;

configuration InvMixColumnsX_tb_conf of InvMixColumnsX_tb is
	for InvMixColumnsX_tb_arch
		for DUT : InvMixColumnsX
			use configuration LIB_RTL.InvMixColumnsX_conf;
		end for ;
	end for ;
end InvMixColumnsX_tb_conf;

