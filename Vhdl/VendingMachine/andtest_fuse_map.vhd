LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

package andtest_fuse_package is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_map1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
    := ("1000"&"1000"&"1000"&"1000"&"1000"&"1000"&"1000"&"1000"&"1000"&"1000"&"1010");
  constant andtest_fuse_map2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f =
      --                  x(2)'    * x(3)*                                  x(6)
    := ("0000"&"0100"&"1000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_map3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("1111"&"1111"&"1111"&"1111"&"1111"&"1111"&"1111"&"1111"&"1111"&"1111"&"1111");

end package;
