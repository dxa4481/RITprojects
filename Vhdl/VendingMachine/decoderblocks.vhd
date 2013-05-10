----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:18 04/02/2013 
-- Design Name: 
-- Module Name:    decoderblocks - Behavioral 
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
use work.andtest_fuse_packageA.all;
use work.andtest_fuse_packageB.all;
use work.andtest_fuse_packageC.all;
use work.andtest_fuse_packageD.all;
use work.andtest_fuse_packageE.all;
use work.andtest_fuse_packageF.all;
use work.andtest_fuse_packageG.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoderblocks is


	Port(x: in STD_LOGIC_VECTOR(12 downto 1);
		  d1: out STD_LOGIC_VECTOR(7 downto 1));


end decoderblocks;

architecture Behavioral of decoderblocks is
   --Inputs

 	--Outputs
   signal or_outA,or_outB,or_outC,or_outD,or_outE,or_outF,or_outG  : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
	COMPONENT macrocell
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
   END COMPONENT;	
	COMPONENT macrocell2
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
   END COMPONENT;	
	COMPONENT macrocell3
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
   END COMPONENT;	
	COMPONENT macrocell4
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
   END COMPONENT;	
	COMPONENT macrocell5
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
   END COMPONENT;	
	COMPONENT macrocell6
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
   END COMPONENT;	
	COMPONENT macrocell7
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
   END COMPONENT;	
	
	
begin
   uut: entity work.macrocell generic map(fuse_map1=> andtest_fuse_map1,
							fuse_map2=> andtest_fuse_map2,
							fuse_map3=> andtest_fuse_map3,
							fuse_map4=> andtest_fuse_map4,
							fuse_map5=> andtest_fuse_map5,
							fuse_map6=> andtest_fuse_map6,
							fuse_map7=> andtest_fuse_map7,
							fuse_map8=> andtest_fuse_map8)
						PORT MAP (
							 x => x,
							 or_out => or_outA);
   uut2: entity work.macrocell2 generic map(fuse_map1=> andtest_fuse_mapB1,
							fuse_map2=> andtest_fuse_mapB2,
							fuse_map3=> andtest_fuse_mapB3,
							fuse_map4=> andtest_fuse_mapB4,
							fuse_map5=> andtest_fuse_mapB5,
							fuse_map6=> andtest_fuse_mapB6,
							fuse_map7=> andtest_fuse_mapB7,
							fuse_map8=> andtest_fuse_mapB8)
						PORT MAP (
							 x => x,
							 or_out => or_outB);
							 
   uut3: entity work.macrocell3 generic map(fuse_map1=> andtest_fuse_mapC1,
							fuse_map2=> andtest_fuse_mapC2,
							fuse_map3=> andtest_fuse_mapC3,
							fuse_map4=> andtest_fuse_mapC4,
							fuse_map5=> andtest_fuse_mapC5,
							fuse_map6=> andtest_fuse_mapC6,
							fuse_map7=> andtest_fuse_mapC7,
							fuse_map8=> andtest_fuse_mapC8)
						PORT MAP (
							 x => x,
							 or_out => or_outC);
							 
							 
   uut4: entity work.macrocell4 generic map(fuse_map1=> andtest_fuse_mapD1,
							fuse_map2=> andtest_fuse_mapD2,
							fuse_map3=> andtest_fuse_mapD3,
							fuse_map4=> andtest_fuse_mapD4,
							fuse_map5=> andtest_fuse_mapD5,
							fuse_map6=> andtest_fuse_mapD6,
							fuse_map7=> andtest_fuse_mapD7,
							fuse_map8=> andtest_fuse_mapD8)
						PORT MAP (
							 x => x,
							 or_out => or_outD);
							 
   uut5: entity work.macrocell5 generic map(fuse_map1=> andtest_fuse_mapE1,
							fuse_map2=> andtest_fuse_mapE2,
							fuse_map3=> andtest_fuse_mapE3,
							fuse_map4=> andtest_fuse_mapE4,
							fuse_map5=> andtest_fuse_mapE5,
							fuse_map6=> andtest_fuse_mapE6,
							fuse_map7=> andtest_fuse_mapE7,
							fuse_map8=> andtest_fuse_mapE8)
						PORT MAP (
							 x => x,
							 or_out => or_outE);


   uut6: entity work.macrocell6 generic map(fuse_map1=> andtest_fuse_mapF1,
							fuse_map2=> andtest_fuse_mapF2,
							fuse_map3=> andtest_fuse_mapF3,
							fuse_map4=> andtest_fuse_mapF4,
							fuse_map5=> andtest_fuse_mapF5,
							fuse_map6=> andtest_fuse_mapF6,
							fuse_map7=> andtest_fuse_mapF7,
							fuse_map8=> andtest_fuse_mapF8)
						PORT MAP (
							 x => x,
							 or_out => or_outF);

   uut7: entity work.macrocell7 generic map(fuse_map1=> andtest_fuse_mapG1,
							fuse_map2=> andtest_fuse_mapG2,
							fuse_map3=> andtest_fuse_mapG3,
							fuse_map4=> andtest_fuse_mapG4,
							fuse_map5=> andtest_fuse_mapG5,
							fuse_map6=> andtest_fuse_mapG6,
							fuse_map7=> andtest_fuse_mapG7,
							fuse_map8=> andtest_fuse_mapG8)
						PORT MAP (
							 x => x,
							 or_out => or_outG);			
	d1<= or_outA&or_outB&or_outC&or_outD&or_outE&or_outF&or_outG;
end Behavioral;

