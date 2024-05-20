--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:14 05/20/2024
-- Design Name:   
-- Module Name:   C:/Users/mo/Desktop/Mips4/Mips/mem_access_testreal.vhd
-- Project Name:  Mips
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
 
ENTITY mem_access_testreal IS
END mem_access_testreal;
 
ARCHITECTURE behavior OF mem_access_testreal IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_Access
    PORT(
         alu_zero : IN  std_logic;
         branch : IN  std_logic;
         jump : IN  std_logic;
         clk : IN  std_logic;
         mem_access_addr : IN  std_logic_vector(31 downto 0);
         mem_write_data : IN  std_logic_vector(31 downto 0);
         mem_write_en : IN  std_logic;
         mem_read : IN  std_logic;
         ideal_pc : IN  std_logic_vector(31 downto 0);
         pc_from_branch : IN  std_logic_vector(31 downto 0);
         pc_from_jump : IN  std_logic_vector(31 downto 0);
         pc : OUT  std_logic_vector(31 downto 0);
         mem_read_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal alu_zero : std_logic := '0';
   signal branch : std_logic := '0';
   signal jump : std_logic := '0';
   signal clk : std_logic := '0';
   signal mem_access_addr : std_logic_vector(31 downto 0) := (others => '0');
   signal mem_write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal mem_write_en : std_logic := '0';
   signal mem_read : std_logic := '0';
   signal ideal_pc : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_from_branch : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_from_jump : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal pc : std_logic_vector(31 downto 0);
   signal mem_read_data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_Access PORT MAP (
          alu_zero => alu_zero,
          branch => branch,
          jump => jump,
          clk => clk,
          mem_access_addr => mem_access_addr,
          mem_write_data => mem_write_data,
          mem_write_en => mem_write_en,
          mem_read => mem_read,
          ideal_pc => ideal_pc,
          pc_from_branch => pc_from_branch,
          pc_from_jump => pc_from_jump,
          pc => pc,
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
      wait for 100 ns;	

      	branch<='1';
		alu_zero<='1';
		pc_from_branch<=X"F1212321";
		ideal_pc<=X"AAd21123";
		pc_from_jump<=X"A32121FF";
		jump<='1';
		 mem_access_addr <=(others =>'0');
        mem_write_data <=(others =>'0');
         mem_write_en <='0';
         mem_read <='0';
      wait for clk_period*10;
		branch<='0';
		alu_zero<='1';
		pc_from_branch<=X"F1212321";
		ideal_pc<=X"AAd21123";
		pc_from_jump<=X"A32121FF";
		jump<='0';
		 mem_access_addr <=(others =>'0');
        mem_write_data <=(others =>'0');
         mem_write_en <='0';
         mem_read <='0';
      wait for clk_period*10;
			branch<='0';
		alu_zero<='0';
		pc_from_branch<=X"F1212321";
		ideal_pc<=X"AAd21123";
		pc_from_jump<=X"A32121FF";
		jump<='1';
		 mem_access_addr <=(others =>'0');
        mem_write_data <=(others =>'0');
         mem_write_en <='0';
         mem_read <='0';
      wait for clk_period*10;
		      	branch<='1';
		alu_zero<='1';
		pc_from_branch<=X"F1212321";
		ideal_pc<=X"AAd21123";
		pc_from_jump<=X"A32121FF";
		jump<='0';
		 mem_access_addr <=(others =>'0');
        mem_write_data <=(others =>'0');
         mem_write_en <='0';
         mem_read <='0';
      wait for clk_period*10;


      -- insert stimulus here 

      wait;
   end process;

END;
