--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:22:36 05/21/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/MipsTest/Mipsus/zqa.vhd
-- Project Name:  Mipsus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Instruction_Fetch
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
 
ENTITY zqa IS
END zqa;
 
ARCHITECTURE behavior OF zqa IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instruction_Fetch
    PORT(
         clk : IN  std_logic;
         jump : IN  std_logic;
         pc_src_selector : IN  std_logic;
         pc_from_branch : IN  std_logic_vector(31 downto 0);
         pc_from_jump : IN  std_logic_vector(31 downto 0);
         pc_out : INOUT  std_logic_vector(31 downto 0);
         instruction_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal jump : std_logic := '0';
   signal pc_src_selector : std_logic := '0';
   signal pc_from_branch : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_from_jump : std_logic_vector(31 downto 0) := (others => '0');

	--BiDirs
   signal pc_out : std_logic_vector(31 downto 0);

 	--Outputs
   signal instruction_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instruction_Fetch PORT MAP (
          clk => clk,
          jump => jump,
          pc_src_selector => pc_src_selector,
          pc_from_branch => pc_from_branch,
          pc_from_jump => pc_from_jump,
          pc_out => pc_out,
          instruction_out => instruction_out
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
   pc_from_branch<=X"62223200";
	  pc_src_selector<='1';
	  jump<='0';
      wait for clk_period*10;
   pc_from_branch<=X"62223200";
	  pc_src_selector<='1';
	  jump<='0';
      wait for clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
