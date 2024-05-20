----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:47:32 05/20/2024 
-- Design Name: 
-- Module Name:    Memory_Access - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory_Access is

	generic 
	(	
		n: integer := 32
	);
	port
	(
    
	 clk             : in std_logic;
    mem_access_addr : in std_logic_vector( n - 1 downto 0);
    mem_write_data  : in std_logic_vector( n - 1 downto 0);
    mem_write_en    : in std_logic;
    mem_read        : in std_logic;
    mem_read_data   : out std_logic_vector(n- 1 downto 0)
  );
end Memory_Access;

architecture Behavioral of Memory_Access is

component Data_Memory_VHDL is
 generic (
    n : integer := 32  -- Number of bits for address
  );
  port (
    clk             : in std_logic;
    mem_access_addr : in std_logic_vector( n - 1 downto 0);
    mem_write_data  : in std_logic_vector(n - 1 downto 0);
    mem_write_en    : in std_logic;
    mem_read        : in std_logic;
    mem_read_data   : out std_logic_vector(n- 1 downto 0)
  );
end component;
	

begin

pc_src_selector<= branch and alu_zero;

data_memory : Data_Memory_VHDL generic map(n => 32)
port map(
clk=>clk,
mem_access_addr=>mem_access_addr,
mem_write_en=>mem_write_en,
mem_write_data=>mem_write_data,
mem_read=>mem_read,
mem_read_data=>mem_read_data
);





end Behavioral;

