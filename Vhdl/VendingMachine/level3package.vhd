LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;






LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

package andtest_fuse_packageA is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_map1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		-- s2s4
    := ("1000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_map2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s3
    := ("0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_map3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
	--s1
    := ("0000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_map4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s2's4'
    := ("0100"&"0000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_map5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_map6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_map7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_map8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;



package andtest_fuse_packageB is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_mapB1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		-- s1
    := ("0000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapB2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s2'
    := ("0000"&"0000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapB3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
	--s3's4'
    := ("0100"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapB4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s3s4
    := ("1000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapB5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapB6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_mapB7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapB8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


package andtest_fuse_packageC is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_mapC1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		-- s1
    := ("0000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapC2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s2
    := ("0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapC3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
	--s3'
    := ("0000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapC4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s4
    := ("1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapC5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
	--
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapC6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_mapC7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapC8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


package andtest_fuse_packageD is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_mapD1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		--s1
    := ("0000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapD2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s3s4'
    := ("0100"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapD3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
		--s2's3
    := ("0000"&"1000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapD4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s4's2'
    := ("0100"&"0000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapD5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
	--s2s3's4
    := ("1000"&"0100"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapD6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_mapD7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapD8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


package andtest_fuse_packageE is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_mapE1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		--s1s2
    := ("0000"&"0000"&"1000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapE2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s3s4'
		
    := ("0100"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapE3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
		--s1s3
    := ("0000"&"1000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapE4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s1s4'
    := ("0100"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapE5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
	--s2's4'
    := ("0100"&"0000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapE6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_mapE7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapE8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


package andtest_fuse_packageF is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_mapF1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		--s1
    := ("0000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapF2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s3's4'
		
    := ("0100"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapF3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
		--s2s3'
    := ("0000"&"0100"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapF4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s2s4'
    := ("0100"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapF5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapF6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_mapF7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapF8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

package andtest_fuse_packageG is
  -- mc = macrocell, en = enable
  -------------------
  -- Selects fuses controlling each and gate
  -- '1' indicates that the fuse should be left - keeping the connection
  -- '0' indicates that the fuse should be broken - removing the connection
  -- The connection is done via the fuse map.
  -- In the example below a "10" (one, zero) indicates the input is part of the output equation while "01"
  --   indicates the complement is in the equation. 
  constant andtest_fuse_mapG1  : STD_LOGIC_VECTOR (43 downto 0)
      -- true when all inputs are one. No feedback used. f = 3
      -- x(1)       * x(2)     * x(3)     * x(4)     * x(5)    * x(6)     * x(7)     * x(8)     * x(9)    * x(10)  *x(11)*x(12)
		--s1
    := ("0000"&"0000"&"0000"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapG2  : STD_LOGIC_VECTOR (43 downto 0)
      -- only some inputs are used. f = 4
      --                  x(2)'    * x(3)*                                  x(6)
		--s3s4'
    := ("0100"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapG3  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 12
		--s2s3'
    := ("0000"&"0100"&"1000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
  constant andtest_fuse_mapG4  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 19
	--s2's3
    := ("0000"&"1000"&"0100"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapG5  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 25 
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapG6  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0 29
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
	 
	 
 constant andtest_fuse_mapG7  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");
 constant andtest_fuse_mapG8  : STD_LOGIC_VECTOR (43 downto 0)
	-- fuse map used when AND gate is unused, f = 0
    := ("0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000"&"0000");


end package;