--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:55:42 04/25/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Project/MicroProcessor/cvcvc.vhd
-- Project Name:  MicroProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AluControlUnit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cvcvc IS
END cvcvc;
 
ARCHITECTURE behavior OF cvcvc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AluControlUnit
    PORT(
         alu_control_out : OUT  std_logic_vector(2 downto 0);
         function_op : IN  std_logic_vector(5 downto 0);
         alu_op : IN  std_logic_vector(5 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal function_op : std_logic_vector(5 downto 0) := (others => '0');
   signal alu_op : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal alu_control_out : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AluControlUnit PORT MAP (
          alu_control_out => alu_control_out,
          function_op => function_op,
          alu_op => alu_op,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		function_op<= "100000";
		alu_op	  <= "000000";
      wait for clk_period*10;
		function_op<= "100000";
		alu_op	  <= "000000";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
