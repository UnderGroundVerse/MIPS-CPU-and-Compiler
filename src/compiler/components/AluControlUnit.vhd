----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:31 04/24/2024 
-- Design Name: 
-- Module Name:    AluControlUnit - Behavioral 
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

entity AluControlUnit is
 generic(
	c : integer := 6;
	p : integer := 2
	);
 
 port(
 alu_control_out: out std_logic_vector(3 downto 0);
 function_op : in std_logic_vector(c-1 downto 0);
 alu_op: in std_logic_vector(p-1 downto 0);
 clk : in std_logic 
);
end AluControlUnit;

architecture Behavioral of AluControlUnit is

signal alu_code : std_logic_vector (3 downto 0) := (others =>'0');
begin

process(clk)
begin
if(rising_edge(clk)) then
	if(alu_op = "10") --(R Type)
		then 
		case function_op is
			when "100000" =>  --add
				alu_code<="0010";
			when "100010" =>   --subtract
				alu_code<="0110";
			when "100101" => --or
				alu_code<="0001";
			when "100100" =>  --and
				alu_code<="0000"; 		
			when "011000" => --mul
				alu_code<="1000";
			when "011010" => --div
				alu_code<="1010";
			when "000000" => --sll
				alu_code<="1011";
			when "000011" => --shr
				alu_code<="1001";
				
			when others => 				
				alu_code<="1111";
				end case;
				alu_control_out<=alu_code;
	elsif (alu_op /= "10") --(I-Type)
	then
		case alu_op is
			when "00" => --addi
				alu_code<="0010";
			when "11" => --ori
				alu_code<="0001";
			when "01" => --beq(subtract)
				alu_code<="0110";
			when others => 
				
				end case;
				alu_control_out<=alu_code;
				
	end if;
end if;
end process;

end Behavioral;
