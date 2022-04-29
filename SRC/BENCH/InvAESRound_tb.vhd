-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAESRound_tb is
end InvAESRound_tb;




architecture InvAESRound_tb_arch of InvAESRound_tb is
	component InvAESRound
        port(
		InvAES_state_i : in type_state;
		InvAES_state_o : out type_state;
		InvAES_round_key_i : in type_state;
		enable_Round_i : in std_logic;
		enable_InvMixColumns_i : in std_logic;
		clock_i : in std_logic;
		reset_i : in std_logic
        );
	end component;
    	signal InvAES_state_i_s: type_state;
    	signal InvAES_state_o_s: type_state;
	signal InvAES_round_key_i_s : type_state;
	signal enable_Round_i_s : std_logic;
	signal enable_InvMixColumns_i_s : std_logic;
	signal clock_i_s : std_logic;
	signal reset_i_s : std_logic;
	begin 
		DUT : InvAESRound
		
		port map (
			InvAES_state_i => InvAES_state_i_s,
            		InvAES_state_o => InvAES_state_o_s,
			InvAES_round_key_i => InvAES_round_key_i_s, 
			enable_Round_i => enable_Round_i_s,
			enable_InvMixColumns_i => enable_InvMixColumns_i_s,
			clock_i => clock_i_s,
			reset_i => reset_i_s
			);
	 	
		clock_i_s <= '0' and '1' after 50 ns;
		reset_i_s <= '0';
		enable_Round_i_s <= '1';
		enable_InvMixColumns_i_s <= '0';

		-- Matrice d'entrée
		InvAES_state_i_s(0)(0) <= x"6b";
		InvAES_state_i_s(0)(1) <= x"88";
		InvAES_state_i_s(0)(2) <= x"a6";
		InvAES_state_i_s(0)(3) <= x"db";
		InvAES_state_i_s(1)(0) <= x"14";
		InvAES_state_i_s(1)(1) <= x"2d";
		InvAES_state_i_s(1)(2) <= x"87";
		InvAES_state_i_s(1)(3) <= x"19";
		InvAES_state_i_s(2)(0) <= x"25";
		InvAES_state_i_s(2)(1) <= x"06";
		InvAES_state_i_s(2)(2) <= x"77";
		InvAES_state_i_s(2)(3) <= x"a2";
		InvAES_state_i_s(3)(0) <= x"4f";
		InvAES_state_i_s(3)(1) <= x"f6";
		InvAES_state_i_s(3)(2) <= x"8d";
		InvAES_state_i_s(3)(3) <= x"63";
		
		-- Round Key
		InvAES_round_key_i_s(0)(0) <= x"0b";
		InvAES_round_key_i_s(0)(1) <= x"69";
		InvAES_round_key_i_s(0)(2) <= x"f6";
		InvAES_round_key_i_s(0)(3) <= x"09";
		InvAES_round_key_i_s(1)(0) <= x"b8";
		InvAES_round_key_i_s(1)(1) <= x"85";
		InvAES_round_key_i_s(1)(2) <= x"cd";
		InvAES_round_key_i_s(1)(3) <= x"57";
		InvAES_round_key_i_s(2)(0) <= x"15";
		InvAES_round_key_i_s(2)(1) <= x"52";
		InvAES_round_key_i_s(2)(2) <= x"d9";
		InvAES_round_key_i_s(2)(3) <= x"7a";
		InvAES_round_key_i_s(3)(0) <= x"4b";
		InvAES_round_key_i_s(3)(1) <= x"75";
		InvAES_round_key_i_s(3)(2) <= x"70";
		InvAES_round_key_i_s(3)(3) <= x"6b";
		
		
end InvAESRound_tb_arch;
