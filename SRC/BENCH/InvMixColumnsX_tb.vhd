-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvMixColumnsX_tb is
end InvMixColumnsX_tb;




architecture InvMixColumnsX_tb_arch of InvMixColumnsX_tb is
	component InvMixColumnsX
        port(
            data_i: in column_state;
            data_o: out column_state
        );
	end component;

	signal data_i_s : column_state;
	signal data_o_s : column_state;
	begin 
		DUT : InvMixColumnsX
		
		port map (
			data_i => data_i_s,
            		data_o => data_o_s
			);

		-- Colonne d'entrée
		data_i_s(0) <= x"74";
		data_i_s(1) <= x"ad";
		data_i_s(2) <= x"d2";
		data_i_s(3) <= x"b0";
		
end InvMixColumnsX_tb_arch;
