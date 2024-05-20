library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Excecute_Address is
    port(
        read_data1, read_data2, extended_sign, pc_plus4 : in std_logic_vector(31 downto 0);
        alu_src, clk : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        function_op : in std_logic_vector(5 downto 0);
        alu_shamt : in std_logic_vector(4 downto 0);
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

    alu_component : AlUComponent generic map(p => 2, c=>6, n=>32)
    port map(
        alu_op => alu_op,
        alu_zero => alu_zero,
        alu_out => alu_result,
        function_op => function_op,
        alu_shamt => alu_shamt,
        operand1 => read_data1,
        operand2 => mux_out_alu_in,
        clk => clk
    );

end Behavioral;