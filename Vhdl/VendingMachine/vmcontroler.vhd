----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:36 04/09/2013 
-- Design Name: 
-- Module Name:    vmcontroler - Behavioral 
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

entity vmcontroler is
	    Port ( Qp, Dp, Np, Soda_req, clk, Reset_n      : in   STD_LOGIC;
	     price_code  : in   STD_LOGIC_VECTOR(3 downto 0);
		   amt_err, Drop_soda      : out  STD_LOGIC;
	     hund       : out  STD_LOGIC_VECTOR(3 downto 0);
           tens      : out  STD_LOGIC_VECTOR(3 downto 0);
           ones       : out  STD_LOGIC_VECTOR(3 downto 0));
end vmcontroler;

architecture Behavioral of vmcontroler is


    COMPONENT bintobcd
    PORT(
         bin : IN  std_logic_vector(9 downto 0);
         hund : OUT  std_logic_vector(3 downto 0);
         tens : OUT  std_logic_vector(3 downto 0);
         ones : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


	type state_type is (idle,add25,add10,add5,vending,error,dispense,pulsewait,reset);  --type of state machine.
	signal current_s: state_type :=idle;
	signal bin, needthis : STD_LOGIC_VECTOR(9 downto 0) := "0000000000";
	signal counter : integer;
	signal sdrop,serr : std_logic := '0';	
	
begin


	Drop_soda <= sdrop;
	amt_err<=serr;
	


	process (clk)
		begin
			
			if(clk'event and clk = '1')then
				if (price_code = "0000")then
					needthis <="0000110111";
				elsif(price_code = "0001")then
					needthis <="0001010101";
				elsif(price_code = "0010")then
					needthis <="0001011111";
				elsif(price_code = "0011")then
					needthis <="0001111101";
				elsif(price_code = "0100")then
					needthis <="0010000111";
				elsif(price_code = "0101")then
					needthis <="0010010110";	
				elsif(price_code = "0110")then
					needthis <="0011100001";
				elsif(price_code = "0111")then
					needthis <="0011111010";	
				elsif(price_code = "1000")then
					needthis <="0100101100";
				end if;
			end if;
	end process;



	


	process (clk)

	begin
		
	if(clk'event and clk = '1')then
		case current_s is
		  when idle => 
		    counter <= 0;
				if (Qp='1' and Soda_req ='0') then
					current_s <= add25;
				elsif (Dp='1' and Soda_req ='0') then
					current_s <= add10;
				elsif (Np='1' and Soda_req ='0') then
					current_s <= add5;
				elsif ( Soda_req ='1') then
					current_s <= vending;
				else
					current_s <= idle;
				end if;
			when add25 =>
				current_s<=pulsewait;
			when reset =>
				current_s <= idle;
			when add5 =>
				current_s<=pulsewait;
			when add10 =>
				current_s<=pulsewait;
			when vending =>
					if (bin >= needthis)then
						current_s <= dispense;
					else
						current_s<=error;
					end if;
			when dispense =>
					if counter >=250 then
					--if counter >=25000000 then
						current_s<=idle;
					else
					  counter <= counter+1;
					end if;
			when error =>
					if counter >=250 then
					--if counter >=25000000 then
						current_s<=idle;
					else
					  counter <= counter+1;
					end if;
					
			when pulsewait =>
					if counter > 1025 then
						current_s<=idle;
					else
					  counter<=counter+1;
					end if;	
			end case;
		end if;		
	end process;
	
	process (clk)
	begin	
		if(clk'event and clk = '1')then
			case current_s is
				when add25 =>
					bin <= bin +25;
				when add5 =>
					bin <= bin + 5;
				when add10 =>  
					bin <= bin +10;
				when error =>
						serr<='1';
				when reset =>
					bin<="0000000000";
				when dispense=>
						if counter =1 then
							bin<=bin-needthis;
						end if;
						sdrop<='1';
				when others =>
						serr<='0';
						sdrop<='0';

			end case;
		end if;	
	end process;	
	
   uut: bintobcd PORT MAP (
          bin => bin,
          hund => hund,
          tens => tens,
          ones => ones
        );


end Behavioral;

