library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Instruction_Fetch_tb is
end;

architecture bench of Instruction_Fetch_tb is

  component Instruction_Fetch
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
  end component;

  signal clk: std_logic;
  signal jump: std_logic;
  signal pc_src_selector: std_logic;
  signal pc_from_jump: std_logic_vector(31 downto 0);
  signal pc_from_branch: std_logic_vector(31 downto 0);
  signal pc_out: std_logic_vector(31 downto 0);
  signal instruction_out: std_logic_vector(31 downto 0) ;

begin

  -- Insert values for generic parameters !!
  uut: Instruction_Fetch generic map ( n               =>  32)
                            port map ( clk             => clk,
                                       jump            => jump,
                                       pc_src_selector => pc_src_selector,
                                       pc_from_jump    => pc_from_jump,
                                       pc_from_branch  => pc_from_branch,
                                       pc_out          => pc_out,
                                       instruction_out => instruction_out );
    clk_process :process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

  stimulus: process
  begin
  
    -- Put initialisation code here
    pc_src_selector <= '1';
    jump <= '0';
    pc_from_branch <= X"00000000";
    pc_from_jump <= X"00000000";
    wait for 10 ns;
    pc_from_branch <= X"00000001";
    wait for 10 ns;
    pc_from_branch <= X"00000002";
    wait for 10 ns;

  end process;


end;
  