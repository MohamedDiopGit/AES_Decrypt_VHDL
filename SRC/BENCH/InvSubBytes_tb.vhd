-- library declaration
library ieee;
use ieee.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvSubBytes_tb is
end InvSubBytes_tb;




architecture InvSubBytes_tb_arch of InvSubBytes_tb is
	component InvSubBytes
		port(
		    state_i: in type_state;
		    state_o: out type_state
		);
	end component;

	signal state_i_s : type_state;
	signal state_o_s : type_state;
	begin 
		DUT : InvSubBytes
		
		port map (
			state_i => state_i_s,
            		state_o => state_o_s
			);

		-- Matrice d'entrée
		state_i_s(0)(0) <= x"6b";
		state_i_s(0)(1) <= x"88";
		state_i_s(0)(2) <= x"a6";
		state_i_s(0)(3) <= x"db";
		state_i_s(1)(0) <= x"19";
		state_i_s(1)(1) <= x"14";
		state_i_s(1)(2) <= x"2d";
		state_i_s(1)(3) <= x"87";
		state_i_s(2)(0) <= x"77";
		state_i_s(2)(1) <= x"a2";
		state_i_s(2)(2) <= x"25";
		state_i_s(2)(3) <= x"06";
		state_i_s(3)(0) <= x"f6";
		state_i_s(3)(1) <= x"8d";
		state_i_s(3)(2) <= x"63";
		state_i_s(3)(3) <= x"4f";

end InvSubBytes_tb_arch;
