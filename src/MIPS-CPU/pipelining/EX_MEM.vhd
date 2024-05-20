library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity EX_MEM is
    port(
        jump, branch, mem_read, mem_to_reg, mem_write : in std_logic;
        alu_zero : in std_logic;
        alu_result : in std_logic_vector(31 downto 0);
        read_data2 : in std_logic_vector(31 downto 0);
        clk : in std_logic;
        jump_out, branch_out, mem_read_out, mem_to_reg_out, mem_write_out : out std_logic;
        alu_zero_out : out std_logic;
        alu_result_out : out std_logic_vector(31 downto 0);
        read_data2_out : out std_logic_vector(31 downto 0)
    );
end EX_MEM;

architecture Behavioral of EX_MEM is
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            jump_out <= jump;
            branch_out <= branch;
            mem_read_out <= mem_read;
            mem_to_reg_out <= mem_to_reg;
            mem_write_out <= mem_write;

            alu_zero_out <= alu_zero;
            alu_result_out <= alu_result;

            read_data2_out <= read_data2;
        end if;
    end process;
end Behavioral;