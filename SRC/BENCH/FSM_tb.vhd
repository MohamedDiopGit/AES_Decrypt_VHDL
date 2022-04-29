-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity FSM_tb is
end FSM_tb;




architecture FSM_tb_arch_Moore of FSM_tb is
	component FSM
	  	port (
		    clock_i     : in std_logic;
		    resetb_i     : in std_logic;
		    start_i         : in  std_logic;
		    round_i		: in bit4;


		    done_o 	: out std_logic;
		    enableCounter_o : out std_logic;
		    enableInvMixColumns_o : out std_logic;
		    enableOutput_o : out std_logic;
		    enableRoundcomputing_o : out std_logic;
		    getciphertext_o : out std_logic;
		    resetCounter_o : out std_logic
		);
        end component;
	signal clock_i_s : std_logic;
	signal resetb_i_s : std_logic;
	signal start_i_s : std_logic;
	signal round_i_s : bit4;

	signal done_o_s : std_logic;
	signal enableCounter_o_s : std_logic;
	signal enableInvMixColumns_o_s : std_logic;
	signal enableOutput_o_s : std_logic;
	signal enableRoundcomputing_o_s : std_logic;
	signal getciphertext_o_s : std_logic;
	signal resetCounter_o_s : std_logic;

	begin 
		DUT : FSM
		
		port map (
				clock_i => clock_i_s,
				resetb_i => resetb_i_s,
				start_i => start_i_s,
				round_i => round_i_s,
			
				done_o => done_o_s,
				enableCounter_o => enableCounter_o_s,
				enableInvMixColumns_o => enableInvMixColumns_o_s,
				enableOutput_o => enableOutput_o_s,
				enableRoundcomputing_o => enableRoundcomputing_o_s,
				getciphertext_o => getciphertext_o_s,
				resetCounter_o => resetCounter_o_s
			);

		start_i_s <= '1';
		clock_p: process 
		begin
			clock_i_s <= '0';
			wait for 1 ns;
			clock_i_s <= '1';
			wait for 1 ns;
		end process;
		resetb_p: process 
		begin
			resetb_i_s <= '0';
			wait for 1100 ns;
			resetb_i_s <= '1';
			wait for 10 ns;
		end process;
		round_p: process 
		begin
			round_i_s <= "1010";
			wait for 100 ns;
			round_i_s <= "1001";
			wait for 100 ns;
			round_i_s <= "0110";
			wait for 100 ns;
			round_i_s <= "0001";
			wait for 100 ns;
			round_i_s <= "0000";
			wait for 100 ns;
		end process;
end FSM_tb_arch_Moore;
