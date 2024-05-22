----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:04:01 05/22/2024 
-- Design Name: 
-- Module Name:    MEM_WB_PIPE - Behavioral 
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

entity MEM_WB_PIPE is
port  (
	clk : in std_logic;
	mem_to_reg,reg_write,mem_read,mem_write : in std_logic;
	alu_result : in std_logic_vector (31 downto 0);
	read_data_2 : in std_logic_vector (31 downto 0);
	reg_write_back : in std_logic_vector (4 downto 0);
	reg_write_out,mem_to_reg_out  : out std_logic ;
	alu_result_out  : out std_logic_vector (31 downto 0);
	reg_write_back_out : out std_logic_vector (4 downto 0);
	read_data :  out std_logic_vector (31 downto 0)
);
end MEM_WB_PIPE;

architecture Behavioral of MEM_WB_PIPE is




component Memory_Access is

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
end component;



component MEM_WB is
    port(
        clk : in std_logic;
        mem_to_reg, reg_write : in std_logic;
        read_data : in std_logic_vector(31 downto 0);
        alu_result : in std_logic_vector(31 downto 0);
        reg_write_back : in std_logic_vector(4 downto 0);
        mem_to_reg_out, reg_write_out : out std_logic;
        read_data_out : out std_logic_vector(31 downto 0);
        alu_result_out : out std_logic_vector(31 downto 0);
        reg_write_back_out : out std_logic_vector(4 downto 0)
    );
end component;


signal mem_read_data_temp : std_logic_vector (31 downto 0);

begin

temp : MEM_WB port map (
		clk=>clk,
		mem_to_reg=>mem_to_reg,
		reg_write=>reg_write,
		read_data=>mem_read_data_temp,
		alu_result=>alu_result,
		reg_write_back=>reg_write_back,
		mem_to_reg_out=>mem_to_reg_out,
		reg_write_out=>reg_write_out,
		read_data_out=>read_data,
		alu_result_out=>alu_result_out,
		reg_write_back_out=>reg_write_back_out
			
);




data_memory : Memory_Access generic map (n=>32)
	port map (
		clk=>clk,
		mem_access_addr=>alu_result,
		mem_write_data=>read_data_2,
		mem_write_en=>mem_write,
		mem_read=>mem_read,
		mem_read_data=>mem_read_data_temp
	);
end Behavioral;

