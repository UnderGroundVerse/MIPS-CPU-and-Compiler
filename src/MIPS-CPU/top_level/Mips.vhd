----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:47 05/22/2024 
-- Design Name: 
-- Module Name:    Mips - Behavioral 
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

entity Mips is
port  (
	clk : in std_logic;
		  
		  instruction_out_1 : out std_logic_vector(31 downto 0);
        pc_plus4_out_1 : out std_logic_vector(31 downto 0);
        extended_sign_out_2 : out std_logic_vector(31 downto 0);
        function_op_out_2 : out std_logic_vector(5 downto 0);
        register_target_out_2, register_destination_out_2 : out std_logic_vector(4 downto 0);
        reg_dst_out_2, jump_out_2, branch_out_2
		  , mem_read_out_2, mem_to_reg_out_2
		  , mem_write_out_2,
		  alu_src_out_2, reg_write_out_2 : out std_logic;
        alu_op_out_2 : out std_logic_vector(1 downto 0);
        pc_plus4_out_2 : out std_logic_vector(31 downto 0);
        read_data1_out_2, read_data2_out_2 : out std_logic_vector(31 downto 0);

        reg_write_back_3 : out std_logic_vector (4 downto 0);
        read_data_2_out_3 : out std_logic_vector (31 downto 0);
        alu_result_out_3  : out std_logic_vector (31 downto 0);
        pc_from_branch_3  : out std_logic_vector(31 downto 0);
        pc_src_selector_3 : out std_logic;
        mem_read_out_3    : out std_logic;
        mem_to_reg_out_3  : out std_logic;
        reg_write_out_3   : out std_logic;
        mem_write_out_3   : out std_logic;

        reg_write_out_4,mem_to_reg_out_4  : out std_logic ;
        alu_result_out_4  : out std_logic_vector (31 downto 0);
        reg_write_back_out_4 : out std_logic_vector (4 downto 0);
        read_data_4 :  out std_logic_vector (31 downto 0);

        write_data_out_5 : out std_logic_vector(31 downto 0);

        stall : out std_logic
	
);


end Mips;




architecture Behavioral of Mips is


component Control_Unit is
	port (
	opcode: in std_logic_vector(5 downto 0);
	
	alu_op: out std_logic_vector(1 downto 0);
   mem_to_reg
	,reg_dst,jump,branch,mem_read,mem_write,alu_src,reg_write: out std_logic;
   clk : in std_logic;

   stall : std_logic
 );

end component;




component Data_Path is
    port(
        clk : in std_logic;
        alu_op : in std_logic_vector(1 downto 0);
        mem_to_reg, reg_dst, jump, branch, mem_read, mem_write, alu_src, reg_write : in std_logic;
        
        instruction_out_1 : out std_logic_vector(31 downto 0);
        pc_plus4_out_1 : out std_logic_vector(31 downto 0);

        extended_sign_out_2 : out std_logic_vector(31 downto 0);
        function_op_out_2 : out std_logic_vector(5 downto 0);
        register_target_out_2, register_destination_out_2 : out std_logic_vector(4 downto 0);
        reg_dst_out_2, jump_out_2, branch_out_2, mem_read_out_2, mem_to_reg_out_2, mem_write_out_2, alu_src_out_2, reg_write_out_2 : out std_logic;
        alu_op_out_2 : out std_logic_vector(1 downto 0);
        pc_plus4_out_2 : out std_logic_vector(31 downto 0);
        read_data1_out_2, read_data2_out_2 : out std_logic_vector(31 downto 0);

        reg_write_back_3 : out std_logic_vector (4 downto 0);
        read_data_2_out_3 : out std_logic_vector (31 downto 0);
        alu_result_out_3  : out std_logic_vector (31 downto 0);
        pc_from_branch_3  : out std_logic_vector(31 downto 0);
        pc_src_selector_3 : out std_logic;
        mem_read_out_3    : out std_logic;
        mem_to_reg_out_3  : out std_logic;
        reg_write_out_3   : out std_logic;
        mem_write_out_3   : out std_logic;

        reg_write_out_4,mem_to_reg_out_4  : out std_logic ;
        alu_result_out_4  : out std_logic_vector (31 downto 0);
        reg_write_back_out_4 : out std_logic_vector (4 downto 0);
        read_data_4 :  out std_logic_vector (31 downto 0);

        write_data_out_5 : out std_logic_vector(31 downto 0);

        stall : in std_logic
    );
end component;

component hazard_detection_unit is
   port
   (
      reg_target_ID_EX, reg_destination_ID_EX, reg_source_IF_ID, reg_target_IF_ID, reg_write_back_EX_MEM : in std_logic_vector(4 downto 0);
      
      mem_to_reg_ID_EX, mem_to_reg_EX_MEM: in std_logic; 
      
      branch : in std_logic; 
      
      alu_src_ID, alu_src_ID_EX : in std_logic;
      
      reg_write_ID,reg_write_ID_EX : in std_logic; 
      
      stall : out std_logic 
   );
end component;

signal instruction_out_1_temp : std_logic_vector (31 downto 0);
signal alu_op_temp : std_logic_vector (1 downto 0);
signal mem_to_reg_temp : std_logic;
signal reg_dst_temp : std_logic;
signal jump_temp : std_logic;
signal branch_temp : std_logic;
signal mem_read_temp : std_logic;
signal mem_write_temp : std_logic;
signal alu_src_temp : std_logic;
signal reg_write_temp : std_logic;

signal register_target_out_2_temp, register_destination_out_2_temp : std_logic_vector(4 downto 0);
signal mem_to_reg_out_2_temp, mem_to_reg_out_3_temp, alu_src_out_2_temp, reg_write_out_2_temp: std_logic;
signal reg_write_back_3_temp : std_logic_vector(4 downto 0);

signal stall_temp : std_logic;

begin

   stall <= stall_temp;

   register_target_out_2 <= register_target_out_2_temp;
   register_destination_out_2 <= register_destination_out_2_temp;
   mem_to_reg_out_2 <= mem_to_reg_out_2_temp;
   mem_to_reg_out_3 <= mem_to_reg_out_3_temp;
   alu_src_out_2 <= alu_src_out_2_temp;
   reg_write_out_2 <= reg_write_out_2_temp;
   reg_write_back_3 <= reg_write_back_3_temp;


hazard_detection : hazard_detection_unit port map(
   reg_target_ID_EX => register_target_out_2_temp,
   reg_destination_ID_EX => register_destination_out_2_temp,
   reg_source_IF_ID => instruction_out_1_temp(25 downto 21),
   reg_target_IF_ID => instruction_out_1_temp(20 downto 16), 
   reg_write_back_EX_MEM => reg_write_back_3_temp,
      
   mem_to_reg_ID_EX => mem_to_reg_out_2_temp, 
   mem_to_reg_EX_MEM => mem_to_reg_out_3_temp,  
      
   branch  => branch_temp,
      
   alu_src_ID => alu_src_temp,
   alu_src_ID_EX => alu_src_out_2_temp,
      
   reg_write_ID => reg_write_temp,
   reg_write_ID_EX => reg_write_out_2_temp,
      
   stall  => stall_temp
);


d_path : Data_Path port map (
	clk=>clk,
	alu_op=>alu_op_temp,
	mem_to_reg=>mem_to_reg_temp,
	reg_dst=>reg_dst_temp,
	jump=>jump_temp,
	branch=>branch_temp,
	mem_read=>mem_read_temp,
	mem_write=>mem_write_temp,
	alu_src=>alu_src_temp,
	reg_write=>reg_write_temp,
	instruction_out_1=>instruction_out_1_temp,
	pc_plus4_out_1=>pc_plus4_out_1,
	extended_sign_out_2=>extended_sign_out_2, 
   function_op_out_2=>function_op_out_2, 
   register_target_out_2=>register_target_out_2_temp, 
	register_destination_out_2=>register_destination_out_2_temp, 
   reg_dst_out_2=>reg_dst_out_2,
	jump_out_2=>jump_out_2, 
	branch_out_2=>branch_out_2, 
	mem_read_out_2=>mem_read_out_2, 
	mem_to_reg_out_2=>mem_to_reg_out_2_temp, 
	mem_write_out_2=>mem_write_out_2, 
	alu_src_out_2=>alu_src_out_2_temp, 
	reg_write_out_2=>reg_write_out_2_temp, 
   alu_op_out_2=>alu_op_out_2,
   pc_plus4_out_2=>pc_plus4_out_2,
   read_data1_out_2=>read_data1_out_2,
   read_data2_out_2=>read_data2_out_2 ,
	reg_write_back_3=>reg_write_back_3_temp,
   read_data_2_out_3=>read_data_2_out_3,
   alu_result_out_3=>alu_result_out_3,
   pc_from_branch_3=>pc_from_branch_3,
   pc_src_selector_3=>pc_src_selector_3, 
   mem_read_out_3=>mem_read_out_3,
   mem_to_reg_out_3=>mem_to_reg_out_3_temp,
   reg_write_out_3=>reg_write_out_3,
   mem_write_out_3=>mem_write_out_3,  
   reg_write_out_4=>reg_write_out_4,
	mem_to_reg_out_4=>mem_to_reg_out_4, 
   alu_result_out_4=>alu_result_out_4, 
   reg_write_back_out_4=>reg_write_back_out_4, 
   read_data_4=>read_data_4, 
   write_data_out_5=>write_data_out_5,
	
	stall => stall_temp
);


c_unit : Control_Unit port map (
	clk=>clk,
	alu_op=>alu_op_temp,
	opcode=>instruction_out_1_temp(31 downto 26),
	mem_to_reg=>mem_to_reg_temp,
	reg_dst=>reg_dst_temp,
	jump=>jump_temp,
	branch=>branch_temp,
	mem_read=>mem_read_temp,
	mem_write=>mem_write_temp,
	alu_src=>alu_src_temp,
	reg_write=>reg_write_temp,
   stall => stall_temp
 );

instruction_out_1<=instruction_out_1_temp;

end Behavioral;

