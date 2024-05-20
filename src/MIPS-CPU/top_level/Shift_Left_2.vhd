----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:33 05/20/2024 
-- Design Name: 
-- Module Name:    Shift_Left_2 - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shift_Left_2 is
	generic(
	n : integer := 32
	);
    Port ( input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           shifted_out : out  STD_LOGIC_VECTOR (n-1 downto 0));
			  
end Shift_Left_2;

architecture Behavioral of Shift_Left_2 is

begin

shifted_out<=std_logic_vector(shift_left(unsigned(input),2));


end Behavioral;

