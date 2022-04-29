library ieee;
use ieee.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;


entity InvMixColumns is 
	port(
		state_i: in type_state;
        	state_o: out type_state
	);

end InvMixColumns;

architecture InvMixColumns_arch of InvMixColumns is 
	component InvMixColumnsX
		port(
			data_i : in column_state;
			data_o : out column_state
		    );
	end component;
begin
    
	Lab_InvMixColumns1 : for i in 0 to 3 generate
		InvMixColumnsX_1 : InvMixColumnsX
			port map (
					data_i(0) => state_i(0)(i),
					data_i(1) => state_i(1)(i),
					data_i(2) => state_i(2)(i),
					data_i(3) => state_i(3)(i),

					data_o(0) => state_o(0)(i),
					data_o(1) => state_o(1)(i),
					data_o(2) => state_o(2)(i),
					data_o(3) => state_o(3)(i)
				);
	end generate Lab_InvMixColumns1;
end InvMixColumns_arch;
