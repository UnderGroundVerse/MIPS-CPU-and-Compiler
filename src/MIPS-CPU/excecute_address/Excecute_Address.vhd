library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Excecute_Address is
    port(
        read_data1, read_data2, extended_sign, pc_plus4 : in std_logic_vector(31 downto 0);
        alu_src, reg_dst, branch, clk : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        function_op : in std_logic_vector(5 downto 0);
        alu_shamt : in std_logic_vector(4 downto 0);
        register_target, register_destination : in std_logic_vector(4 downto 0);
        pc_src_selector : out std_logic;
        reg_write_back : out std_logic_vector(4 downto 0);
        pc_from_branch, alu_result : out std_logic_vector(31 downto 0);
        alu_zero : out std_logic
    );
end Excecute_Address;


architecture Behavioral of Excecute_Address is
    component AlUComponent is
        generic(
         p : integer := 2;
         c : integer := 6; 
         n : integer := 32);
         
        port(
            alu_op : in std_logic_vector(p-1 downto 0);
            alu_src : in std_logic;
            alu_zero : out std_logic;
            alu_out : out std_logic_vector (n-1 downto 0);
            function_op : in std_logic_vector(c-1 downto 0);
            alu_shamt:in std_logic_vector (4 downto 0) :=(others=>'0');
            operand1,operand2 : in std_logic_vector(n-1 downto 0);
            clk: in std_logic
            );
        
    end component;

    component Mux2x1 is
        generic(
            n : integer := 32
        );
        port(
            input0, input1 : in std_logic_vector(n-1 downto 0);
            selector : in std_logic;
            mux_out : out std_logic_vector(n-1 downto 0) 
        );
    
    end component;

    signal mux_out_alu_in : std_logic_vector(31 downto 0);
    signal pc_from_branch_temp : std_logic_vector(31 downto 0);
    signal alu_zero_temp : std_logic;
begin

    pc_from_branch_temp <= std_logic_vector(shift_left(unsigned(extended_sign), 2));
    pc_from_branch <= std_logic_vector(unsigned(pc_from_branch_temp) + unsigned(pc_plus4));



    mux : Mux2x1 generic map(n => 32)
    port map(
        input0 => read_data2,
        input1 => extended_sign,
        selector => alu_src,
        mux_out => mux_out_alu_in
    );

    Reg_Dst_Address_mux : Mux2x1 generic map(n => 5)
    port map(
        input0 => register_target,
        input1 => register_destination,
        selector => reg_dst,
        mux_out => reg_write_back
    ); 

    alu_component : AlUComponent generic map(p => 2, c=>6, n=>32)
    port map(
        alu_op => alu_op,
        alu_src => alu_src,
        alu_zero => alu_zero_temp,
        alu_out => alu_result,
        function_op => function_op,
        alu_shamt => alu_shamt,
        operand1 => read_data1,
        operand2 => mux_out_alu_in,
        clk => clk
    );

    pc_src_selector <= alu_zero_temp and branch;
    alu_zero <= alu_zero_temp;

end Behavioral;