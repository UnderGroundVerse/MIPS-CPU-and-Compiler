library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


 
Entity ID_EX is 
    port(
        reg_dst, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        pc_plus4 : in std_logic_vector(31 downto 0);
        read_data1, read_data2 : in std_logic_vector(31 downto 0);
        extended_sign : in std_logic_vector(31 downto 0);
        register_target, register_destination : in std_logic_vector(4 downto 0);
        function_op : in std_logic_vector(5 downto 0);
        clk : in std_logic;
        reg_dst_out, jump_out, branch_out, mem_read_out, mem_to_reg_out, mem_write_out, alu_src_out, reg_write_out : out std_logic;
        alu_op_out : out std_logic_vector(1 downto 0);
        pc_plus4_out : out std_logic_vector(31 downto 0);
        read_data1_out, read_data2_out : out std_logic_vector(31 downto 0);
        extended_sign_out : out std_logic_vector(31 downto 0);
        register_target_out, register_destination_out : out std_logic_vector(4 downto 0);
        function_op_out : out std_logic_vector(5 downto 0);

        stall : in std_logic
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

            register_target_out <= register_target;
            register_destination_out <= register_destination;
            function_op_out <= function_op;

            if (stall = '1') then
                -- alu_op_out <= (others => '0');
                -- mem_write_out <= '0';
                -- mem_read_out <= '0'; --check
                reg_write_out <= '0';
                -- reg_dst_out <= '1';
                -- jump_out <= '0';
                -- branch_out <= '0';
                mem_to_reg_out <= '0';
                -- alu_src_out <= '0';
            end if;
        end if;
    end process;
end Behavioral;
