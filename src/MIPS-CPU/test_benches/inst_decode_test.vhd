library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Instruction_Decode_tb is
end;

architecture bench of Instruction_Decode_tb is

  component Instruction_Decode
      port(
          clk, rst, reg_write: in std_logic;
          pc : in std_logic_vector(31 downto 0);
          instruction : in std_logic_vector(31 downto 0);
          write_data : in std_logic_vector(31 downto 0);
          reg_dst_address : in std_logic_vector(4 downto 0);
          read_data1, read_data2 : out std_logic_vector(31 downto 0);
          extended_sign : out std_logic_vector(31 downto 0);
          function_op : out std_logic_vector(5 downto 0);
          register_target, register_destination : out std_logic_vector(4 downto 0)
      );
  end component;

  signal clk, rst, reg_write: std_logic;
  signal pc: std_logic_vector(31 downto 0);
  signal instruction: std_logic_vector(31 downto 0);
  signal write_data: std_logic_vector(31 downto 0);
  signal reg_dst_address: std_logic_vector(4 downto 0);
  signal read_data1, read_data2: std_logic_vector(31 downto 0);
  signal extended_sign: std_logic_vector(31 downto 0);
  signal function_op: std_logic_vector(5 downto 0);
  signal register_target, register_destination: std_logic_vector(4 downto 0) ;

begin

  uut: Instruction_Decode port map ( clk                  => clk,
                                     rst                  => rst,
                                     reg_write            => reg_write,
                                     pc                   => pc,
                                     instruction          => instruction,
                                     write_data           => write_data,
                                     reg_dst_address      => reg_dst_address,
                                     read_data1           => read_data1,
                                     read_data2           => read_data2,
                                     extended_sign        => extended_sign,
                                     function_op          => function_op,
                                     register_target      => register_target,
                                     register_destination => register_destination );


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
    rst <= '0';
    reg_write <= '1';
    pc <= X"00000000";
    instruction <= X"10001001";
    write_data <= X"00000000";
    reg_dst_address <= "00001";

    -- Put test bench stimulus code here
    wait for 10 ns;

    pc <= X"00000001";
    instruction <= X"20002002";

    wait for 10 ns;

    pc <= X"00000002";
    instruction <= X"30003003";

    wait for 10 ns;
  end process;


end;
  