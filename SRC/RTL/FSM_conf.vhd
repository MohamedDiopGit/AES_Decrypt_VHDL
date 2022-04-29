library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration FSM_conf of FSM is
	for FSM_arch_Moore -- architecture name
	end for;
end FSM_conf;

