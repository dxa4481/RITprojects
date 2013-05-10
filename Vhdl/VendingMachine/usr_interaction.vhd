----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Prof. Cliver
-- 
-- Create Date: Summer Time
-- Design Name: vending_machine
-- Module Name: Usr_interaction - Behavioral 
-- Project Name: 561_vend_mach
-- Target Devices: Spartan 3E FPGA
-- Tool versions: 8.2
-- Description: Top level wrapper bringing together user signals.
-- Dependencies: Price_n_drop, coin_rx, seven_seg_disp
--
-- Revision: 1
-- Revision 0.01 - File Created
-- Additional Comments: Feel free to change any names or code.
--	Refer to the Digilent manual for more details.
--
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Usr_interaction is
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
end Usr_interaction;

architecture Behavioral of Usr_interaction is

signal Qp_wire           : STD_LOGIC; 
signal Dp_wire           : STD_LOGIC; 
signal Np_wire           : STD_LOGIC; 

signal hund_bcd  : STD_LOGIC_VECTOR (3 downto 0);
signal tens_bcd  : STD_LOGIC_VECTOR (3 downto 0);
signal ones_bcd  : STD_LOGIC_VECTOR (3 downto 0);


signal hund_disp_n_wire  : STD_LOGIC_VECTOR (6 downto 0);
signal tens_disp_n_wire  : STD_LOGIC_VECTOR (6 downto 0);
signal ones_disp_n_wire  : STD_LOGIC_VECTOR (6 downto 0);

-- this is your controller
--component vending_machine_controller
--  Port ( Clk         : in   STD_LOGIC;
--         Reset_n     : in   STD_LOGIC;
--


--end component;


    COMPONENT vmcontroler
	    Port ( Qp, Dp, Np, Soda_req, clk, Reset_n      : in   STD_LOGIC;
	     price_code  : in   STD_LOGIC_VECTOR(3 downto 0);
		   amt_err, Drop_soda      : out  STD_LOGIC;
	     hund       : out  STD_LOGIC_VECTOR(3 downto 0);
           tens      : out  STD_LOGIC_VECTOR(3 downto 0);
           ones       : out  STD_LOGIC_VECTOR(3 downto 0));	
    END COMPONENT;	



-- component declaration: hear yea, hear yea, I plan to use coin_rx
component coin_rx
    Port ( Qrcd     : in   STD_LOGIC;
           Drcd     : in   STD_LOGIC;
           Nrcd     : in   STD_LOGIC;
			  Clk      : in   STD_LOGIC;
			  Reset_n  : in   STD_LOGIC;
			  Qp       : out  STD_LOGIC;
           Dp       : out  STD_LOGIC;
           Np       : out  STD_LOGIC);
end component;

-- component declaration: hear yea, hear yea, I plan to use seven_seg_disp
component seven_seg_disp
    Port ( hund_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
	        tens_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
           ones_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
	        clk          : in  STD_LOGIC; -- digilent board generated clock
			  reset_n      : in  STD_LOGIC; -- switch input
			  unused_anode : out STD_LOGIC; -- unused an3
			  hund_anode   : out STD_LOGIC; -- digilent an2
	        tens_anode   : out STD_LOGIC; -- digilent an3
	        ones_anode   : out STD_LOGIC; -- digilent an4
			  CAn,CBn,CCn,CDn,CEn,CFn,CGn : out STD_LOGIC); -- digilent cathode - used for all displays
end component;
	signal lowreset : std_logic;

begin
	lowreset<=not Reset_n_in;
  Qrcd_out <= Qrcd_in;
  Drcd_out <= Drcd_in;
  Nrcd_out <= Nrcd_in;

-- this is your controller set into use
instance0_vending_machine_controller : vmcontroler
port map ( 
   clk               => Clk_in,
   Reset_n           => Reset_n_in,
   Qp                => Qp_wire,
   Dp                => Dp_wire,
   Np                => Np_wire,
	Soda_req          => soda_req_in,
   price_code        => soda_price_in,
   Drop_soda         => drop_soda_out,
	amt_err           => Amt_err,
   hund       => hund_bcd,
   tens       => tens_bcd,
   ones       => ones_bcd
);


process(Clk_in)
begin
		case hund_bcd is
			when "0000" => hund_disp_n_wire <= "1111110";
			when "0001" => hund_disp_n_wire <= "0110000";
			when "0010" => hund_disp_n_wire <= "1101101";
			when "0011" => hund_disp_n_wire <= "1111001";
			when "0100" => hund_disp_n_wire <= "0110011";
			when "0101" => hund_disp_n_wire <= "1011011";
			when "0110" => hund_disp_n_wire <= "1011111";
			when "0111" => hund_disp_n_wire <= "1110000";	
			when "1000" => hund_disp_n_wire <= "1111111";		
			when "1001" => hund_disp_n_wire <= "1111011";
			when others => hund_disp_n_wire <= "0000000";	
		end case;

		case tens_bcd is
			when "0000" => tens_disp_n_wire <= "1111110";
			when "0001" => tens_disp_n_wire <= "0110000";
			when "0010" => tens_disp_n_wire <= "1101101";
			when "0011" => tens_disp_n_wire <= "1111001";
			when "0100" => tens_disp_n_wire <= "0110011";
			when "0101" => tens_disp_n_wire <= "1011011";
			when "0110" => tens_disp_n_wire <= "1011111";
			when "0111" => tens_disp_n_wire <= "1110000";	
			when "1000" => tens_disp_n_wire <= "1111111";		
			when "1001" => tens_disp_n_wire <= "1111011";
			when others => tens_disp_n_wire <= "0000000";	
		end case;

		case ones_bcd is
			when "0000" => ones_disp_n_wire <= "1111110";
			when "0001" => ones_disp_n_wire <= "0110000";
			when "0010" => ones_disp_n_wire <= "1101101";
			when "0011" => ones_disp_n_wire <= "1111001";
			when "0100" => ones_disp_n_wire <= "0110011";
			when "0101" => ones_disp_n_wire <= "1011011";
			when "0110" => ones_disp_n_wire <= "1011111";
			when "0111" => ones_disp_n_wire <= "1110000";	
			when "1000" => ones_disp_n_wire <= "1111111";		
			when "1001" => ones_disp_n_wire <= "1111011";
			when others => ones_disp_n_wire <= "0000000";
		end case;
end process;



-- component instantiation: ok, now I am actually using coin_rx
instance0_coin_rx : coin_rx
port map (
   Qrcd              => Qrcd_in,
   Drcd              => Drcd_in,
   Nrcd              => Nrcd_in,
   Clk               => Clk_in,
   Reset_n           => Reset_n_in,
   Qp                => Qp_wire,
   Dp                => Dp_wire,
   Np                => Np_wire
);

-- component instantiation: ok, now I am actually using seven_seg_disp
instance0_seven_seg_disp : seven_seg_disp
port map (
--   hund_disp_n       => not hund_disp_n_wire,
--   tens_disp_n       => not tens_disp_n_wire,
--   ones_disp_n       => not ones_disp_n_wire,
   hund_disp_n       => hund_disp_n_wire,
   tens_disp_n       => tens_disp_n_wire,
   ones_disp_n       => ones_disp_n_wire,
   clk               => Clk_in,
   reset_n           => Reset_n_in,
   unused_anode      => unused_anode,
   hund_anode        => hund_anode_out,
   tens_anode        => tens_anode_out,
   ones_anode        => ones_anode_out,
   CAn               => CAn_out,
	CBn               => CBn_out,
	CCn               => CCn_out,
	CDn               => CDn_out,
	CEn               => CEn_out,
	CFn               => CFn_out,
	CGn               => CGn_out
	);

end Behavioral;

