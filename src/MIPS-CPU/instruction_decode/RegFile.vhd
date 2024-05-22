----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:44:09 04/25/2024 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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

entity RegFile is
port( 

regWrite : in std_logic ; --contol unit sent value
read_reg1 : in std_logic_vector (4 downto 0); --address of 1'st inside array to pass it's data to alu
read_reg2 : in std_logic_vector (4 downto 0); --address of 2'nt inside array to pass it's data to alu
write_reg : in std_logic_vector (4 downto 0); --address of reg inside array to be written on
write_data :in std_logic_vector (31 downto 0); --The data to be written on
read_data1 :out std_logic_vector (31 downto 0); --The data of 1'st reg to be sent to ALU
read_data2 : out std_logic_vector (31 downto 0); --The data of 2'nd reg to be sent to ALU
clk,rst : in std_logic
);
end RegFile;

architecture Behavioral of RegFile is
type reg_type is array (31 downto 0)  of std_logic_vector (31 downto 0);
signal reg_array :reg_type := (others => X"00000000");
signal read_data1_temp : std_logic_vector(31 downto 0) := X"00000000";
signal read_data2_temp : std_logic_vector(31 downto 0) := X"00000000";

begin

process(clk,rst)
begin
	if(rst='1') 
		 then
		reg_array <= (others => X"00000000");
		
	elsif(rising_edge(clk))
		then
			if(regWrite = '1')
				then
					reg_array(to_integer(unsigned(write_reg))) <= write_data;
					read_data1_temp<= reg_array(to_integer(unsigned(read_reg1)));	
					read_data2_temp<= reg_array(to_integer(unsigned(read_reg2)));
			elsif(regWrite ='0') 
				then
		read_data1_temp<= reg_array(to_integer(unsigned(read_reg1)));	
		read_data2_temp<= reg_array(to_integer(unsigned(read_reg2)));		
	end if;	
end if;	
end process;
read_data1 <= X"00000000" when read_reg_1 = "00000" else read_data1_temp;
read_data2 <= X"00000000" when read_reg_2 = "00000" else read_data2_temp;
end Behavioral;

