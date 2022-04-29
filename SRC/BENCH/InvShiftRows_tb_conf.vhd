library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;

configuration InvShiftRows_tb_conf of InvShiftRows_tb is
	for InvShiftRows_tb_arch
		for DUT : InvShiftRows
			use configuration LIB_RTL.InvShiftRows_conf;
		end for ;
	end for ;
end InvShiftRows_tb_conf;

