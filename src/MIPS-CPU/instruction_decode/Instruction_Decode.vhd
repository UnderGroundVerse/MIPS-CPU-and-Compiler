library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Instruction_Decode is
    port(
        clk, rst, reg_write: in std_logic;
        pc : in std_logic_vector(31 downto 0);
        instruction : in std_logic_vector(31 downto 0);
        write_data : in std_logic_vector(31 downto 0);
        reg_write_back : in std_logic_vector(4 downto 0);
        read_data1, read_data2 : out std_logic_vector(31 downto 0);
        extended_sign : out std_logic_vector(31 downto 0);
        function_op : out std_logic_vector(5 downto 0);
        register_target, register_destination : out std_logic_vector(4 downto 0)
    );
end Instruction_Decode;

architecture Behavioral of Instruction_Decode is

    component RegFile is
        port( 
        regWrite : in std_logic ; --contol unit sent value
        read_reg1 : in std_logic_vector (4 downto 0); --address of 1'st inside array to pass it's data to alu
        read_reg2 : in std_logic_vector (4 downto 0); --address of 2'nt inside array to pass it's data to alu
        write_reg : in std_logic_vector (4 downto 0); --address of reg inside array to be written on
        write_data :in std_logic_vector (31 downto 0); --The data to be written on
        read_data1 :out std_logic_vector (31 downto 0); --The data of 1'st reg to be sent to ALU
        read_data2 : out std_logic_vector (31 downto 0); --The data of 2'nd reg to be sent to ALU
        clk,rst : in std_logic
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

    component Sign_Extender is
        Port ( 
            immediate_in : in  STD_LOGIC_VECTOR (15 downto 0);
            immediate_out : out  STD_LOGIC_VECTOR (31 downto 0);
            clk : in std_logic);
                 
    end component;

begin

 

    function_op <= instruction(5 downto 0);

    register_target <= instruction(20 downto 16);
    register_destination <= instruction(15 downto 11);

    extender : Sign_Extender port map(
        immediate_in => instruction(15 downto 0),
        immediate_out => extended_sign,
        clk => clk
    );
    
    reg_file : RegFile port map(
        regWrite => reg_write,
        read_reg1 => instruction(25 downto 21),
        read_reg2 => instruction(20 downto 16),
        write_reg => reg_write_back,
        write_data => write_data,
        read_data1 => read_data1,
        read_data2 => read_data2,
        clk => clk,
        rst => rst
    );

end Behavioral;