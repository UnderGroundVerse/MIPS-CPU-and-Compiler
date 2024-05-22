--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:38:21 05/22/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Mips10/Gips/AbdoBench.vhd
-- Project Name:  Gips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegFile
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
 
ENTITY AbdoBench IS
END AbdoBench;
 
ARCHITECTURE behavior OF AbdoBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegFile
    PORT(
         regWrite : IN  std_logic;
         read_reg1 : IN  std_logic_vector(4 downto 0);
         read_reg2 : IN  std_logic_vector(4 downto 0);
         write_reg : IN  std_logic_vector(4 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         read_data1 : OUT  std_logic_vector(31 downto 0);
         read_data2 : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal regWrite : std_logic := '0';
   signal read_reg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_reg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal read_data1 : std_logic_vector(31 downto 0);
   signal read_data2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegFile PORT MAP (
          regWrite => regWrite,
          read_reg1 => read_reg1,
          read_reg2 => read_reg2,
          write_reg => write_reg,
          write_data => write_data,
          read_data1 => read_data1,
          read_data2 => read_data2,
          clk => clk,
          rst => rst
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
      wait for 5 ns;	
		regWrite<='1';
		read_reg1<="00001";
		read_reg2<="00010";
		write_reg<="00001";
		write_data<=X"AFFFFF12";
      wait for 10 ns;
		regWrite<='1';
		read_reg1<="00000";
		read_reg2<="00001";
		write_reg<="00001";
		write_data<=X"AF000012";
      wait for 10 ns;
		regWrite<='0';
		read_reg1<="00000";
		read_reg2<="00001";
		write_reg<="00001";
		write_data<=X"AF000012";
      wait for 10 ns;
		regWrite<='0';
		read_reg1<="00000";
		read_reg2<="00000";
		write_reg<="00001";
		write_data<=X"AF000012";
      wait for 10 ns;
		regWrite<='1';
		read_reg1<="00000";
		read_reg2<="00000";
		write_reg<="00000";
		write_data<=X"AF000012";
      wait for 10 ns;
		regWrite<='0';
		read_reg1<="00000";
		read_reg2<="00001";
		write_reg<="00001";
		write_data<=X"AF00FD12";
      wait for 10 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
