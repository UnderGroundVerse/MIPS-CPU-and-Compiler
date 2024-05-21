library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity MEM_WB is
    port(
        mem_to_reg, reg_write : in std_logic;
        read_data : in std_logic_vector(31 downto 0);
        alu_result : in std_logic_vector(31 downto 0);
        
    );