-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity AddRoundKey_tb is
end AddRoundKey_tb;




architecture AddRoundKey_tb_arch of AddRoundKey_tb is
	component AddRoundKey
		port (
			state_i : in type_state;
			round_key_i : in type_state;
			state_o : out type_state
		);
	end component;
	signal state_i_s : type_state;
	signal round_key_i_s : type_state;
	signal state_o_s : type_state;
	begin 
		DUT : AddRoundKey
		
		port map (
			state_i => state_i_s,
			round_key_i => round_key_i_s,
			state_o => state_o_s
			);
		
		-- Matrice d'entrée
		state_i_s(0)(0) <= x"8c";
		state_i_s(0)(1) <= x"06";
		state_i_s(0)(2) <= x"de";
		state_i_s(0)(3) <= x"aa";
		state_i_s(1)(0) <= x"11";
		state_i_s(1)(1) <= x"ad";
		state_i_s(1)(2) <= x"ca";
		state_i_s(1)(3) <= x"03";
		state_i_s(2)(0) <= x"35";
		state_i_s(2)(1) <= x"44";
		state_i_s(2)(2) <= x"ec";
		state_i_s(2)(3) <= x"43";
		state_i_s(3)(0) <= x"44";
		state_i_s(3)(1) <= x"88";
		state_i_s(3)(2) <= x"83";
		state_i_s(3)(3) <= x"06";
		
		-- Round Key
		round_key_i_s(0)(0) <= x"e7";
		round_key_i_s(0)(1) <= x"8e";
		round_key_i_s(0)(2) <= x"78";
		round_key_i_s(0)(3) <= x"71";
		round_key_i_s(1)(0) <= x"05";
		round_key_i_s(1)(1) <= x"80";
		round_key_i_s(1)(2) <= x"4d";
		round_key_i_s(1)(3) <= x"1a";
		round_key_i_s(2)(0) <= x"10";
		round_key_i_s(2)(1) <= x"42";
		round_key_i_s(2)(2) <= x"9b";
		round_key_i_s(2)(3) <= x"e1";
		round_key_i_s(3)(0) <= x"0b";
		round_key_i_s(3)(1) <= x"7e";
		round_key_i_s(3)(2) <= x"0e";
		round_key_i_s(3)(3) <= x"65";
		
		

end AddRoundKey_tb_arch;
