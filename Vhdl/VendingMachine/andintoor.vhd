----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:09 03/19/2013 
-- Design Name: 
-- Module Name:    andintoor - Behavioral 
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

entity andintoor is
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

end andintoor;

architecture Behavioral of andintoor is

  signal test_out  	: std_logic_vector (7 downto 0);
	COMPONENT and44gate
	generic (fuse_map: STD_LOGIC_VECTOR(43 downto 0));
	Port(and_in: in STD_LOGIC_VECTOR(43 downto 0);
		  and_out: out STD_LOGIC);
   END COMPONENT;	  
begin

	and_1    : entity work.and44gate 
	generic map (fuse_map => fuse_map1)
	port map (and_in => and_in, and_out => test_out(0));
	  and_2    : entity work.and44gate 
	generic map (fuse_map => fuse_map2)
	port map (and_in => and_in, and_out => test_out(1));
	  and_3    : entity work.and44gate 
	generic map (fuse_map => fuse_map3)
	port map (and_in => and_in, and_out => test_out(2));
	  and_4    : entity work.and44gate 
	generic map (fuse_map => fuse_map4)
	port map (and_in => and_in, and_out => test_out(3));
	  and_5    : entity work.and44gate 
	generic map (fuse_map => fuse_map5)
	port map (and_in => and_in, and_out => test_out(4));
	  and_6    : entity work.and44gate 
	generic map (fuse_map => fuse_map6)
	port map (and_in => and_in, and_out => test_out(5));
	  and_7    : entity work.and44gate 
	generic map (fuse_map => fuse_map7)
	port map (and_in => and_in, and_out => test_out(6));
	  and_8    : entity work.and44gate 
	generic map (fuse_map => fuse_map8)
	port map (and_in => and_in, and_out => test_out(7));

	or_out<=test_out(0) or test_out(1) or test_out(2) or test_out(3) or test_out(4) or test_out(5) or test_out(6) or test_out(7);


end Behavioral;

