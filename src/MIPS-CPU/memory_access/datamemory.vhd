library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Data_Memory_VHDL is
  generic (
    Addressbytes : integer := 32  -- Number of bits for address
  );
  port (
    clk             : in std_logic;
    mem_access_addr : in std_logic_vector( 2**Addressbytes - 1 downto 0);
    mem_write_data  : in std_logic_vector(2**Addressbytes - 1 downto 0);
    mem_write_en    : in std_logic;
    mem_read        : in std_logic;
    mem_read_data   : out std_logic_vector(2**Addressbytes - 1 downto 0)
  );
end Data_Memory_VHDL;

architecture Behavioral of Data_Memory_VHDL is
  signal ram_addr : std_logic_vector(Addressbytes - 1 downto 0);
  type data_mem is array (natural range <>) of std_logic_vector(2**Addressbytes - 1 downto 0);
  signal RAM : data_mem(0 to 2**Addressbytes - 1) := (others => (others => '0'));
begin

  ram_addr <= mem_access_addr;

  process(clk)
  begin
    if rising_edge(clk) then
      if mem_write_en = '1' then
        RAM(to_integer(unsigned(ram_addr))) <= mem_write_data;
      end if;
    end if;
  end process;

  mem_read_data <= RAM(to_integer(unsigned(ram_addr))) when mem_read = '1' else (others => '0');

end Behavioral;
