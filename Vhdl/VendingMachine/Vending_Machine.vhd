----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:06 04/16/2013 
-- Design Name: 
-- Module Name:    Vending_Machine - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vending_Machine is
    Port ( Quarter, Dime, Nickel, Clk, reset_n, pricecode, Soda_req     : in   STD_LOGIC;
				amt_err, Drop_soda : out std_logic;
				Cathodes : out std_logic_vector(7 downto 1);
				Anodes : out std_logic_vector(3 downto 0));
end Vending_Machine;

architecture Behavioral of Vending_Machine is


    COMPONENT usr_interaction
   Port ( Quarter, Dime, Nickel, Clk, reset_n     : in   STD_LOGIC;
				Hund_disp, Tens_disp, Ones_disp     : in   STD_LOGIC_vector(3 downto 0);
				Qp, Dp, Np : out STD_LOGIC;
				Cathodes : out std_logic_vector(7 downto 1);
				Anodes : out std_logic_vector(3 downto 0));	
    END COMPONENT;
	 
    COMPONENT vmcontroler
	    Port ( Qp, Dp, Np, Soda_req      : in   STD_LOGIC;
	     price_code  : in   STD_LOGIC_VECTOR(3 downto 0);
		   amt_err, Drop_soda      : out  STD_LOGIC;
	     hund       : out  STD_LOGIC_VECTOR(3 downto 0);
           tens      : out  STD_LOGIC_VECTOR(3 downto 0);
           ones       : out  STD_LOGIC_VECTOR(3 downto 0));	
    END COMPONENT;	 
	signal qp, dp, np : std_logic;
	signal hund, tens, ones : std_logic_vector(3 downto 0); 

begin

   uut: usr_interaction PORT MAP (
          Quarter => Quarter,
          Dime => Dime,
          Nickel => Nickel,
          Clk => Clk,
			 reset_n => reset_n,
			 Qp => qp,
			 Dp => dp,
			 Np => np,
			 Hund_disp => hund,
			 Tens_disp => tens,
			 Ones_disp => ones,
			 Cathodes => Cathodes,
			 Anodes => Anodes
			 );
			 
   uut2: vmcontroler PORT MAP (
          Qp => qp,
          Dp => dp,
          Np => np,
          Soda_req => Soda_req,
          price_code => pricecode,
          amt_err => amt_err,
			 Drop_soda => Drop_soda,
			 hund => hund,
			 tens => tens,
			 ones => ones
        );


end Behavioral;

