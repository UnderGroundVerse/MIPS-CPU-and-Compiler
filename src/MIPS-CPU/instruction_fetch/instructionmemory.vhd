library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Instruction_Memory_VHDL is
    generic (
        n : integer := 32  -- Number of address bits
    );
    port (
	 clk : in std_logic ;
        pc: in std_logic_vector(n - 1 downto 0);
        instruction: out std_logic_vector(n - 1 downto 0)
    );
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
    signal rom_addr: std_logic_vector(n -1  downto 0);

	 signal instruction_holder: std_logic_vector (n-1 downto 0) := X"00000000";
    type ROM_type is array (0 to n - 1) of std_logic_vector(7 downto 0);

    constant rom_data: ROM_type := (
        "00100000",  
        "10001100",  
        "10101101",
        "10001100",  
        "10101100",
        "00000001",
        "00000000",
        "00000000",
        "00000000",
        "00000000",
        "00000000",
		"00000000",
        "00000000",
        "00000000",
        "00000000",
        "00000000",
		"00000000",
        "00000000",
        "00000000",
        "00000000",
        "00000000",
		"00000000",
        "00000000",
        "00000000",
        "00000000",
        "00000000",
		"00000000",
        "00000000",
        "00000000",
        "00000000",
        "00000000",
		"00000000"
    );
begin

process(clk)
begin
    rom_addr <= pc;

	 rom_addr <= pc;
	 instruction_holder <= rom_data(to_integer(unsigned(rom_addr))+3 ) & rom_data(to_integer(unsigned(rom_addr))+2) & 
	  rom_data(to_integer(unsigned(rom_addr))+1 ) & rom_data(to_integer(unsigned(rom_addr))) ;
    instruction <= instruction_holder  ;

end process;

end Behavioral;
