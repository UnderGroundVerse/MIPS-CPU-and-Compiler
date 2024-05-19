-- Temporary register file for MIPS architecture (pipeline example with generics)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TempRegisters is
  generic (
    c:integer :=8;
    n : integer range 1 to 64 := 32
  );
  port (
    clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    -- Pipeline interaction signals
    read_req : in  STD_LOGIC;
    write_req : in  STD_LOGIC;
    reg_select : in  STD_LOGIC_VECTOR(c-1 downto 0); -- Register select input
    write_data : in  STD_LOGIC_VECTOR(n-1 downto 0); -- Data to write
    read_data : out  STD_LOGIC_VECTOR(n-1 downto 0) -- Data read from register
  );
end entity TempRegisters;

architecture Behavioral of TempRegisters is
  type register_array is array (0 to n-1) of STD_LOGIC_VECTOR(n-1 downto 0);
  signal registers : register_array;
begin

  process(clk, reset)
  begin
    if reset = '1' then
      registers <= (others => (others => '0'));
    elsif rising_edge(clk) then
      -- (triggered by read request)
      if read_req = '1' then
        read_data <= registers(to_integer(unsigned(reg_select)));
      end if;

      --(triggered by write request)
      if write_req = '1' then
        registers(to_integer(unsigned(reg_select))) <= write_data;
      end if;
    end if;
  end process;

end Behavioral;
