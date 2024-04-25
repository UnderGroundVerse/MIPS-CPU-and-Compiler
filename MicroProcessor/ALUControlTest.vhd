--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:38:22 04/25/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Project/MicroProcessor/ALUControlTest.vhd
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
 
ENTITY ALUControlTest IS
END ALUControlTest;
 
ARCHITECTURE behavior OF ALUControlTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AluControlUnit
    PORT(
         alu_control_out : OUT  std_logic_vector(2 downto 0);
         function_op : IN  std_logic_vector(5 downto 0);
         alu_op : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal function_op : std_logic_vector(5 downto 0);
   signal alu_op : std_logic_vector(5 downto 0) ;

 	--Outputs
   signal alu_control_out : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AluControlUnit PORT MAP (
          alu_control_out => alu_control_out,
          function_op => function_op,
          alu_op => alu_op
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin	
	wait for 100 ns;
		alu_op<="000000";
		function_op<="000000";	
      -- hold reset state for 100 ns.
      wait for 300 ns;	

      alu_op<="000000";
		wait for 50 ns;
		function_op<="100000";
 wait for 300 ns;	
 
 

      wait;
   end process;

END;
