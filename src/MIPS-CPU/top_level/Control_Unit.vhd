----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:47 05/03/2024 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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

entity Control_Unit is
generic(
c: integer := 6;
p: integer :=2
);
port (
  opcode: in std_logic_vector(5 downto 0);
	
	alu_op: out std_logic_vector(1 downto 0);
  mem_to_reg,reg_dst,jump,branch,mem_read,mem_write,alu_src,reg_write: out std_logic;
  clk : in std_logic
 );

end Control_Unit;

architecture Behavioral of Control_Unit is

begin
process(clk)
begin

 if(falling_edge(clk))
 then
 case opcode is
  when "000000" => --(R type)
    reg_dst <= '1'; --taking destintion reg as r type
    mem_to_reg <= '0';
    alu_op <= "10";
    jump <= '0';
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '0';
    reg_write <= '1';
	 

	 
	 when "001000" => --addi (I type)
    reg_dst <= '0'; --taking destintion reg as i type
    mem_to_reg <= '0';
    alu_op <= "00";
    jump <= '0';
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '1';
    reg_write <= '1';
	 
	 when "001101" => --ori (I type)
    reg_dst <= '0'; --taking destintion reg as i type
    mem_to_reg <= '0';
    alu_op <= "11";
    jump <= '0';
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '1';
    reg_write <= '1';
	 
	

  when "100011" => -- LW
   reg_dst <= '0';
   mem_to_reg <= '1';
   alu_op <= "00";
   jump <= '0';
   branch <= '0';
   mem_read <= '1';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
  
  when "101011" => -- SW
   reg_dst <= '-'; 
	alu_src <= '1';
   mem_to_reg <= '-';
	 reg_write <= '0';
	 mem_read <= '0';
	  mem_write <= '1';
	   branch <= '0';
   alu_op <= "00";
   jump <= '0';
  
   when "000100" => -- beq
   reg_dst <= '-'; 
	alu_src <= '0';
   mem_to_reg <= '-';
	 reg_write <= '0';
	 mem_read <= '0';
	  mem_write <= '0';
	   branch <= '1';
   alu_op <= "01"; 
   jump <= '0';
  
  when "000010" => -- j
   reg_dst <= '-'; 
	alu_src <= '-';
   mem_to_reg <= '-';
	 reg_write <= '0';
	 mem_read <= '0';
	  mem_write <= '0';
	   branch <= '0';
   alu_op <= "--";
   jump <= '1';
  
   
 
 when others =>   
    reg_dst <= '0';
    mem_to_reg <= '0';
    alu_op <= "00";
    jump <= '0';
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '0';
    reg_write <= '0';
   
 end case;
 end if;
end process;



end Behavioral;

