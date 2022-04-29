library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;
library LIB_RTL;

entity InvAES is
	port(
		startAES_i : in std_logic;
		resetAES_i : in std_logic;
		dataAES_i : in bit128;
		clockAES_i : in std_logic;

		aes_done_o : out std_logic;
		data_o : out bit128
	);
end entity;

architecture InvAES_arch of InvAES is
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

	component KeyExpansion_table
  		port (
			round_i         : in  bit4;
        		expansion_key_o : out bit128
		      );
	end component;

	component Counter
		port(	
			reset_i : in  std_logic;
			enable_i : in  std_logic;
			clock_i  : in  std_logic;
			count_o  : out bit4
		);
	end component;
    
	signal round_i_s : bit4;
	signal enableCounter_o_s : std_logic;
	signal resetCounter_o_s : std_logic;
	signal getciphertext_o_s : std_logic;
	signal enableRoundcomputing_o_s : std_logic;
	signal enableInvMixColumns_o_s : std_logic;
	signal enableOutput_o_s : std_logic;
	signal expansion_key128_o_s : bit128;
	signal expansion_keyState_o_s : type_state;
	signal InvAES_state_o_s : type_state;
	signal dataAES_state_i : type_state;
	signal InvAES_state_i_s : type_state;   -- Choisir entre  dataAES_i et InvAES_state_o_s
	signal data_o_s : bit128;
	signal aes_done_o_s : std_logic;

begin
     
    -- Conversion du BIT128 en TYPE_STATE
    G1 : for col in 0 to 3 generate
        G2 : for row in 0 to 3 generate

			-- Conversion du cipher text initial BIT128 en TYPE_STATE
            dataAES_state_i(row)(col) <= dataAES_i(127 - 32 * col - 8 * row downto 120 - 32 * col - 8 * row);
			
			-- Conversion de la sortie Clé de ronde du KeyExpansion_Table en TYPE_STATE
            expansion_keyState_o_s(row)(col) <= expansion_key128_o_s(127 - 32 * col - 8 * row downto 120 - 32 * col - 8 * row);
        end generate;
    end generate;



    -- BLOC FSM
    FSM1 : FSM
    port map (
		    clock_i => clockAES_i,			-- Horloge
		    resetb_i => resetAES_i,			-- Reset
		    start_i => startAES_i,			-- Start de l'InvAES
		    round_i => round_i_s,

		    done_o => aes_done_o_s,
		    enableCounter_o => enableCounter_o_s,
		    enableInvMixColumns_o => enableInvMixColumns_o_s,
		    enableOutput_o => enableOutput_o_s,
		    enableRoundcomputing_o => enableRoundcomputing_o_s,
		    getciphertext_o => getciphertext_o_s,
		    resetCounter_o => resetCounter_o_s
        );
     Counter0 : Counter
     port map (
		reset_i => resetCounter_o_s,
		enable_i => enableCounter_o_s,
		clock_i => clockAES_i,
		count_o  => round_i_s    -- Compteur de ronde
	);
     KeyExpansion_table0: KeyExpansion_table
     port map (
		round_i => round_i_s,
		expansion_key_o => expansion_key128_o_s   -- Clé de ronde en BIT128
		
	);
      
     
     InvAESRound0 : InvAESRound
     port map(
		InvAES_state_i => InvAES_state_i_s,
		InvAES_round_key_i => expansion_keyState_o_s,   -- Clé de ronde en TYPE_state
		enable_Round_i => enableRoundcomputing_o_s,
		enable_InvMixColumns_i => enableInvMixColumns_o_s,
		clock_i => clockAES_i,
		reset_i => resetAES_i,

		InvAES_state_o => InvAES_state_o_s  -- A convertir en bit128 pour la sortie
	);

    InvAES_state_i_s <= InvAES_state_o_s when getciphertext_o_s = '1' else
	dataAES_state_i when getciphertext_o_s = '0';


	-- Conversion de la sortie du InvAESRound de TYPE_STATE en BIT128 pour la sortie
    G3 : for col in 0 to 3 generate
        G4 : for row in 0 to 3 generate
            data_o_s(127 - 32 * col - 8 * row downto 120 - 32 * col - 8 * row) <= InvAES_state_o_s(row)(col);
        end generate;
    end generate;

    data_o <= data_o_s when enableOutput_o_s = '1';  -- Sortie du bloc InvAES activée
    aes_done_o <= aes_done_o_s;		-- Fin du déchiffrement

end InvAES_arch;
