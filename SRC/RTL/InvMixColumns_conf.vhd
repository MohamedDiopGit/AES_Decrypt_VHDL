library ieee;
use ieee.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;


configuration InvMixColumns_conf of InvMixColumns is
	for InvMixColumns_arch
		for Lab_InvMixColumns1
			for all : InvMixColumnsX
				use entity lib_rtl.InvMixColumnsX(InvMixColumnsX_arch);
			end for;		
		end for;
	end for;
end InvMixColumns_Conf;
