library ieee;
use ieee.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity AddRoundKey is 
	port(
		state_i : in type_state;
		round_key_i : in type_state;
		state_o : out type_state
	);

end entity;

architecture AddRoundKey_arch of AddRoundKey is  
begin
	-- COLONNE 0
	state_o(0)(0) <= state_i(0)(0) xor round_key_i(0)(0);  -- Format (ligne, colonne)
	state_o(1)(0) <= state_i(1)(0) xor round_key_i(1)(0);
	state_o(2)(0) <= state_i(2)(0) xor round_key_i(2)(0);
	state_o(3)(0) <= state_i(3)(0) xor round_key_i(3)(0);
	
	-- COLONNE 1
	state_o(0)(1) <= state_i(0)(1) xor round_key_i(0)(1);
	state_o(1)(1) <= state_i(1)(1) xor round_key_i(1)(1);
	state_o(2)(1) <= state_i(2)(1) xor round_key_i(2)(1);
	state_o(3)(1) <= state_i(3)(1) xor round_key_i(3)(1);
	
	-- COLONNE 2
	state_o(0)(2) <= state_i(0)(2) xor round_key_i(0)(2);
	state_o(1)(2) <= state_i(1)(2) xor round_key_i(1)(2);
	state_o(2)(2) <= state_i(2)(2) xor round_key_i(2)(2);
	state_o(3)(2) <= state_i(3)(2) xor round_key_i(3)(2);
	
	-- COLONNE 3
	state_o(0)(3) <= state_i(0)(3) xor round_key_i(0)(3);
	state_o(1)(3) <= state_i(1)(3) xor round_key_i(1)(3);
	state_o(2)(3) <= state_i(2)(3) xor round_key_i(2)(3);
	state_o(3)(3) <= state_i(3)(3) xor round_key_i(3)(3);
end AddRoundKey_arch;
