library IEEE;
use IEEE.std_logic_1164.all;
library LIB_RTL;

configuration FSM_tb_conf of FSM_tb is
	for FSM_tb_arch_Moore
		for DUT : FSM
			use configuration LIB_RTL.FSM_conf;
		end for ;
		
	end for ;
end FSM_tb_conf;
