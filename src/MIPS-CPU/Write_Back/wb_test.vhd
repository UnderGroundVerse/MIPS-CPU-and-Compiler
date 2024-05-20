--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:49:35 05/20/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Mips4/Mips/mem_wb_test.vhd
-- Project Name:  Mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Write_back
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
 
ENTITY wb_test IS
END wb_test;
 
ARCHITECTURE behavior OF wb_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Write_back
    PORT(
         mem_read_data : IN  std_logic_vector(31 downto 0);
         alu_result : IN  std_logic_vector(31 downto 0);
         mem_to_reg : IN  std_logic;
         write_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mem_read_data : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_result : std_logic_vector(31 downto 0) := (others => '0');
   signal mem_to_reg : std_logic := '0';

 	--Outputs
   signal write_data : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Write_back PORT MAP (
          mem_read_data => mem_read_data,
          alu_result => alu_result,
          mem_to_reg => mem_to_reg,
          write_data => write_data
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

    mem_read_data<=X"ff231210";
	 alu_result<=X"aa221131";
	 mem_to_reg<='1';
 wait for 100 ns;	
 mem_read_data<=X"ff231210";
	 alu_result<=X"aa221131";
	 mem_to_reg<='0';
 wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
