----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:26 03/26/2013 
-- Design Name: 
-- Module Name:    macrocell - Behavioral 
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

entity macrocell5 is

	generic( fuse_map1: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map2: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map3: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map4: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map5: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map6: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map7: STD_LOGIC_VECTOR(43 downto 0);
				fuse_map8: STD_LOGIC_VECTOR(43 downto 0));	
	Port(x: in STD_LOGIC_VECTOR(12 downto 1);
		  or_out: out STD_LOGIC);

end macrocell5;

architecture Behavioral of macrocell5 is
	COMPONENT andintoor
	generic(fuse_map1: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map2: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map3: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map4: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map5: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map6: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map7: STD_LOGIC_VECTOR(43 downto 0);
	fuse_map8: STD_LOGIC_VECTOR(43 downto 0));	
	Port(and_in: in STD_LOGIC_VECTOR(43 downto 0);
		  or_out: out STD_LOGIC);
   END COMPONENT;	
	signal f_i :std_logic_vector(10 downto 1);
	signal and_array : std_logic_vector(43 downto 0);
begin
	f_i(10 downto 1)<= ('0','0','0','0','0','0','0','0','0','0');
	and_array(43 downto 40) <= (X(1), NOT X(1), f_i(1), NOT f_i(1));
	and_array(39 downto 36) <= (X(2), NOT X(2), f_i(2), NOT f_i(2));
	and_array(35 downto 32) <= (X(3), NOT X(3), f_i(3), NOT f_i(3));
	and_array(31 downto 28) <= (X(4), NOT X(4), f_i(4), NOT f_i(4));
	and_array(27 downto 24) <= (X(5), NOT X(5), f_i(5), NOT f_i(5));
	and_array(23 downto 20) <= (X(6), NOT X(6), f_i(6), NOT f_i(6));
	and_array(19 downto 16) <= (X(7), NOT X(7), f_i(7), NOT f_i(7));
	and_array(15 downto 12) <= (X(8), NOT X(8), f_i(8), NOT f_i(8));
	and_array(11 downto 8)  <= (X(9), NOT X(9), f_i(9), NOT f_i(9));
	and_array(7 downto 4)   <= (X(10), NOT X(10), f_i(10), NOT f_i(10));
	and_array(3 downto 0)   <= (X(11), NOT X(11), X(12), NOT X(12));

	
andintoor1    : entity work.andintoor
	generic map(fuse_map1=> fuse_map1,
					fuse_map2=> fuse_map2,
					fuse_map3=> fuse_map3,
					fuse_map4=> fuse_map4,
					fuse_map5=> fuse_map5,
					fuse_map6=> fuse_map6,
					fuse_map7=> fuse_map7,
					fuse_map8=> fuse_map8)
	port map(and_in=>and_array,
				or_out=> or_out);



end Behavioral;

