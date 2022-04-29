library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;

configuration InvMixColumns_tb_conf of InvMixColumns_tb is
	for InvMixColumns_tb_arch
		for DUT : InvMixColumns
			use configuration LIB_RTL.InvMixColumns_conf;
		end for ;
	end for ;
end InvMixColumns_tb_conf;

