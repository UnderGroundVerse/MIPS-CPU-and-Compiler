----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:28 05/17/2024 
-- Design Name: 
-- Module Name:    Sign_Extenter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sign_Extender is
    Port ( immediate_in : in  STD_LOGIC_VECTOR (15 downto 0);
           immediate_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic);
			 
end Sign_Extender;

architecture Behavioral of Sign_Extender is
signal bits_holder : std_logic_vector (15 downto 0);
begin

process(clk)
begin
	if(immediate_in(15) = '0') then
		bits_holder<=(others =>'0');
		immediate_out<= bits_holder & immediate_in;
	elsif(immediate_in(15) = '1') then
		bits_holder<=(others =>'1');
		immediate_out<= bits_holder & immediate_in;
	end if;
end process;

end Behavioral;

