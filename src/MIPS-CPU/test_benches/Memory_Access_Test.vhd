--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:58:07 05/21/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Mips6/Mix/Memory_Access_Test.vhd
-- Project Name:  Mix
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory_Access
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
 
ENTITY Memory_Access_Test IS
END Memory_Access_Test;
 
ARCHITECTURE behavior OF Memory_Access_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_Access
    PORT(
         clk : IN  std_logic;
         mem_access_addr : IN  std_logic_vector(31 downto 0);
         mem_write_data : IN  std_logic_vector(31 downto 0);
         mem_write_en : IN  std_logic;
         mem_read : IN  std_logic;
         mem_read_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal mem_access_addr : std_logic_vector(31 downto 0) := (others => '0');
   signal mem_write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal mem_write_en : std_logic := '0';
   signal mem_read : std_logic := '0';

 	--Outputs
   signal mem_read_data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_Access PORT MAP (
          clk => clk,
          mem_access_addr => mem_access_addr,
          mem_write_data => mem_write_data,
          mem_write_en => mem_write_en,
          mem_read => mem_read,
          mem_read_data => mem_read_data
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
      wait for 50 ns;	
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFFFFFF";
		mem_write_en<='0';
		mem_read<='0';
      wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF0002";
		mem_write_en<='1';
		mem_read<='0';
      wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF1000";
		mem_write_en<='0';
		mem_read<='1';
		wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF1000";
		mem_write_en<='1';
		mem_read<='1';
		wait for clk_period*5;
		mem_access_addr<=X"00000002";
		mem_write_data<=X"FFFF1000";
		mem_write_en<='1';
		mem_read<='0';
		wait for clk_period*5;
		mem_access_addr<=X"00000002";
		mem_write_data<=X"FFFF1000";
		mem_write_en<='0';
		mem_read<='1';
		wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF1000";
		mem_write_en<='0';
		mem_read<='1';
		wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF1023";
		mem_write_en<='1';
		mem_read<='0';
		wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF1023";
		mem_write_en<='0';
		mem_read<='0';
		wait for clk_period*5;
		mem_access_addr<=X"00000001";
		mem_write_data<=X"FFFF1023";
		mem_write_en<='0';
		mem_read<='1';
		wait for clk_period*5;
      -- insert stimulus here 

      wait;
   end process;

END;
