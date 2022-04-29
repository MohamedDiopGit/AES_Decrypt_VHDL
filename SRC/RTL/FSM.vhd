library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity FSM is
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
end FSM;

architecture FSM_arch_Moore of FSM is
    type state is (idle, Round10, Round9a1,Round0);
    signal etat_present , etat_futur : state;
    
    begin -- moore_arch
    seq_0 : process (clock_i , resetb_i )
    begin -- process seq_0
        if resetb_i = '1' then
            etat_present <= idle;
        elsif clock_i'event and clock_i = '1' then
            etat_present <= etat_futur;
        end if;
    end process seq_0 ;
    
    comb0 : process (etat_present, start_i,round_i)         -- Gère l'actualisation des états
    begin -- process comb0
        case etat_present is
            when idle =>
                if start_i = '1' then
                    etat_futur <= Round10 ;
                end if;
            when Round10  =>
                if round_i = "1001" then    -- Round inférieur ou égal à 9
                    etat_futur <= Round9a1;
                end if;
            when Round9a1 =>
                if round_i = "0000" then     -- Round égal à 0
                    etat_futur <= Round0 ;
                end if;
            when Round0 =>
                --etat_futur <= idle;   -- Retour à IDLE / retour à round 10 si bloc suivant
        end case ;
    end process comb0 ;

    comb1 : process ( etat_present )
        begin -- process comb1
            case etat_present is
                when idle =>			-- Début du Decryptage
                    done_o <= '1';
                    getciphertext_o <= '0';
                    enableCounter_o <= '0';
                    enableOutput_o <= '1';
                    resetCounter_o <= '1';	-- Reset du compteur de round à 10
                    
                    enableInvMixColumns_o <= '0';
                    enableRoundcomputing_o <= '0';
	
                when Round10 =>			-- Cas du Round 10 : seulement AddRoundKey
                    done_o <= '0';
                    getciphertext_o <= '0';	-- On utilise le cipher text initial
                    enableCounter_o <= '1';	-- Lancement du compteur
                    enableOutput_o <= '0';
                    resetCounter_o <= '0';      -- On laisse le compteur se décrémenté
                    
                    enableInvMixColumns_o <= '0';
                    enableRoundcomputing_o <= '0';

                when Round9a1 =>		-- Round intermédiaire : Tout les blocs sont utilisés
                    done_o <= '0';
                    getciphertext_o <= '1';	-- On réutilise le cipher text précédent decodé
                    enableCounter_o <= '1';
                    enableOutput_o <= '0';
                    resetCounter_o <= '0';
                    
                    enableInvMixColumns_o <= '1';
                    enableRoundcomputing_o <= '1';

                when Round0 =>
                    done_o <= '0';
                    getciphertext_o <= '1';	-- On réutilise le cipher text précédent decodé
                    enableCounter_o <= '0';  -- Désactivation du compteur
                    enableOutput_o <= '0';
                    resetCounter_o <= '0';
                    
                    enableInvMixColumns_o <= '0';   -- Round 0 : Pas de InvMixColumns
                    enableRoundcomputing_o <= '1';
        end case ;
    end process comb1 ;
end architecture FSM_arch_Moore;


