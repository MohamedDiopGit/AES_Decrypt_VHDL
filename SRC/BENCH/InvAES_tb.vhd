-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAES_tb is
end InvAES_tb;




architecture InvAES_tb_arch of InvAES_tb is
	component InvAES
	  	port (
			startAES_i : in std_logic;
			resetAES_i : in std_logic;
			dataAES_i : in bit128;
			clockAES_i : in std_logic;

			aes_done_o : out std_logic;
			data_o : out bit128

		);
        end component;
	signal startAES_i_s : std_logic;
	signal resetAES_i_s : std_logic;
	signal dataAES_i_s : bit128;
	signal clockAES_i_s : std_logic;

	signal aes_done_o_s : std_logic;
	signal data_o_s : bit128;
	begin 
		DUT : InvAES
		
		port map (
				startAES_i => startAES_i_s,
				resetAES_i => resetAES_i_s,
				dataAES_i => dataAES_i_s,
				clockAES_i => clockAES_i_s,
				
				aes_done_o => aes_done_o_s,
				data_o => data_o_s
			);
		dataAES_i_s <= x"8c11354406ad4488decaec83aa034306";
		start_p: process        -- Simulation d'un start
		begin
			startAES_i_s <= '0';
			wait for 120 ns;			
			startAES_i_s <= '1';
			wait for 200 ns;
			startAES_i_s <= '0';
			wait for 2000 ns;
		end process;
			
		clock_p: process 		-- Génération d'une horloge
		begin
			clockAES_i_s <= '0';
			wait for 10 ns;
			clockAES_i_s <= '1';
			wait for 10 ns;
		end process;
		resetb_p: process 		-- Simulation d'un reset
		begin
			resetAES_i_s <= '1';
			wait for 100 ns;
			resetAES_i_s <= '0';
			wait for 2000 ns;
		end process;

end InvAES_tb_arch;
