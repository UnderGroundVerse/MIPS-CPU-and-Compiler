----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:20:00 04/24/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is 
generic (
n : integer  := 32;
c: integer := 6
);

port(
	alu_control_in: in std_logic_vector(2 downto 0);
	alu_out :out std_logic_vector (n-1 downto 0);
	operand1,operand2 :in std_logic_vector(n-1 downto 0);
	clk :in std_logic
);
end ALU;

architecture Behavioral of ALU is

signal result : std_logic_vector (n-1 downto 0);

begin

process(clk)

begin
	case alu_control_in is
		when "010" => 
			result<= operand1 + operand2;
		when "110" => 
			result<= operand1 - operand2;
		when "001" =>
			result<= operand1 or operand2;
		when "000" =>
			result<= operand1 and operand2;
		when others =>
			result <= (others => '0');
		end case;
		end process;
	alu_out<=result;
end Behavioral;

