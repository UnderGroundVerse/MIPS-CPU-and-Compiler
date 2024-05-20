library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


 
Entity ID_EX is 
    port(
        reg_dst, jump, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write : in std_logic;
        pc_plus4 : in std_logic_vector(31 downto 0);
        read_data1, read_data2 : in std_logic_vector(31 downto 0);
        extended_sign : in std_logic_vector(31 downto 0);
        
    );