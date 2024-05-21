library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity Fetch_Pipeline is
    port(
        clk : in std_logic;
		jump : in std_logic;
		pc_src_selector : in std_logic;
	    pc_from_branch  : in std_logic_vector(31 downto 0);
		instruction_out : out std_logic_vector(31 downto 0);
        pc_plus4_out : out std_logic_vector(31 downto 0)
    );
end Fetch_Pipeline;

architecture Behavioral of Fetch_Pipeline is

    component Instruction_Fetch is
        generic(
            n : integer := 32
        );
        port(	
            clk : in std_logic;
            jump : in std_logic;
            pc_src_selector : in std_logic;
            pc_from_branch  : in std_logic_vector(31 downto 0);
            pc_out          : out std_logic_vector(31 downto 0);
            instruction_out : out std_logic_vector(31 downto 0)
        );
    end component;
    component IF_ID is
        port(
            instruction_in : in std_logic_vector(31 downto 0);
            pc_plus4_in : in std_logic_vector(31 downto 0);
            clk : in std_logic;
            instruction_out : out std_logic_vector(31 downto 0);
            pc_plus4_out : out std_logic_vector(31 downto 0)
        );
    end component;

    signal pc_out_temp          : std_logic_vector(31 downto 0);
    signal instruction_out_temp : std_logic_vector(31 downto 0);

begin
    inst_fetch : Instruction_Fetch generic map(n => 32)
    port map(
        clk => clk,
        jump => jump,
        pc_src_selector => pc_src_selector,
        pc_from_branch => pc_from_branch,
        pc_out => pc_out_temp,
        instruction_out => instruction_out_temp
    );

    temp : IF_ID
    port map(
        clk => clk,
        instruction_in => instruction_out_temp,
        pc_plus4_in => pc_out_temp,
        instruction_out => instruction_out,
        pc_plus4_out => pc_plus4_out
    );

end Behavioral;
