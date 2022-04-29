library ieee;
use ieee.std_logic_1164.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;


entity InvMixColumnsX is 
	port(
		data_i: in column_state;
        	data_o: out column_state
	);

end InvMixColumnsX;

architecture InvMixColumnsX_arch of InvMixColumnsX is 
    signal data2_s: column_state;
    signal data4_s: column_state;
    signal data8_s: column_state;
    
    signal dataB_s: column_state;
    signal dataD_s: column_state;
    signal dataE_s: column_state;  
    signal data9_s: column_state;
begin
    
    Label_Data_s: for i in 0 to 3 generate
	data2_s(i) <= (data_i(i)(6 downto 0) & '0') xor x"1b"  when data_i(i)(7)='1' else
        	      data_i(i)(6 downto 0) & '0';
        data4_s(i) <= (data2_s(i)(6 downto 0) & '0') xor x"1b" when data2_s(i)(7)='1' else
        	      data2_s(i)(6 downto 0) & '0';
	data8_s(i) <= (data4_s(i)(6 downto 0) & '0') xor x"1b" when data4_s(i)(7)='1' else
        	      data4_s(i)(6 downto 0) & '0';

        dataE_s(i) <= data8_s(i) xor data4_s(i) xor data2_s(i);
	dataB_s(i) <= data8_s(i) xor data2_s(i) xor data_i(i);
	dataD_s(i) <= data8_s(i) xor data4_s(i) xor data_i(i);
	data9_s(i) <= data8_s(i) xor data_i(i);
    end generate Label_Data_s;

    -- S'0c
    data_o(0) <= dataE_s(0) xor dataB_s(1) xor dataD_s(2) xor data9_s(3);
    -- S'1c
    data_o(1) <= data9_s(0) xor dataE_s(1) xor dataB_s(2) xor dataD_s(3);
    -- S'2c
    data_o(2) <= dataD_s(0) xor data9_s(1) xor dataE_s(2) xor dataB_s(3);
    -- S'3c
    data_o(3) <= dataB_s(0) xor dataD_s(1) xor data9_s(2) xor dataE_s(3);

end InvMixColumnsX_arch;
