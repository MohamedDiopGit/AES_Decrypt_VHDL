library IEEE;
use IEEE.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;
library LIB_RTL;

entity InvAESRound is
	port(
		InvAES_state_i : in type_state;
		InvAES_state_o : out type_state;
		InvAES_round_key_i : in type_state;
		enable_Round_i : in std_logic;
		enable_InvMixColumns_i : in std_logic;
		clock_i : in std_logic;
		reset_i : in std_logic
	);
end entity;

architecture InvAESRound_arch of InvAESRound is
	component InvShiftRows
		port (
			state_i  : in type_state;
			state_o : out type_state
		);
	end component;

	component InvSubBytes
		port (
			state_i  : in type_state;
			state_o : out type_state 
        );
	end component;
	component AddRoundKey
		port (
			state_i : in type_state;
			round_key_i : in type_state;
			state_o : out type_state  -- matrice avec ligne
		);
	end component;
	component InvMixColumns
        port(
            state_i: in type_state;
            state_o: out type_state
        );
	end component;
    
    signal ISR_o_s : type_state; -- Sortie InvShiftRows = Entrée du InvSubBytes
    signal ISB_o_s : type_state; -- Sortie du InvSubBytes
    signal ARK_i_s : type_state; -- Entrée du AddRoundKey = Sortie du InvSubBytes ou Entrée du InvAESRound
    signal ARK_o_s : type_state; -- Sortie du AddRoundKey = Entrée du InvMixColumns
    signal IMC_o_s : type_state; -- Sortie InvMixColumns
    signal state_s : type_state;

begin
     
    
    -- BLOC INVSHIFTROWS
    InvShiftRows1 : InvShiftRows
    port map (
        state_i => InvAES_state_i ,
        state_o => ISR_o_s
        );


    -- BLOC INVSUB BYTES 
    InvSubBytes1 : InvSubBytes
    port map (
        state_i => ISR_o_s,
        state_o => ISB_o_s
        );

    -- GESTION DE L'ENTREE DE ADD ROUND KEY
	
    ARK_i_s <= ISB_o_s when enable_Round_i = '1' else
	InvAES_state_i when enable_Round_i = '0';

    -- BLOC ADD ROUND KEY
    AddRoundKey1 : AddRoundKey
    port map (
        state_i => ARK_i_s,
        round_key_i => InvAES_round_key_i,
        state_o => ARK_o_s
    );


    -- BLOC INV MIX COLUMNS
    InvMixColumns1 : InvMixColumns
        port map (
            state_i => ARK_o_s,
            state_o => IMC_o_s
        );


    -- GESTION DE LA SORTIE

    InvAES_state_o <= ARK_o_s when enable_Round_i='0' and enable_InvMixColumns_i = '0' else
	IMC_o_s when enable_Round_i='1' and enable_InvMixColumns_i = '1' else
	ARK_o_s when enable_Round_i='1' and enable_InvMixColumns_i = '0';
    
    seq_0 : process (clock_i, reset_i) is
        begin -- process seq_0
            if reset_i = '0' then -- asynchronous reset (active-low)
                state_s <= ((others => (others => (others => '0'))));
            -- or use 2 x for ... generate
            elsif clock_i'event and clock_i = '1' then -- rising clock
                if (enable_Round_i = '0' and enable_InvMixColumns_i = '0') then   -- Premier round
                    state_s <= ARK_o_s;
                elsif (enable_InvMixColumns_i = '1' and enable_Round_i = '1') then
                    state_s <= IMC_o_s;
                elsif(enable_InvMixColumns_i = '0' and enable_Round_i = '1') then
                    state_s <= ARK_o_s;
                end if; 
            end if;
    end process seq_0;
    

    
end InvAESRound_arch;
