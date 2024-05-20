library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Excecute_Address is
    port(
        read_data1, read_data2, extended_sign, pc : in std_logic_vector(31 downto 0);
        alu_src, alu_op, clk : in std_logic;
        function_op : in std_logic_vector(5 downto 0);
        pc_out, alu_result : out std_logic_vector(31 downto 0);
    );
end Excecute_Address;


architecture Behvioral of Excecute_Address is
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