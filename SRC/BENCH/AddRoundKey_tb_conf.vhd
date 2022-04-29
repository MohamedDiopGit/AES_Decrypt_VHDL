-- Fichier de configuration du test bench de l'AddRoundKey
library IEEE;
use IEEE.std_logic_1164.all;

library LIB_RTL;

configuration AddRoundKey_tb_conf of AddRoundKey_tb is
	for AddRoundKey_tb_arch
		for DUT : AddRoundKey
			use configuration LIB_RTL.AddRoundKey_conf;
		end for ;
	end for ;
end AddRoundKey_tb_conf;

