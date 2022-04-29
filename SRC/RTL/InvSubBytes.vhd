library IEEE;
use IEEE.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvSubBytes is
    port(
	state_i : in type_state;
        state_o : out type_state
	);
end entity;



architecture InvSubBytes_arch of InvSubBytes is

	component SubBytes
		port(
			data_i : in bit8;
			data_o : out bit8
		    );
	end component;
begin
	Lab_SubBytes1 : for i in 0 to 3 generate
		Lab_SubBytes2 : for j in 0 to 3 generate
			SubBytes1 : SubBytes
				port map (
					data_i => state_i(i)(j),
					data_o => state_o(i)(j)
					);
		end generate Lab_SubBytes2;
	end generate Lab_SubBytes1;
end architecture;
