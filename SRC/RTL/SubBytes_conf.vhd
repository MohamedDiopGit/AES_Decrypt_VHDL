library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration SubBytes_conf of SubBytes is
	for SubBytes_arch -- architecture name
	end for;
end SubBytes_conf;

