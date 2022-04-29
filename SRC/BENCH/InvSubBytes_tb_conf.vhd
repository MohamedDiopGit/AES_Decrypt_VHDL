library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvSubBytes_tb_conf of InvSubBytes_tb is
	for InvSubBytes_tb_arch
		for DUT : InvSubBytes
			use configuration LIB_RTL.InvSubBytes_conf;
		end for ;
	end for ;
end InvSubBytes_tb_conf;

