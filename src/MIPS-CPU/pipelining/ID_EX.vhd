library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


 
Entity ID_EX is 
    port(
        reg_dst, jump, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write : in std_logic;
        pc_plus4 : in std_logic_vector(31 downto 0);
        read_data1, read_data2 : in std_logic_vector(31 downto 0);
        extended_sign : in std_logic_vector(31 downto 0);
        clk : in std_logic;
        reg_dst_out, jump_out, branch_out, mem_read_out, mem_to_reg_out, alu_op_out, mem_write_out, alu_src_out, reg_write_out : out std_logic;
        pc_plus4_out : out std_logic_vector(31 downto 0);
        read_data1_out, read_data2_out : out std_logic_vector(31 downto 0);
        extended_sign_out : out std_logic_vector(31 downto 0)
    );
end ID_EX;


architecture Behavioral of ID_EX is
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            reg_dst_out <= reg_dst;
            jump_out <= jump;
            branch_out <= branch;
            mem_read_out <= mem_read;
            mem_to_reg_out <= mem_to_reg;
            alu_op_out <= alu_op;
            mem_write_out <= mem_write;
            alu_src_out <= alu_src;
            reg_write_out <= reg_write;

            pc_plus4_out <= pc_plus4;

            read_data1_out <= read_data1;
            read_data2_out <= read_data2;

            extended_sign_out <= extended_sign;
        end if;
    end process;
end Behavioral;
