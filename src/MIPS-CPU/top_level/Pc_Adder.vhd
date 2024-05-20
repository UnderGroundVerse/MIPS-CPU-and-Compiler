----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:23:27 05/20/2024 
-- Design Name: 
-- Module Name:    Pc_Adder - Behavioral 
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

use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pc_Adder is
	 
	 generic ( n: integer :=32
	 );
	 
    Port ( pc_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (n-1 downto 0));
end Pc_Adder;

architecture Behavioral of Pc_Adder is

begin
pc_out<=pc_in + 4;

end Behavioral;

