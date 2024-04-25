--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:50:58 04/24/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Project/MicroProcessor/alu_test.vhd
-- Project Name:  MicroProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         alu_control : IN  std_logic_vector(2 downto 0);
         alu_out : OUT  std_logic_vector(31 downto 0);
         operand1 : IN  std_logic_vector(31 downto 0);
         operand2 : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal alu_control : std_logic_vector(2 downto 0) := (others => '0');
   signal operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal alu_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          alu_control => alu_control,
          alu_out => alu_out,
          operand1 => operand1,
          operand2 => operand2
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		alu_control<="010";
		operand1<=X"13012121";
		operand2<=X"13012221";
      wait for 100 ns;	
alu_control<="010";
		operand1<=X"13012121";
		operand2<=X"13012221";
     wait for 100 ns;	
		alu_control<="001";
		operand1<=X"13012121";
		operand2<=X"13012221";
     wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
