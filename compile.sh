clear
echo "--------------------------/* COMPILATION *\--------------------------"
echo "removing libs "

vdel -lib LIB/LIB_RTL -all
vdel -lib LIB/LIB_BENCH -all
vdel -lib LIB/LIB_AES -all
#clear
 
echo " "
echo "-------------------------/* CREATING LIBS *\-------------------------- "
echo " "

echo "recreating libs"
vlib LIB/LIB_RTL
vlib LIB/LIB_BENCH
vlib LIB/LIB_AES

vmap LIB_RTL LIB/LIB_RTL
vmap LIB_BENCH LIB/LIB_BENCH
vmap LIB_AES LIB/LIB_AES
#clear

echo " "
echo "----------------------/* COMPILE VHDL SOURCES *\---------------------- "
echo " "
echo "Loading Packages:     ---------------------- "
echo " "

vcom +acc -work LIB_AES SRC/PACKAGE/state_definition_package.vhd

echo " "
echo "SubBytes:      ---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/SubBytes.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/SubBytes_conf.vhd

echo " "
echo "InvSubBytes:      ---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvSubBytes.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvSubBytes_conf.vhd

echo " "
echo "InvShiftRows: 	---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvShiftRows.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvShiftRows_conf.vhd

echo " "
echo "AddRoundKey:	---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/AddRoundKey.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/AddRoundKey_conf.vhd

echo " "
echo "InvMixColumnsX: 	---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvMixColumnsX.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvMixColumnsX_conf.vhd

echo " "
echo "InvMixColumns: 	---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvMixColumns.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvMixColumns_conf.vhd

echo " "
echo "InvAESRound: 	---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvAESRound.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvAESRound_conf.vhd

echo " "
echo "Counter: 	---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/Counter.vhd
echo " "

echo " "
echo "KeyExpansion_table :    ---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/KeyExpansion_table.vhd

echo " "
echo "FSM :    ---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/FSM.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/FSM_conf.vhd

echo " "
echo "InvAES (Top Level) :    ---------------------- "
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvAES.vhd
echo " "
vcom +acc -work LIB_RTL SRC/RTL/InvAES_conf.vhd

#clear

echo " "
echo "------------------------/* COMPILE VHDL BENCH *\------------------------ "
echo " "


echo "InvSubBytes: 		---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvSubBytes_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvSubBytes_tb_conf.vhd

echo " "
echo "InvShiftRows: 	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvShiftRows_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvShiftRows_tb_conf.vhd

echo " "
echo "AddRoundKey:	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/AddRoundKey_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/AddRoundKey_tb_conf.vhd

echo " "
echo "InvMixColumnsX: 	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvMixColumnsX_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvMixColumnsX_tb_conf.vhd

echo " "
echo "InvMixColumns: 	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvMixColumns_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvMixColumns_tb_conf.vhd

echo " "
echo "InvAESRound: 	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvAESRound_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvAESRound_tb_conf.vhd

echo " "
echo "FSM: 	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/FSM_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/FSM_tb_conf.vhd

echo " "
echo "InvAES (Top Level): 	---------------------- "
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvAES_tb.vhd
echo " "
vcom +acc -work LIB_BENCH SRC/BENCH/InvAES_tb_conf.vhd
#clear

echo " "
echo "------------------------/* COMPILING FINISHED *\--------------------------- "
echo " "
