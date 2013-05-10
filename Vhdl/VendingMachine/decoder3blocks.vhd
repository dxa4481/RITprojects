----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:15 04/02/2013 
-- Design Name: 
-- Module Name:    decoder3blocks - Behavioral 
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

entity decoder3blocks is
	
	Port(x1,x2,x3: in STD_LOGIC_VECTOR(12 downto 1);
		  d1,d2,d3: out STD_LOGIC_VECTOR(7 downto 1));
end decoder3blocks;

architecture Behavioral of decoder3blocks is
	    COMPONENT decoderblocks 
	Port(x: in STD_LOGIC_VECTOR(12 downto 1);
		  d1: out STD_LOGIC_VECTOR(7 downto 1));


    END COMPONENT;
	
begin
   uut: entity work.decoderblocks 
							PORT MAP(x=>x1,
										d1=>d1);
   uut1: entity work.decoderblocks 
							PORT MAP(x=>x2,
										d1=>d2);
   uut2: entity work.decoderblocks 
							PORT MAP(x=>x3,
										d1=>d3);										
end Behavioral;

