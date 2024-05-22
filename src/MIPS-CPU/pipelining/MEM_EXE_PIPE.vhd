----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:33 05/21/2024 
-- Design Name: 
-- Module Name:    MEM_EXE_PIPE - Behavioral 
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

entity MEM_EXE_PIPE is
port
(	
	clk : in std_logic;
	branch,reg_dest,alu_src,mem_read,mem_write : in std_logic ;
	alu_op      : in std_logic_vector (1 downto 0);
	mem_to_reg  :in std_logic;
	reg_write : in std_logic;
	pc_out_in    : in std_logic_vector (31 downto 0);
	alu_shamt : in std_logic_vector(4 downto 0);
	read_data_1,read_data_2  : in std_logic_vector (31 downto 0);
	sign_extended  : in std_logic_vector (31 downto 0);
	function_op    : in std_logic_vector (5 downto 0);
	reg_target,reg_destination :in std_logic_vector(4 downto 0);
	reg_write_back : out std_logic_vector (4 downto 0);
	read_data_2_out : out std_logic_vector (31 downto 0);
	alu_result_out  : out std_logic_vector (31 downto 0);
	pc_from_branch  : out std_logic_vector(31 downto 0);
	pc_src_selector : out std_logic;
	mem_read_out    : out std_logic;
	mem_to_reg_out  : out std_logic;
	reg_write_out   : out std_logic;
	mem_write_out   : out std_logic
);
end MEM_EXE_PIPE;

architecture Behavioral of MEM_EXE_PIPE is


component Excecute_Address is
    port(
        read_data1, read_data2, extended_sign, pc_plus4 : in std_logic_vector(31 downto 0);
        alu_src, reg_dst, branch, clk : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        function_op : in std_logic_vector(5 downto 0);
        alu_shamt : in std_logic_vector(4 downto 0); 
        register_target, register_destination : in std_logic_vector(4 downto 0);
        pc_src_selector : out std_logic;
        reg_write_back : out std_logic_vector(4 downto 0);
        pc_from_branch, alu_result : out std_logic_vector(31 downto 0)
    
    );
end component;


	component EX_MEM is
		port(
        mem_read, mem_to_reg, mem_write : in std_logic;
		  reg_write  : in std_logic ;
		  pc_from_branch : in std_logic_vector   (31 downto 0);
		  pc_src_selector : in std_logic;
		  reg_write_back : in std_logic_vector (4 downto 0);
        alu_result : in std_logic_vector(31 downto 0);
        read_data2 : in std_logic_vector(31 downto 0);
        clk : in std_logic;
        mem_read_out, mem_to_reg_out, mem_write_out : out std_logic;
        alu_result_out : out std_logic_vector(31 downto 0);
		  reg_write_out  : out std_logic;
		  pc_from_branch_out : out std_logic_vector   (31 downto 0);
		  pc_src_selector_out: out std_logic;
		  reg_write_back_out : out std_logic_vector (4 downto 0);
        read_data2_out : out std_logic_vector(31 downto 0)
    );
end component;

	signal reg_write_back_temp : std_logic_vector (4 downto 0);
	signal alu_result_temp  : std_logic_vector (31 downto 0);
	signal pc_from_branch_temp : std_logic_vector (31 downto 0);
	signal pc_src_selector_temp   : std_logic;
begin

temp : EX_MEM port map (
		 clk=>clk,
		 mem_read=>mem_read,
		 mem_to_reg=>mem_to_reg,
		 mem_write=>mem_write,
		 reg_write=>reg_write,
		 reg_write_back=>reg_write_back_temp,
		 alu_result=>alu_result_temp,
		 read_data2=>read_data_2,
		 mem_read_out=>mem_read_out,
		 mem_to_reg_out=>mem_to_reg_out,
		 mem_write_out=>mem_write_out,
		 alu_result_out=>alu_result_out,
		 reg_write_out=>reg_write_out,
		 reg_write_back_out=>reg_write_back,
		 read_data2_out=>read_data_2_out,
		 pc_from_branch=>pc_from_branch_temp,
		 pc_src_selector=>pc_src_selector_temp,
		 pc_from_branch_out=>pc_from_branch,
		 pc_src_selector_out=>pc_src_selector
		 
);


execute_address : Excecute_Address port map (
		clk=>clk,
		read_data1=>read_data_1,
		read_data2=>read_data_2,
		extended_sign=>sign_extended,
		pc_plus4=>pc_out_in,
		alu_op=>alu_op,
		alu_src=>alu_src,
		reg_dst=>reg_dest,
		branch=>branch,
		function_op=>function_op,
		alu_shamt=>alu_shamt,
		register_target=>reg_target,
		register_destination=>reg_destination,
		pc_src_selector=>pc_src_selector_temp,
		reg_write_back=>reg_write_back_temp,
		pc_from_branch=>pc_from_branch_temp,
		alu_result=>alu_result_temp
);

end Behavioral;

