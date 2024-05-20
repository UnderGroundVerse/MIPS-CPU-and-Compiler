library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Instruction_Memory_VHDL is
    generic (
        n : integer := 32  -- Number of address bits
    );
    port (
        pc: in std_logic_vector(n - 1 downto 0);
        instruction: out std_logic_vector(n - 1 downto 0)
    );
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
    signal rom_addr: std_logic_vector(n -1  downto 0);
	 signal instruction_holder: std_logic_vector(n-1 downto 0) := X"00000000";
    type ROM_type is array (n - 1 downto 0) of std_logic_vector(7 downto 0);
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
    rom_addr <= pc;
	-- instruction_holder<= rom_data(to_integer(unsigned(rom_addr(31 downto 23)))) & rom_data(to_integer(unsigned(rom_addr(23 downto 16)))) & 
	-- rom_data(to_integer(unsigned(rom_addr(16 downto 8)))) & rom_data(to_integer(unsigned(rom_addr(8 downto 0))));
    -- instruction <= instruction_holder  when pc < x"0020" else x"0000";

    instruction_holder(7 downto 0) <= rom_data(to_integer(unsigned(rom_addr)));
    instruction_holder(15 downto 8) <= rom_data(to_integer(unsigned(rom_addr))+1);
    instruction_holder(23 downto 16) <= rom_data(to_integer(unsigned(rom_addr))+2);
    instruction_holder(31 downto 24) <= rom_data(to_integer(unsigned(rom_addr))+2);
end Behavioral;
