----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:25:04 05/24/2024 
-- Design Name: 
-- Module Name:    Hazard_Detection_Unit - Behavioral 
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




entity hazard_detection_unit is
port
(
	reg_target_ID_EX, reg_destination_ID_EX, reg_source_IF_ID, reg_target_IF_ID, reg_write_back_EX_MEM : in std_logic_vector(4 downto 0);
	
	mem_to_reg_ID_EX, mem_to_reg_EX_MEM: in std_logic; 
	
	branch : in std_logic; 
	
	alu_src_ID, alu_src_ID_EX : in std_logic;
	
	reg_write_ID,reg_write_ID_EX : in std_logic; 
	
	stall : out std_logic 
);
end hazard_detection_unit;

architecture Behavioral of hazard_detection_unit is
begin
	process(branch, mem_to_reg_EX_MEM, mem_to_reg_ID_EX
	, reg_destination_ID_EX, reg_write_ID_EX , reg_write_ID
	, reg_write_back_EX_MEM, reg_source_IF_ID
	, reg_target_ID_EX, reg_target_IF_ID
	, alu_src_ID, alu_src_ID_EX)
	begin
		stall <= '0';
		
		if(branch = '1' and reg_write_ID_EX = '1') then 
			if(alu_src_ID_EX = '1') then
				if((unsigned(reg_source_IF_ID) = unsigned(reg_target_ID_EX)) or (unsigned(reg_target_IF_ID) = unsigned(reg_target_ID_EX))) then
					stall <= '1';
				end if;
			end if;
			
		
			if(mem_to_reg_ID_EX = '0') then
				if((unsigned(reg_source_IF_ID) = unsigned(reg_destination_ID_EX)) or (unsigned(reg_target_IF_ID) = unsigned(reg_destination_ID_EX))) then
					stall <= '1';
				end if;
			end if;
			
			if(mem_to_reg_EX_MEM = '1') then
				if((unsigned(reg_source_IF_ID) = unsigned(reg_write_back_EX_MEM)) or (unsigned(reg_target_IF_ID) = unsigned(reg_write_back_EX_MEM))) then
					stall <= '1';
				end if;
			end if;
		end if;
		
		
		if(mem_to_reg_ID_EX = '1' and reg_write_ID = '1') then
			
			if((unsigned(reg_target_ID_EX) = unsigned(reg_source_IF_ID) or unsigned(reg_target_ID_EX) = unsigned(reg_target_IF_ID)) and alu_src_ID = '0') then
				stall <= '1';
			
			
			elsif(((unsigned(reg_target_ID_EX) = unsigned(reg_source_IF_ID)) and alu_src_ID = '1')) then
				stall <= '1';
			end if;
		end if;
	end process;	
	
	
end architecture Behavioral;
