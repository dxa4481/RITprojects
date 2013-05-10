


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.andtest_fuse_package.all;

entity and44gate_tb is
end and44gate_tb;

architecture Structural of and44gate_tb is
  signal x         	: std_logic_vector (12 downto 1);
  signal and_array  	: std_logic_vector (43 downto 0);
  signal f_i       	: std_logic_vector (10 downto 1);
  signal test_out   	: std_logic_vector (3 downto 1);  
begin
  -- outputs needed for and_array
  f_i <= (others => '0'); 

  andtest_1    : entity work.and44gate 
	generic map (fuse_map => andtest_fuse_map1)
	port map (and_in => And_array, and_out => test_out(1));

  andtest_2    : entity work.and44gate 
	generic map (fuse_map => andtest_fuse_map2)
	port map (and_in => And_array, and_out => test_out(2));

  andtest_3    : entity work.and44gate 
	generic map (fuse_map => andtest_fuse_map3)
	port map (and_in => And_array, and_out => test_out(3));
		
	-- Input pins 1 - 11 are connected to the AND array (left side of chip, page 6, 22v10.pdf)
	-- feedback from macrocell outputs (OLMC) and input pin 13 are not used (right side of chip)
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

   -- generate all possible values of x
	tb : process
	begin
	  for i in 0 to (2**12)-1 loop
		 X <= conv_std_logic_vector(i,12);
		 Wait for 100 ns;
	  end loop;
	end process;

end Structural;
 
