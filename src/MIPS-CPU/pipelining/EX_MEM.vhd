library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity EX_MEM is
    port(
        mem_read, mem_to_reg, mem_write : in std_logic;
		  reg_write  : in std_logic ;
		  reg_write_back : in std_logic_vector (4 downto 0);
        alu_result : in std_logic_vector(31 downto 0);
        read_data2 : in std_logic_vector(31 downto 0);
        clk : in std_logic;
        mem_read_out, mem_to_reg_out, mem_write_out : out std_logic;
        alu_result_out : out std_logic_vector(31 downto 0);
		  reg_write_out  : out std_logic;
		  reg_write_back_out : out std_logic_vector (4 downto 0);
        read_data2_out : out std_logic_vector(31 downto 0)
    );
end EX_MEM;

architecture Behavioral of EX_MEM is
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            mem_read_out <= mem_read;
            mem_to_reg_out <= mem_to_reg;
            mem_write_out <= mem_write;
				reg_write_out <= reg_write;
				reg_write_back_out <= reg_write_back;
            alu_result_out <= alu_result;
            read_data2_out <= read_data2;
        end if;
    end process;
end Behavioral;