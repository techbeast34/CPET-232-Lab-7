--Satyendra Emani
--Lab 7: Full Function Calculator
--Component: calculator
--Section 01

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY calculator IS
	PORT(a,b 		:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     op			:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	     r			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END calculator;

ARCHITECTURE model OF calculator IS
	SIGNAL a_signed, b_signed 	: SIGNED (3 DOWNTO 0);
	SIGNAL r_signed				: SIGNED (7 DOWNTO 0) := "00000000";
	
BEGIN
	
	calculator_case: PROCESS(a,b,op,a_signed,b_signed)
		BEGIN
			CASE op	IS
				
				--Addition
				WHEN "00" => 
				a_signed <= SIGNED(a);
				b_signed <= SIGNED(b);
				
				r_signed <= (resize(a_signed,r_signed'LENGTH) + resize(b_signed,r_signed'LENGTH));
				
				--Subtraction						  
				WHEN "01" => 
				a_signed <= SIGNED(a);
				b_signed <= SIGNED(b);
				
				r_signed <= (resize(a_signed,r_signed'LENGTH) - resize(b_signed,r_signed'LENGTH));
				
				
				--Multiplication						  
				WHEN "10" => 
				a_signed <= SIGNED(a);
				b_signed <= SIGNED(b);

				r_signed <= resize((a_signed * b_signed),r_signed'LENGTH);
				
				
				--Division
				WHEN "11" => 
				a_signed <= SIGNED(a);
				b_signed <= SIGNED(b);
				
				r_signed <= (resize(a_signed,r_signed'LENGTH) / resize(b_signed,r_signed'LENGTH));
				
				WHEN OTHERS => r_signed <= ("00000000");
				
			END CASE;
			
		END PROCESS;
		r <= STD_LOGIC_VECTOR(r_signed);
END model;
