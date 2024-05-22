library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Data_Path is
    port(
        clk : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        mem_to_reg, reg_dst, jump, branch, mem_read, mem_write, alu_src, reg_write : in std_logic;
        
        instruction_out_1 : out std_logic_vector(31 downto 0);
        pc_plus4_out_1 : out std_logic_vector(31 downto 0);

        extended_sign_out_2 : out std_logic_vector(31 downto 0);
        function_op_out_2 : out std_logic_vector(5 downto 0);
        register_target_out_2, register_destination_out_2 : out std_logic_vector(4 downto 0);
        reg_dst_out_2, jump_out_2, branch_out_2, mem_read_out_2, mem_to_reg_out_2, mem_write_out_2, alu_src_out_2, reg_write_out_2 : out std_logic;
        alu_op_out_2 : out std_logic_vector(1 downto 0);
        pc_plus4_out_2 : out std_logic_vector(31 downto 0);
        read_data1_out_2, read_data2_out_2 : out std_logic_vector(31 downto 0);

        reg_write_back_3 : out std_logic_vector (4 downto 0);
        read_data_2_out_3 : out std_logic_vector (31 downto 0);
        alu_result_out_3  : out std_logic_vector (31 downto 0);
        pc_from_branch_3  : out std_logic_vector(31 downto 0);
        pc_src_selector_3 : out std_logic;
        mem_read_out_3    : out std_logic;
        mem_to_reg_out_3  : out std_logic;
        reg_write_out_3   : out std_logic;
        mem_write_out_3   : out std_logic;

        reg_write_out_4,mem_to_reg_out_4  : out std_logic ;
        alu_result_out_4  : out std_logic_vector (31 downto 0);
        reg_write_back_out_4 : out std_logic_vector (4 downto 0);
        read_data_4 :  out std_logic_vector (31 downto 0);

        write_data_out_5 : out std_logic_vector(31 downto 0)
    );
end Data_Path;

architecture Behavioral of Data_Path is
    component Fetch_Pipeline is
        port(
            clk : in std_logic;
            jump : in std_logic;
            pc_src_selector : in std_logic;
            pc_from_branch  : in std_logic_vector(31 downto 0);
            instruction_out : out std_logic_vector(31 downto 0);
            pc_plus4_out : out std_logic_vector(31 downto 0)
        );
    end component;

    component Decode_Pipeline is
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
    end component;

    component MEM_EXE_PIPE is
        port
        (	
            clk : in std_logic;
            branch,reg_dest,alu_src,mem_read,mem_write : in std_logic ;
            alu_op      : in std_logic_vector (1 downto 0);
            mem_to_reg  :in std_logic;
            reg_write : in std_logic;
            pc_out_in    : in std_logic_vector (31 downto 0);
            alu_shamt : in std_logic_vector(4 downto 0);
            read_data_1,read_data_2  : in std_logic_vector (31 downto 0);
            sign_extended  : in std_logic_vector (31 downto 0);
            function_op    : in std_logic_vector (5 downto 0);
            reg_target,reg_destination :in std_logic_vector(4 downto 0);

            reg_write_back : out std_logic_vector (4 downto 0);
            read_data_2_out : out std_logic_vector (31 downto 0);
            alu_result_out  : out std_logic_vector (31 downto 0);
            pc_from_branch  : out std_logic_vector(31 downto 0);
            pc_src_selector : out std_logic;
            mem_read_out    : out std_logic;
            mem_to_reg_out  : out std_logic;
            reg_write_out   : out std_logic;
            mem_write_out   : out std_logic
        );
    end component;

    component MEM_WB_PIPE is
        port  (
            clk : in std_logic;
            mem_to_reg,reg_write,mem_read,mem_write : in std_logic;
            alu_result : in std_logic_vector (31 downto 0);
            read_data_2 : in std_logic_vector (31 downto 0);
            reg_write_back : in std_logic_vector (4 downto 0);
            reg_write_out,mem_to_reg_out  : out std_logic ;
            alu_result_out  : out std_logic_vector (31 downto 0);
            reg_write_back_out : out std_logic_vector (4 downto 0);
            read_data :  out std_logic_vector (31 downto 0)
        );
    end component;

    component Write_back is
        generic (
        n : integer := 32
        );
        port(
        mem_read_data : in std_logic_vector (n-1 downto 0);
        alu_result    : in std_logic_vector (n-1 downto 0);
        mem_to_reg    : in std_logic;
        write_data    : out std_logic_vector (n-1 downto 0)	
        );
    end component;

    signal instruction_out_temp1 : std_logic_vector(31 downto 0);
    signal pc_plus4_out_temp1 : std_logic_vector(31 downto 0);

    signal extended_sign_out_temp2 : std_logic_vector(31 downto 0);
    signal function_op_out_temp2 : std_logic_vector(5 downto 0);
    signal register_target_out_temp2, register_destination_out_temp2 : std_logic_vector(4 downto 0);
    signal reg_dst_out_temp2, jump_out_temp2, branch_out_temp2, mem_read_out_temp2, mem_to_reg_out_temp2, mem_write_out_temp2, alu_src_out_temp2, reg_write_out_temp2 : std_logic;
    signal alu_op_out_temp2 : std_logic_vector(1 downto 0);
    signal pc_plus4_out_temp2 : std_logic_vector(31 downto 0);
    signal read_data1_out_temp2, read_data2_out_temp2 : std_logic_vector(31 downto 0);

    signal reg_write_back_temp3 : std_logic_vector (4 downto 0);
    signal read_data_2_out_temp3 : std_logic_vector (31 downto 0);
    signal alu_result_out_temp3  : std_logic_vector (31 downto 0);
    signal pc_from_branch_temp3  : std_logic_vector(31 downto 0);
    signal pc_src_selector_temp3 : std_logic;
    signal mem_read_out_temp3    : std_logic;
    signal mem_to_reg_out_temp3  : std_logic;
    signal reg_write_out_temp3   : std_logic;
    signal mem_write_out_temp3   : std_logic;

    signal reg_write_out_temp4,mem_to_reg_out_temp4 : std_logic ;
    signal alu_result_out_temp4 : std_logic_vector (31 downto 0);
    signal reg_write_back_out_temp4 : std_logic_vector (4 downto 0);
    signal read_data_temp4 : std_logic_vector (31 downto 0);

    signal write_data_out_temp5 : std_logic_vector (31 downto 0);	

begin

    instruction_out_1 <= instruction_out_temp1;
    pc_plus4_out_1 <= pc_plus4_out_temp1;

    extended_sign_out_2 <= extended_sign_out_temp2;
    function_op_out_2 <= function_op_out_temp2;
    register_target_out_2 <= register_target_out_temp2 ; 
    register_destination_out_2 <= register_destination_out_temp2;
    reg_dst_out_2 <= reg_dst_out_temp2; 
    jump_out_2 <= jump_out_temp2;
    branch_out_2 <= branch_out_temp2; 
    mem_read_out_2 <= mem_read_out_temp2; 
    mem_to_reg_out_2 <= mem_to_reg_out_temp2; 
    mem_write_out_2 <= mem_write_out_temp2 ; 
    alu_src_out_2 <= alu_src_out_temp2 ; 
    reg_write_out_2 <= reg_write_out_temp2;
    alu_op_out_2 <= alu_op_out_temp2;
    pc_plus4_out_2 <= pc_plus4_out_temp2;
    read_data1_out_2 <= read_data1_out_temp2; 
    read_data2_out_2 <= read_data2_out_temp2;

    reg_write_back_3 <= reg_write_back_temp3;
    read_data_2_out_3 <= read_data_2_out_temp3;
    alu_result_out_3  <= alu_result_out_temp3;
    pc_from_branch_3  <= pc_from_branch_temp3;
    pc_src_selector_3 <= pc_src_selector_temp3;
    mem_read_out_3    <= mem_read_out_temp3;
    mem_to_reg_out_3  <= mem_to_reg_out_temp3;
    reg_write_out_3   <= reg_write_out_temp3;
    mem_write_out_3   <= mem_write_out_temp3;

    reg_write_out_4 <= reg_write_out_temp4;
    mem_to_reg_out_4 <= mem_to_reg_out_temp4;
    alu_result_out_4  <= alu_result_out_temp4;
    reg_write_back_out_4 <= reg_write_back_out_temp4;
    read_data_4 <= read_data_temp4;

    write_data_out_5 <= write_data_out_temp5;


    fetch_pipe : Fetch_Pipeline port map(
        clk => clk,
        jump => jump,
        pc_src_selector => pc_src_selector_temp3,
        pc_from_branch => pc_from_branch_temp3,
        instruction_out => instruction_out_temp1,
        pc_plus4_out => pc_plus4_out_temp1
    );

    decode_pipe : Decode_Pipeline port map(
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
        pc_plus4 => pc_plus4_out_temp1,
        instruction => instruction_out_temp1,
        write_data => write_data_out_temp5,
        reg_write_back => reg_write_back_out_temp4,

        extended_sign_out => extended_sign_out_temp2,
        function_op_out => function_op_out_temp2,
        register_target_out => register_target_out_temp2,
        register_destination_out => register_destination_out_temp2,
        reg_dst_out => reg_dst_out_temp2,
        jump_out => jump_out_temp2,
        branch_out => branch_out_temp2,
        mem_read_out => mem_read_out_temp2,
        mem_to_reg_out => mem_to_reg_out_temp2,
        mem_write_out => mem_write_out_temp2,
        alu_src_out => alu_src_out_temp2,
        reg_write_out => reg_write_out_temp2,
        
        alu_op_out => alu_op_out_temp2,
        pc_plus4_out => pc_plus4_out_temp2,
        read_data1_out => read_data1_out_temp2,
        read_data2_out => read_data2_out_temp2
    );

    excecute_pipe : MEM_EXE_PIPE port map(
        clk => clk,
        branch => branch_out_temp2,
        reg_dest => reg_dst_out_temp2,
        alu_src => alu_src_out_temp2,
        mem_read => mem_read_out_temp2,
        mem_write => mem_write_out_temp2,
        alu_op => alu_op_out_temp2,
        mem_to_reg => mem_to_reg_out_temp2,
        reg_write => reg_write_out_temp2,
        pc_out_in => pc_plus4_out_temp2,
        alu_shamt => "00000",
        read_data_1 => read_data1_out_temp2,
        read_data_2 => read_data2_out_temp2,
        sign_extended => extended_sign_out_temp2,
        function_op => function_op_out_temp2,
        reg_target => register_target_out_temp2,
        reg_destination => register_destination_out_temp2,

        reg_write_back => reg_write_back_temp3,
        read_data_2_out => read_data_2_out_temp3,
        alu_result_out  => alu_result_out_temp3,
        pc_from_branch  => pc_from_branch_temp3,
        pc_src_selector => pc_src_selector_temp3,
        mem_read_out    => mem_read_out_temp3,
        mem_to_reg_out  => mem_to_reg_out_temp3,
        reg_write_out   => reg_write_out_temp3,
        mem_write_out   => mem_write_out_temp3
    );

    memory_pipe : MEM_WB_PIPE port map(
        clk => clk,
        mem_to_reg => mem_to_reg_out_temp3,
        reg_write => reg_write_out_temp3,
        mem_read => mem_read_out_temp3,
        mem_write => mem_write_out_temp3, 
        alu_result => alu_result_out_temp3,
        read_data_2 => read_data_2_out_temp3,
        reg_write_back => reg_write_back_temp3,

        reg_write_out => reg_write_out_temp4,
        mem_to_reg_out => mem_to_reg_out_temp4,
        alu_result_out => alu_result_out_temp4,
        reg_write_back_out => reg_write_back_out_temp4,
        read_data => read_data_temp4
    );

    w_b : Write_Back port map(
        mem_read_data => read_data_temp4,
        alu_result => alu_result_out_temp4,
        mem_to_reg => mem_to_reg_out_temp4,

        write_data => write_data_out_temp5
    );

end Behavioral;
        
    