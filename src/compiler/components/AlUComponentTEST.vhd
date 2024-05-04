-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AlUComponent_tb is
end;

architecture bench of AlUComponent_tb is

  component AlUComponent
  generic(
   c : integer := 6; 
   n : integer := 32;
	p : integer := 2
	);
  port(
  	alu_op : in std_logic_vector(p-1 downto 0);
  	alu_out : out std_logic_vector (n-1 downto 0);
  	function_op : in std_logic_vector(c-1 downto 0);
  	operand1,operand2 : in std_logic_vector(n-1 downto 0);
  	clk: in std_logic
  	);
  end component;

  signal alu_op: std_logic_vector(1 downto 0);
  signal alu_out: std_logic_vector (31 downto 0);
  signal function_op: std_logic_vector(5 downto 0);
  signal operand1,operand2: std_logic_vector(31 downto 0);
  signal clk: std_logic ;
	constant clk_period : time := 10 ns;
begin

  -- Insert values for generic parameters !!
  uut: AlUComponent generic map ( c           =>6 ,
                                  n           => 32,
											 p           => 2)
                       port map ( alu_op      => alu_op,
                                  alu_out     => alu_out,
                                  function_op => function_op,
                                  operand1    => operand1,
                                  operand2    => operand2,
                                  clk         => clk );
											 
	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

  stimulus: process
  begin
  
    -- Put initialisation code here
 wait for 100 ns;	
		function_op<= "100000";
		alu_op	  <= "00";
		operand1<=X"13012121";
		operand2<=X"13012221";
      wait for clk_period*5;
		function_op<= "100000";
		alu_op	  <= "10";
		operand1<=X"0000000a";
		operand2<=X"0000000b";
      wait for clk_period*5;
		function_op<= "011000";
		alu_op	  <= "10";
		operand1<=X"0000AAAA";
		operand2<=X"00001111";
      wait for clk_period*5;

    -- Put test bench stimulus code here

    wait;
  end process;


end;