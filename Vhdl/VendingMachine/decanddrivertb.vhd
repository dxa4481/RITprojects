--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:52 04/02/2013
-- Design Name:   
-- Module Name:   C:/Users/dxa4481/lab2/decanddrivertb.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoderanddriver
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decanddrivertb IS
END decanddrivertb;
 
ARCHITECTURE behavior OF decanddrivertb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoderanddriver
    PORT(
         switch_input1 : IN  std_logic_vector(4 downto 1);
         switch_input2 : IN  std_logic_vector(4 downto 1);
         switch_input3 : IN  std_logic_vector(4 downto 1);
         clock : IN  std_logic;
         Cathodes : OUT  std_logic_vector(7 downto 1);
         Anodes : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal switch_input1 : std_logic_vector(4 downto 1) := (others => '0');
   signal switch_input2 : std_logic_vector(4 downto 1) := (others => '0');
   signal switch_input3 : std_logic_vector(4 downto 1) := (others => '0');
   signal clock : std_logic := '0';

 	--Outputs
   signal Cathodes : std_logic_vector(7 downto 1);
   signal Anodes : std_logic_vector(3 downto 0);


 
BEGIN




	clock<=not clock after 20 ns;
	
	-- Instantiate the Unit Under Test (UUT)
   uut: decoderanddriver PORT MAP (
          switch_input1 => switch_input1,
          switch_input2 => switch_input2,
          switch_input3 => switch_input3,
          clock => clock,
          Cathodes => Cathodes,
          Anodes => Anodes
        );

   -- Clock process definitions


   -- Stimulus process
	process
	begin
		--reset
		switch_input1 <= "1010";
		switch_input2 <= "1111";
		switch_input3 <= "1110";
		wait for 100 ns;

		switch_input1 <= "0000";
		switch_input2 <= "0000";
		switch_input3 <= "0000";
		
		for i in 0 to 9 loop
		
			switch_input1 <= switch_input1 + 1;
			switch_input2 <= switch_input2 + 1;
			switch_input3 <= switch_input3 + 1;

			wait for 100 ns;
		end loop;
		wait;
	end process;


END;
