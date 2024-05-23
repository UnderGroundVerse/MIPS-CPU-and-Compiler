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
use ieee.numeric_std.all;


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
	alu_control_in: in std_logic_vector(3 downto 0);
	alu_out :out std_logic_vector (n-1 downto 0);
	alu_zero:out std_logic;
	operand1,operand2 :in std_logic_vector(n-1 downto 0);
	alu_shamt:in std_logic_vector (4 downto 0) :=(others=>'0');
	clk :in std_logic
);
end ALU;

architecture Behavioral of ALU is

signal result : std_logic_vector (n-1 downto 0);
signal alu_zero_temp : std_logic := '0';
signal mul : std_logic_vector (63 downto 0);
signal div : std_logic_vector (63 downto 0);
signal hi : std_logic_vector (n-1 downto 0);
signal lo : std_logic_vector (n-1 downto 0);

begin

process (alu_control_in, operand1, operand2)--(clk)

begin
-- if (rising_edge(clk)) 
-- 	then
	alu_zero_temp<='0';
	case alu_control_in is
		when "0010" => 
			result<= operand1 + operand2;
		when "0110" => 
			result<= operand1 - operand2;
		when "0001" =>
			result<= operand1 or operand2;
		when "0000" =>
			result<= operand1 and operand2;
		when "1000" => 
			mul<= operand1 * operand2;
			lo<=mul(31 downto 0);
			hi<=mul(63 downto 32);
			result<=lo;	
	
		when "0101" =>   --inp
			result <= operand1;
		when "0111" =>   --bun
			alu_zero_temp<='1';
		when others =>
			result <= (others => '0');
		end case;
		if((alu_control_in="0110") and (result = (X"00000000"))) then --beq
			alu_zero_temp<='1';
		end if;
		if((alu_control_in="1100") and (operand1(31) = '0')) then --skip
			alu_zero_temp<='1';
		end if;	
		
	-- end if;
		end process;
	alu_out<=result;
	alu_zero <= alu_zero_temp;

end Behavioral;

