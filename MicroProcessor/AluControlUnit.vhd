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
	c : integer := 6
	
	);
 
 port(
 alu_control_out: out std_logic_vector(2 downto 0);
 function_op : in std_logic_vector(c-1 downto 0);
 alu_op: in std_logic_vector(c-1 downto 0);
 clk : in std_logic 
);
end AluControlUnit;

architecture Behavioral of AluControlUnit is

signal alu_code : std_logic_vector (2 downto 0) := (others =>'0');
begin

process(clk)
begin
	if(alu_op = "000000") 
		then 
		case function_op is
			when "100000" =>
				alu_code<="010";
			when "100101" =>
				alu_code<="001";
			when "100100" =>
				alu_code<="000";
			when "100010" =>
				alu_code<="110";
			when "000000" =>
				alu_code<="111";
			when others => 				
				alu_code<="101";
				end case;
				alu_control_out<=alu_code;
	elsif (alu_op /= "000000")
	then
		case alu_op is
			when "100000" =>
				alu_code<="010";
			when "100101" =>
				alu_code<="001";
			when "100100" =>
				alu_code<="000";
			when "100010" =>
				alu_code<="110";
				when others => 
				alu_code<=(others => 'Z');
				end case;
				alu_control_out<=alu_code;
	end if;
	
end process;

end Behavioral;

