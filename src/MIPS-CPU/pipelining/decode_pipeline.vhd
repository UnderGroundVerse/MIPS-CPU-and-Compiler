library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity Decode_Pipeline is
    port(
        clk : in std_logic;
        reg_dst, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        pc_plus4 : in std_logic_vector(31 downto 0);
        instruction : in std_logic_vector(31 downto 0);
        write_data : in std_logic_vector(31 downto 0);
        reg_write_back : in std_logic_vector(4 downto 0);

        extended_sign_out : out std_logic_vector(31 downto 0);
        function_op_out : out std_logic_vector(5 downto 0);
        register_target_out, register_destination_out : out std_logic_vector(4 downto 0);
        reg_dst_out, jump_out, branch_out, mem_read_out, mem_to_reg_out, mem_write_out, alu_src_out, reg_write_out : out std_logic;
        alu_op_out : out std_logic_vector(1 downto 0);
        pc_plus4_out : out std_logic_vector(31 downto 0);
        read_data1_out, read_data2_out : out std_logic_vector(31 downto 0)
    );
end Decode_Pipeline;

architecture Behavioral of Decode_Pipeline is
    component Instruction_Decode is
        port(
            clk, reg_write: in std_logic;
            pc : in std_logic_vector(31 downto 0);
            instruction : in std_logic_vector(31 downto 0);
            write_data : in std_logic_vector(31 downto 0);
            reg_write_back : in std_logic_vector(4 downto 0);
            read_data1, read_data2 : out std_logic_vector(31 downto 0);
            extended_sign : out std_logic_vector(31 downto 0);
            function_op : out std_logic_vector(5 downto 0);
            register_target, register_destination : out std_logic_vector(4 downto 0)
        );
    end component;
    component ID_EX is 
        port(
            reg_dst, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write : in std_logic;
            alu_op : in std_logic_vector(1 downto 0);
            pc_plus4 : in std_logic_vector(31 downto 0);
            read_data1, read_data2 : in std_logic_vector(31 downto 0);
            extended_sign : in std_logic_vector(31 downto 0);
            clk : in std_logic;
            reg_dst_out, jump_out, branch_out, mem_read_out, mem_to_reg_out, mem_write_out, alu_src_out, reg_write_out : out std_logic;
            alu_op_out : out std_logic_vector(1 downto 0);
            pc_plus4_out : out std_logic_vector(31 downto 0);
            read_data1_out, read_data2_out : out std_logic_vector(31 downto 0);
            extended_sign_out : out std_logic_vector(31 downto 0)
        );
    end component;

    signal read_data1_temp, read_data2_temp : std_logic_vector(31 downto 0);
    signal extended_sign_temp : std_logic_vector(31 downto 0);
    signal function_op_temp : std_logic_vector(5 downto 0);
    signal register_target_temp, register_destination_temp : std_logic_vector(4 downto 0);
begin
    inst_decode : Instruction_Decode port map(
        clk => clk,
        reg_write => reg_write,
        pc => pc_plus4,
        instruction => instruction,
        write_data => write_data,
        reg_write_back => reg_write_back,
        read_data1 => read_data1_temp,
        read_data2 => read_data2_temp,
        extended_sign => extended_sign_temp,
        function_op => function_op_out,
        register_target => register_target_out,
        register_destination => register_destination_out 
    );

    temp : ID_EX port map(
        clk => clk,
        reg_dst => reg_dst,
        jump => jump,
        branch => branch,
        mem_read => mem_read,
        mem_to_reg => mem_to_reg,
        mem_write => mem_write,
        alu_src => alu_src,
        reg_write => reg_write,
        alu_op => alu_op,
        pc_plus4 => pc_plus4,
        read_data1 => read_data1_temp,
        read_data2 => read_data2_temp,
        extended_sign => extended_sign_temp,

        reg_dst_out => reg_dst_out,
        jump_out => jump_out,
        branch_out => branch_out,
        mem_read_out => mem_read_out,
        mem_to_reg_out => mem_to_reg_out,
        mem_write_out => mem_write_out,
        alu_src_out => alu_src_out,
        reg_write_out => reg_write_out,
        alu_op_out => alu_op_out,
        pc_plus4_out => pc_plus4_out,
        read_data1_out => read_data1_out,
        read_data2_out => read_data2_out,
        extended_sign_out => extended_sign_out
    );
end Behavioral;