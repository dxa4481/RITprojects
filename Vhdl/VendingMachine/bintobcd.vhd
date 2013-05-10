----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:03 04/09/2013 
-- Design Name: 
-- Module Name:    bintobcd - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bintobcd is
		    Port ( 
	     bin  : in   STD_LOGIC_VECTOR(9 downto 0);
	     hund       : out  STD_LOGIC_VECTOR(3 downto 0);
           tens      : out  STD_LOGIC_VECTOR(3 downto 0);
           ones       : out  STD_LOGIC_VECTOR(3 downto 0));
end bintobcd;

architecture Behavioral of bintobcd is

begin


	process(bin)
		variable concat : STD_LOGIC_VECTOR(21 downto 0):="0000000000000000000000";
	begin
		concat:=x"000" & bin;
		for I in 0 to 9 loop
			if (concat (13 downto 10) >="0101") then
				concat:=concat+"00110000000000";
			end if;
			if (concat (17 downto 14) >="0101") then
				concat:=concat+"001100000000000000";
			end if;		
			if (concat (21 downto 18) >="0101") then
				concat:=concat+"0011000000000000000000";
			end if;
			concat:=concat(20 downto 0) & '0';
		end loop;
		hund<=concat (21 downto 18);
		tens<=concat (17 downto 14);
		ones<=concat (13 downto 10);
	
	end process;
		
		

end Behavioral;

