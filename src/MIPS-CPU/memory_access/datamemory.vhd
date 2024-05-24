library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Data_Memory_VHDL is
  generic (
    n : integer := 32  -- Number of bits for address
  );
  port (
    clk             : in std_logic;
    mem_access_addr : in std_logic_vector( n- 1 downto 0);
    mem_write_data  : in std_logic_vector(n - 1 downto 0);
    mem_write_en    : in std_logic;
    mem_read        : in std_logic;
    mem_read_data   : out std_logic_vector(n - 1 downto 0)
  );
end Data_Memory_VHDL;

architecture Behavioral of Data_Memory_VHDL is
  signal ram_addr : std_logic_vector(n - 1 downto 0);
  type data_mem is array  (0 to 31) of std_logic_vector(n - 1 downto 0);
  signal RAM : data_mem ;
begin
  ram_addr <= mem_access_addr;  
  process(mem_write_en, mem_read)
  begin
    -- if rising_edge(clk) then
      if ((mem_write_en = '1') and (mem_read = '0')) then
        RAM(to_integer(unsigned(ram_addr))) <=  mem_write_data;
		  mem_read_data <= X"00000000";
		elsif ((mem_write_en= '0') and (mem_read = '1')) then
		  mem_read_data <= RAM(to_integer(unsigned(ram_addr))) ;
		else
		  mem_read_data <= X"00000000";
    end if;
    -- end if;
  end process;



end Behavioral;
