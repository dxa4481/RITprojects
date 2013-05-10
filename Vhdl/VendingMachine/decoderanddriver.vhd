----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:29 04/02/2013 
-- Design Name: 
-- Module Name:    decoderanddriver - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoderanddriver is
	Port(switch_input1,switch_input2,switch_input3: in STD_LOGIC_VECTOR(4 downto 1);
			clock : in STD_LOGIC:='0';
		  Cathodes: out STD_LOGIC_VECTOR(7 downto 1);
		  Anodes: out STD_LOGIC_VECTOR(3 downto 0));
end decoderanddriver;

architecture Behavioral of decoderanddriver is
	signal sevenseg1,sevenseg2,sevenseg3 :std_logic_vector(7 downto 1);
	signal reset,clocks : std_logic:='0';
	signal zeroes1,zeroes2,zeroes3 : std_logic_vector(12 downto 1);
	
	    COMPONENT decoder3blocks
	Port(x1,x2,x3: in STD_LOGIC_VECTOR(12 downto 1);
		  d1,d2,d3: out STD_LOGIC_VECTOR(7 downto 1));
    END COMPONENT;
	
	    COMPONENT seven_seg_disp 
    Port ( hund_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
	        tens_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
           ones_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
	        clk          : in  STD_LOGIC; -- digilent board generated clock
			  reset_n      : in  STD_LOGIC; -- switch input
			  unused_anode : out STD_LOGIC; -- unused an3
			  hund_anode   : out STD_LOGIC; -- digilent an2
	        tens_anode   : out STD_LOGIC; -- digilent an3
	        ones_anode   : out STD_LOGIC; -- digilent an4
			  CAn,CBn,CCn,CDn,CEn,CFn,CGn : out STD_LOGIC);
    END COMPONENT;	
	

begin
	reset <= '0' when ( switch_input1 = "1010" and switch_input2 = "1111" and switch_input3 = "1110" ) else '1';
	
  zeroes1<="00000000" & switch_input1;
  zeroes2<="00000000" & switch_input2;
  zeroes3<="00000000" & switch_input3;
   uut: entity work.decoder3blocks 
			Port map(x1=>zeroes1,
						x2=>zeroes2,
						x3=>zeroes3,
						d1=>sevenseg1,
						d2=>sevenseg2,
						d3=>sevenseg3);
						
   uut2: entity work.seven_seg_disp 
    Port map(hund_disp_n  => not(sevenseg1),
	        tens_disp_n  => not(sevenseg2),
           ones_disp_n  => not(sevenseg3),
	        clk          =>clock,
			  reset_n      =>reset, -- switch input
			  unused_anode =>Anodes(0), -- unused an3
			  hund_anode   =>Anodes(1),
	        tens_anode   =>Anodes(2),
	        ones_anode   =>Anodes(3),
			  CAn          =>Cathodes(7),
			  CBn          =>Cathodes(6),
			  CCn				=>Cathodes(5),
			  CDn				=>Cathodes(4),
			  CEn				=>Cathodes(3),
			  CFn				=>Cathodes(2),
			  CGn				=>Cathodes(1));


end Behavioral;

