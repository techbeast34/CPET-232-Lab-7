--Satyendra Emani
--Lab 7: Full Calculator Lab
--Section 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Lab7 IS
	PORT(
	inputA,inputB		:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	inputOP				:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	outHEX3, outHEX2, outHEX1, outHEX0	:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Lab7;

ARCHITECTURE model OF Lab7 IS
	COMPONENT calculator 
		PORT(a,b 		:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 op			:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			 r			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT ssd_driver
		PORT(In_num 					:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			 HEX3, HEX2, HEX1, HEX0	    :OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL r_signal :STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	BEGIN
	
	U1: calculator PORT MAP(inputA, inputB, inputOP, r_signal);
	U2: ssd_driver PORT MAP(r_signal, outHEX3, outHEX2, outHEX1, outHEX0);
	
	
END model;




