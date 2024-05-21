library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Excecute_Address_tb is
end;

architecture bench of Excecute_Address_tb is

  component Excecute_Address
      port(
          read_data1, read_data2, extended_sign, pc_plus4 : in std_logic_vector(31 downto 0);
          alu_src, reg_dst, branch, clk : in std_logic;
          alu_op : in std_logic_vector(1 downto 0);
          function_op : in std_logic_vector(5 downto 0);
          alu_shamt : in std_logic_vector(4 downto 0);
          register_target, register_destination : in std_logic_vector(4 downto 0);
          pc_src_selector : out std_logic;
          reg_dst_address : out std_logic_vector(4 downto 0);
          pc_from_branch, alu_result : out std_logic_vector(31 downto 0);
          alu_zero : out std_logic
      );
  end component;

  signal read_data1, read_data2, extended_sign, pc_plus4: std_logic_vector(31 downto 0);
  signal alu_src, reg_dst, branch, clk: std_logic;
  signal alu_op: std_logic_vector(1 downto 0);
  signal function_op: std_logic_vector(5 downto 0);
  signal alu_shamt: std_logic_vector(4 downto 0);
  signal register_target, register_destination: std_logic_vector(4 downto 0);
  signal pc_src_selector: std_logic;
  signal reg_dst_address: std_logic_vector(4 downto 0);
  signal pc_from_branch, alu_result: std_logic_vector(31 downto 0);
  signal alu_zero: std_logic ;

begin

  uut: Excecute_Address port map ( read_data1           => read_data1,
                                   read_data2           => read_data2,
                                   extended_sign        => extended_sign,
                                   pc_plus4             => pc_plus4,
                                   alu_src              => alu_src,
                                   reg_dst              => reg_dst,
                                   branch               => branch,
                                   clk                  => clk,
                                   alu_op               => alu_op,
                                   function_op          => function_op,
                                   alu_shamt            => alu_shamt,
                                   register_target      => register_target,
                                   register_destination => register_destination,
                                   pc_src_selector      => pc_src_selector,
                                   reg_dst_address      => reg_dst_address,
                                   pc_from_branch       => pc_from_branch,
                                   alu_result           => alu_result,
                                   alu_zero             => alu_zero );


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
    read_data1 <= X"00000000"; 
    read_data2<= X"00000000"; 
    extended_sign <=  X"00000000";
    pc_plus4 <= X"00000000";
    alu_src <= '0';
    reg_dst <= '0';
    branch <= '0';
    alu_op <= "00";
    function_op <= "000000";
    alu_shamt <= "00000";
    register_target <= "00000";
    register_destination <= "00000";
    -- Put test bench stimulus code here

    wait for 10 ns;
    read_data1 <= X"00000001";
    read_data2 <= X"00000002";
    extended_sign <= X"00000001";
    pc_plus4 <= X"00000002";
    alu_src <= '0';
    branch <= '0';
    alu_op <= "10";
    function_op <= "100000";
    wait for 10 ns;

   
  end process;


end;