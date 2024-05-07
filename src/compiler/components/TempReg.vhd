library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TempRegisters is
  generic (
    -- Number of registers (default 8 for t0-t7)
    c : integer range 1 to 31 := 8,
    -- Register size in bits (default 32 for MIPS)
    n : integer range 1 to 64 := 32
  );
  port (
    clk : in std_logic;
    reset : in std_logic;
    write_enable : in std_logic;
    write_data : in std_logic_vector(n-1 downto 0); 
    reg_select : in std_logic_vector(c-1 downto 0); 
    read_data : out std_logic_vector(n-1 downto 0)
  );
end TempRegisters;

architecture Behavioral of TempRegisters is
  type register_array is array (0 to c-1) of std_logic_vector(n-1 downto 0);
  signal registers : register_array;
begin
  process(clk, reset)
  begin
    if reset = '1' then
      -- Reset all registers to zero
      registers <= (others => (others => '0'));
    elsif rising_edge(clk) then
      -- Update registers based on write enable and register select
      if write_enable = '1' then
        registers(conv_integer(reg_select)) <= write_data;
      end if;
    end if;
  end process;

  -- Output the selected register's data
  read_data <= registers(conv_integer(reg_select));
end Behavioral;
