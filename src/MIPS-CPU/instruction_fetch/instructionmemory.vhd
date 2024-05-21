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

	 instruction <= rom_data(to_integer(unsigned(pc)) ) & rom_data(to_integer(unsigned(pc))+1) & rom_data(to_integer(unsigned(pc))+2 ) & rom_data(to_integer(unsigned(pc))+3) ;


end Behavioral;
