--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:33 04/16/2013
-- Design Name:   
-- Module Name:   C:/Users/dxa4481/lab3/tbbintobcd.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bintobcd
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbbintobcd IS
END tbbintobcd;
 
ARCHITECTURE behavior OF tbbintobcd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bintobcd
    PORT(
         bin : IN  std_logic_vector(9 downto 0);
         hund : OUT  std_logic_vector(3 downto 0);
         tens : OUT  std_logic_vector(3 downto 0);
         ones : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal bin : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal hund : std_logic_vector(3 downto 0);
   signal tens : std_logic_vector(3 downto 0);
   signal ones : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 	signal bla : STD_logic_vector(9 downto 0):="0000000000";

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bintobcd PORT MAP (
          bin => bin,
          hund => hund,
          tens => tens,
          ones => ones
        );

	bin<=bla;
	bla<=std_logic_vector(UNSIGNED(bla)+1) after 10 ns;


END;
