library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvAESRound_conf of InvAESRound is
	for InvAESRound_arch -- architecture name
		for all : InvShiftRows
		    use entity LIB_RTL.InvShiftRows(InvShiftRows_arch);
		end for;

		for all : InvSubBytes
		    use entity LIB_RTL.InvSubBytes(InvSubBytes_arch);
		end for;

		for all : AddRoundKey
		    use entity LIB_RTL.AddRoundKey(AddRoundKey_arch);
		end for;

		for all : InvMixColumns
		    use entity LIB_RTL.InvMixColumns(InvMixColumns_arch);
		end for;

	end for;
end InvAESRound_conf;
