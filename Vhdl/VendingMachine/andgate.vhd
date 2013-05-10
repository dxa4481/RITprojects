----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:15 03/19/2013 
-- Design Name: 
-- Module Name:    andgate - Behavioral 
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

entity and44gate is
	generic (fuse_map: STD_LOGIC_VECTOR(43 downto 0));
	Port(and_in: in STD_LOGIC_VECTOR(43 downto 0);
		  and_out: out STD_LOGIC);
end and44gate;

architecture Behavioral of and44gate is

begin
	process(and_in)
	variable i: STD_LOGIC :='1';
	variable j: integer :=0;
	begin
		i:='1';
		j:=0;
		for count_value in 0 to 43 loop
			if (fuse_map(count_value)='1') then
			i := i and and_in(count_value);
			end if;
			if (fuse_map(count_value)='0') then
			j := j+1;
			end if;
		end loop;
		and_out<=i;
		if (j=44) then
		and_out<='0';
		end if;
	end process;

end Behavioral;

