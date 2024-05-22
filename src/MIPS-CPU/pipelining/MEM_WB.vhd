library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity MEM_WB is
    port(
        clk : in std_logic;
        mem_to_reg, reg_write : in std_logic;
        read_data : in std_logic_vector(31 downto 0);
        alu_result : in std_logic_vector(31 downto 0);
        reg_write_back : in std_logic_vector(4 downto 0);

        mem_to_reg_out, reg_write_out : out std_logic;
        read_data_out : out std_logic_vector(31 downto 0);
        alu_result_out : out std_logic_vector(31 downto 0);
        reg_write_back_out : out std_logic_vector(4 downto 0)
    );
end MEM_WB;

architecture Behavioral of MEM_WB is
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            mem_to_reg_out <= mem_to_reg;
            reg_write_out <= reg_write;
            read_data_out <= read_data;
            alu_result_out <= alu_result;
            reg_write_back_out <= reg_write_back;
        end if;
    end process;
end Behavioral;
