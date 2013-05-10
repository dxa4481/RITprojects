-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT Usr_interaction
				 Port 
				( Qrcd_in           : in  STD_LOGIC; -- Quarter received from switch
				  Drcd_in           : in  STD_LOGIC; -- Dime received from switch
				  Nrcd_in           : in  STD_LOGIC; -- Nickel received from switch
				  Clk_in            : in  STD_LOGIC; -- 25, 50 or 100MHz clock
				  Reset_n_in        : in  STD_LOGIC; -- active low reset from switch
				  Soda_req_in       : in  STD_LOGIC; -- request of soda from user
				  Soda_price_in     : in  STD_LOGIC_VECTOR(3 downto 0); -- soda price from LED, 4 bit code
				  Drop_soda_out     : out STD_LOGIC; -- soda release to LED
				  Qrcd_out          : out STD_LOGIC; -- quarter pulse to LED
				  Drcd_out          : out STD_LOGIC; -- dime pulse to LED
				  Nrcd_out          : out STD_LOGIC; -- nickel pulse to LED
				  Amt_err           : out STD_LOGIC; -- soda requested but not enough money deposited
				  unused_anode      : out STD_LOGIC; -- unused an3
				  hund_anode_out    : out STD_LOGIC; -- digilent an2
				  tens_anode_out    : out STD_LOGIC; -- digilent an3
				  ones_anode_out    : out STD_LOGIC; -- digilent an4
				  CAn_out           : out STD_LOGIC;
				  CBn_out           : out STD_LOGIC;
				  CCn_out           : out STD_LOGIC;
				  CDn_out           : out STD_LOGIC;
				  CEn_out           : out STD_LOGIC;
				  CFn_out           : out STD_LOGIC;
				  CGn_out           : out STD_LOGIC); -- digilent cathode - used for all displays
          END COMPONENT;

				 signal sQrcd_in           : STD_LOGIC:='0'; -- Quarter received from switch
				 signal sDrcd_in           : STD_LOGIC:='0'; -- Dime received from switch
				 signal sNrcd_in           : STD_LOGIC:='0'; -- Nickel received from switch
				 signal sClk_in            : STD_LOGIC:='0'; -- 25, 50 or 100MHz clock
				 signal sReset_n_in        : STD_LOGIC:='1'; -- active low reset from switch
				 signal sSoda_req_in       : STD_LOGIC:='0'; -- request of soda from user
				 signal sSoda_price_in     : STD_LOGIC_VECTOR(3 downto 0):="0000"; -- soda price from LED, 4 bit code
				 signal sDrop_soda_out     : STD_LOGIC; -- soda release to LED
				 signal sQrcd_out          : STD_LOGIC; -- quarter pulse to LED
				 signal sDrcd_out          : STD_LOGIC; -- dime pulse to LED
				 signal sNrcd_out          : STD_LOGIC; -- nickel pulse to LED
				 signal sAmt_err           : STD_LOGIC; -- soda requested but not enough money deposited
				 signal sunused_anode      : STD_LOGIC; -- unused an3
				 signal shund_anode_out    : STD_LOGIC; -- digilent an2
				 signal stens_anode_out    : STD_LOGIC; -- digilent an3
				 signal sones_anode_out    : STD_LOGIC; -- digilent an4
			 	 signal  sCAn_out          : STD_LOGIC;
			 	 signal  sCBn_out          : STD_LOGIC;
				 signal  sCCn_out          : STD_LOGIC;
				 signal  sCDn_out          : STD_LOGIC;
				 signal sCEn_out           : STD_LOGIC;
				 signal sCFn_out           : STD_LOGIC;
				 signal sCGn_out           : STD_LOGIC; -- digilent cathode - used for all displays     

  BEGIN
				sClk_in<=not sClk_in after 10 ns;

		process
			begin
			  sReset_n_in<='1';
				sSoda_price_in<="0000";
				sQrcd_in<='1';
				wait for 120 ns;
				sQrcd_in<='0';
				wait for 42 us;
				sDrcd_in<='1';
				wait for 120 ns;
				sDrcd_in<='0';				
				wait for 42 us;
				sNrcd_in<='1';
				wait for 120 ns;
				sNrcd_in<='0';	
				wait for 42 us;
				sQrcd_in<='1';
				wait for 120 ns;
				sQrcd_in<='0';
				wait for 42 us;				
				sSoda_req_in<='1';
				wait for 120 ns;				
				sSoda_req_in<='0';
				sSoda_price_in<="0001";
				sQrcd_in<='1';
				wait for 120 ns;
				sQrcd_in<='0';
				wait for 42 us;
				sQrcd_in<='1';
				wait for 120 ns;
				sQrcd_in<='0';
				wait for 42 us;
				sQrcd_in<='1';
				wait for 120 ns;
				sQrcd_in<='0';
				wait for 42 us;
				sQrcd_in<='1';
				wait for 120 ns;
				sQrcd_in<='0';
				wait for 42 us;
				sSoda_req_in<='1';
				wait for 120 ns;				
				sSoda_req_in<='0';				
				wait for 42 us;
				sSoda_req_in<='1';
				wait for 120 ns;				
				sSoda_req_in<='0';	
				wait for 42 us;
				sSoda_req_in<='1';
				wait for 120 ns;				
				sSoda_req_in<='0';	
				
				wait;
		end process;

  -- Component Instantiation
          uut: Usr_interaction port map ( 
					Qrcd_in           => sQrcd_in,
					Drcd_in           => sDrcd_in,
					Nrcd_in           => sNrcd_in,
				   Clk_in            => sClk_in,
				   Reset_n_in        => sReset_n_in,
				   Soda_req_in       => sSoda_req_in,
				   Soda_price_in     => sSoda_price_in,
				   Drop_soda_out     => sDrop_soda_out,
				   Qrcd_out          => sQrcd_out ,
				   Drcd_out          => sDrcd_out,
				   Nrcd_out          => sNrcd_out,
				   Amt_err           => sAmt_err,
				   unused_anode      => sunused_anode,
				   hund_anode_out    => shund_anode_out,
				   tens_anode_out    => stens_anode_out,
				   ones_anode_out    => sones_anode_out,
				   CAn_out           => sCAn_out,
				   CBn_out           => sCBn_out,
				   CCn_out           => sCCn_out,
				   CDn_out           => sCDn_out,
				   CEn_out           => sCEn_out,
				   CFn_out           => sCFn_out,
				   CGn_out           => sCGn_out
				);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 20 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
