library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity EX_MEM is
    port(
        jump, branch, mem_read, mem_to_reg, mem_write : in std_logic;
        alu_zero : in std_logic;
        alu_result : in std_logic_vector(31 downto 0);
        read_data2 : in std_logic_vector(31 downto 0);
        
    );