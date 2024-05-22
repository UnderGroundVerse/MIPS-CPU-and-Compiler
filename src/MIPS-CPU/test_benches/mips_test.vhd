-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Mips_tb is
end;

architecture bench of Mips_tb is

  component Mips
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
          write_data_out_5 : out std_logic_vector(31 downto 0)
  );
  end component;

  signal clk: std_logic;
  signal instruction_out_1: std_logic_vector(31 downto 0);
  signal pc_plus4_out_1: std_logic_vector(31 downto 0);
  signal extended_sign_out_2: std_logic_vector(31 downto 0);
  signal function_op_out_2: std_logic_vector(5 downto 0);
  signal register_target_out_2, register_destination_out_2: std_logic_vector(4 downto 0);
  signal reg_dst_out_2, jump_out_2, branch_out_2 , mem_read_out_2, mem_to_reg_out_2 , mem_write_out_2, alu_src_out_2, reg_write_out_2: std_logic;
  signal alu_op_out_2: std_logic_vector(1 downto 0);
  signal pc_plus4_out_2: std_logic_vector(31 downto 0);
  signal read_data1_out_2, read_data2_out_2: std_logic_vector(31 downto 0);
  signal reg_write_back_3: std_logic_vector (4 downto 0);
  signal read_data_2_out_3: std_logic_vector (31 downto 0);
  signal alu_result_out_3: std_logic_vector (31 downto 0);
  signal pc_from_branch_3: std_logic_vector(31 downto 0);
  signal pc_src_selector_3: std_logic;
  signal mem_read_out_3: std_logic;
  signal mem_to_reg_out_3: std_logic;
  signal reg_write_out_3: std_logic;
  signal mem_write_out_3: std_logic;
  signal reg_write_out_4,mem_to_reg_out_4: std_logic;
  signal alu_result_out_4: std_logic_vector (31 downto 0);
  signal reg_write_back_out_4: std_logic_vector (4 downto 0);
  signal read_data_4: std_logic_vector (31 downto 0);
  signal write_data_out_5: std_logic_vector(31 downto 0) ;

begin

  uut: Mips port map ( clk                        => clk,
                       instruction_out_1          => instruction_out_1,
                       pc_plus4_out_1             => pc_plus4_out_1,
                       extended_sign_out_2        => extended_sign_out_2,
                       function_op_out_2          => function_op_out_2,
                       register_target_out_2      => register_target_out_2,
                       register_destination_out_2 => register_destination_out_2,
                       reg_dst_out_2              => reg_dst_out_2,
                       jump_out_2                 => jump_out_2,
                       branch_out_2               => branch_out_2,
                       mem_read_out_2             => mem_read_out_2,
                       mem_to_reg_out_2           => mem_to_reg_out_2,
                       mem_write_out_2            => mem_write_out_2,
                       alu_src_out_2              => alu_src_out_2,
                       reg_write_out_2            => reg_write_out_2,
                       alu_op_out_2               => alu_op_out_2,
                       pc_plus4_out_2             => pc_plus4_out_2,
                       read_data1_out_2           => read_data1_out_2,
                       read_data2_out_2           => read_data2_out_2,
                       reg_write_back_3           => reg_write_back_3,
                       read_data_2_out_3          => read_data_2_out_3,
                       alu_result_out_3           => alu_result_out_3,
                       pc_from_branch_3           => pc_from_branch_3,
                       pc_src_selector_3          => pc_src_selector_3,
                       mem_read_out_3             => mem_read_out_3,
                       mem_to_reg_out_3           => mem_to_reg_out_3,
                       reg_write_out_3            => reg_write_out_3,
                       mem_write_out_3            => mem_write_out_3,
                       reg_write_out_4            => reg_write_out_4,
                       mem_to_reg_out_4           => mem_to_reg_out_4,
                       alu_result_out_4           => alu_result_out_4,
                       reg_write_back_out_4       => reg_write_back_out_4,
                       read_data_4                => read_data_4,
                       write_data_out_5           => write_data_out_5 );

clk_process :process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;
  