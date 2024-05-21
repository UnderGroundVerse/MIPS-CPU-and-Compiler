library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Instruction_Fetch is
	generic(
		n : integer := 32
	);
    port(	
		clk : in std_logic;
		jump : in std_logic;
		pc_src_selector : in std_logic;
        pc_from_jump : in std_logic_vector(31 downto 0);
	    pc_from_branch  : in std_logic_vector(31 downto 0);
		pc_out          : out std_logic_vector(31 downto 0);
        instruction_out : out std_logic_vector(31 downto 0)
    );
end Instruction_Fetch;

architecture Behavioral of Instruction_Fetch is

    component Instruction_Memory_VHDL is
        generic (
            n : integer := 32  -- Number of address bits
        );
        port (
            pc: in std_logic_vector(n - 1 downto 0);
            instruction: out std_logic_vector(n - 1 downto 0)
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
	 
    component Pc_Adder is
        generic ( n: integer :=32);    
        Port ( 
            pc_in : in  STD_LOGIC_VECTOR (n-1 downto 0);    
            pc_out : out  STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;

    component Program_Counter is
        port(
            clk : in std_logic;
            pc_in : in std_logic_vector(31 downto 0);
            pc_out : out std_logic_vector(31 downto 0)
        );
    end component;
	 
signal pc_from_pcsrc1 : std_logic_vector (31 downto 0) :=(others =>'0') ;
signal pc_4 : std_logic_vector (31 downto 0) :=(others =>'0') ;
signal pc_in : std_logic_vector (31 downto 0) :=(others =>'0') ;
signal pc_temp : std_logic_vector (31 downto 0);

begin

    pc_src_branch_mux : Mux2x1 generic map (n=>32)
        port map(
        input0=>pc_4,
        input1=>pc_from_branch,
        selector=>pc_src_selector,
        mux_out=>pc_from_pcsrc1
    );
    pc_src_jump_mux : Mux2x1 generic map (n=>32)

        port map(

        input0=>pc_from_pcsrc1,
        input1=>pc_from_jump,
        selector=>jump,
        mux_out=>pc_in
    );

    p_c : Program_Counter port map(
        clk => clk,
        pc_in => pc_in,
        pc_out => pc_temp
    );

    adder : Pc_Adder generic map(n => 32)
    port map(
        pc_in => pc_temp,
        pc_out => pc_4
    );

    instruction_memory : Instruction_Memory_VHDL generic map ( n => 32)
    port map(
        pc => pc_in,
        instruction => instruction_out  
    );

    pc_out <= pc_4;
    
end Behavioral;
