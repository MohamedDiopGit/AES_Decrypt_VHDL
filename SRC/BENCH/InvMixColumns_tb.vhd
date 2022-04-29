-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvMixColumns_tb is
end InvMixColumns_tb;




architecture InvMixColumns_tb_arch of InvMixColumns_tb is
	component InvMixColumns
        port(
            state_i: in type_state;
            state_o: out type_state
        );
	end component;

	signal state_i_s : type_state;
	signal state_o_s : type_state;
	begin 
		DUT : InvMixColumns
		
		port map (
			state_i => state_i_s,
            		state_o => state_o_s
			);

		-- Matrice d'entrée
		state_i_s(0)(0) <= x"74";
		state_i_s(0)(1) <= x"ad";
		state_i_s(0)(2) <= x"d2";
		state_i_s(0)(3) <= x"b0";
		state_i_s(1)(0) <= x"6c";
		state_i_s(1)(1) <= x"7f";
		state_i_s(1)(2) <= x"15";
		state_i_s(1)(3) <= x"40";
		state_i_s(2)(0) <= x"e0";
		state_i_s(2)(1) <= x"68";
		state_i_s(2)(2) <= x"e6";
		state_i_s(2)(3) <= x"15";
		state_i_s(3)(0) <= x"09";
		state_i_s(3)(1) <= x"28";
		state_i_s(3)(2) <= x"8b";
		state_i_s(3)(3) <= x"ef";
		
end InvMixColumns_tb_arch;
