-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


library LIB_AES;
use LIB_AES.state_definition_package.all;


entity InvShiftRows_tb is
end InvShiftRows_tb;




architecture InvShiftRows_tb_arch of InvShiftRows_tb is
	component InvShiftRows
		port (
			state_i  : in type_state;
			state_o : out type_state
		);
	end component;
	signal state_i_s : type_state;
	signal state_o_s : type_state;
	begin 
		DUT : InvShiftRows
		port map (
			state_i => state_i_s,
			state_o => state_o_s
			);


		-- Matrice d'entrée
		state_i_s(0)(0) <= x"6b";
		state_i_s(0)(1) <= x"19";
		state_i_s(0)(2) <= x"77";
		state_i_s(0)(3) <= x"f6";
		state_i_s(1)(0) <= x"88";
		state_i_s(1)(1) <= x"14";
		state_i_s(1)(2) <= x"a2";
		state_i_s(1)(3) <= x"8d";
		state_i_s(2)(0) <= x"a6";
		state_i_s(2)(1) <= x"2d";
		state_i_s(2)(2) <= x"25";
		state_i_s(2)(3) <= x"63";
		state_i_s(3)(0) <= x"db";
		state_i_s(3)(1) <= x"87";
		state_i_s(3)(2) <= x"06";
		state_i_s(3)(3) <= x"4f";

end InvShiftRows_tb_arch;
