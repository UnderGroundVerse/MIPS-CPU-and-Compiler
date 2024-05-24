library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Instruction_Memory_VHDL is
    generic (
        n : integer := 32  -- Number of address bits
    );
    port (
        pc: in std_logic_vector(31 downto 0);
        instruction: out std_logic_vector(31 downto 0)
    );
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
    type ROM_type is array (0 to 83) of std_logic_vector(7 downto 0);

    constant rom_data: ROM_type := (
        "00001001",--|-----------|    
        "00000000",--|    		 |
        "00000010",--|  		 |
        "00100000",--|li 		 |--inp R0 inp value =9
        "00100000",--|    		 |
        "01000000",--|  	     |
        "00000010",--|			 |
        "00000000",--|moveRtoR---|
        "00000000",--|----|    
        "00000000",--|    |
        "00000001",--|    |
        "00100000",--|li  (store address of M0(X"00000000") inside reg a0 $1)
        "00000000",--|----|--------move R0 to M0
        "00000000",--|----|
		"00101000",--|----|
        "10101100",--|sw--|
        "00001101",--|-----------|    
        "00000000",--|    		 |
        "00000010",--|  		 |
        "00100000",--|li 		 |--inp R1 inp value = 13
        "00111000",--|    		 |
        "01001000",--|  		 |
        "01000000",--|			 |
		"00000000",--|moveRtoR---|
        "00000001",--|----|    
        "00000000",--|    |
        "00000001",--|    |
        "00100000",--|li  (store address of M1(X"00000001") inside reg a0 $1)  
		"00000000",--|----|
        "00000000",--|----|
		"00101001",--|----|--move R1 to M1
        "10101100",--|sw--|
        "00000000",--|-------|    
        "00000000",--|       |
        "00000001",--|       |
        "00100000",--|li  (store address of M0(X"00000000") inside reg a0 $1)
        "00000000",--|-------|
		"00000000",--|		 |
        "00101111",--|		 |
        "10001100",--|lw M0(into specifed temp reg temp7 $15)
        "00011000",--|		 |----------------------------mul M0(temp7) and R1 and save it in R1
        "01001000",--|		 |
		"00101111",--|		 |
		"00000001",--|mul----|
        "00000010",--|----|    
        "00000000",--|    |
        "00000001",--|    |
        "00100000",--|li  (store address of M2(X"00000002") inside reg a0 $1) 
        "00000000",--|----|----------------move R1 to M2
        "00000000",--|----|
		"00101001",--|----|
        "10101100",--|sw--|
        "00000010",--|----------|    
        "00000000",--|          |
        "00000001",--|          |
        "00100000",--|li  (store address of M2(X"00000002") inside reg a0 $1) 
		"00000000",--|----------|
		"00000000",--|		    |
        "00101111",--|		    |
        "10001100",--|lw M2(into specifed temp reg temp7 $15)
		"00000001",--|          |-----------------------------|skip
		"00000000",--|		    |
        "11100000",--|		    |
        "10000101",--|skip the next instruction (if M2 postive)
		"00000011",--|----------------|
		"00000000",--|		          |
        "00000000",--|		          |---------bun to Negative skipping 3 instruction
        "00010100",--|bun-------------|
		"00100000",--|    		 |
        "00100000",--|  		 |
        "00100000",--|			 |--------move R1 to a0 $4
		"00000001",--|moveRtoR---|
		"00000001",--|----------------|
		"00000000",--|		          |
        "00000000",--|		          |---------bun to End skipping 1 instruction
        "00010100",--|bun-------------|
        "00100000",--|    		 |
        "00100000",--|  		 |
        "00100000",--|			 |--------move R1 to a0 $4
		"00000001",--|moveRtoR---|
        "11111111",--|---------------|
		"11111111",--|		         |
        "00000000",--|		         |---------bun to End skipping 0 instruction
        "00010100"--|bun-------------|	
    );
begin

	--  instruction <=  rom_data(to_integer(unsigned(pc))+3)  & rom_data(to_integer(unsigned(pc))+2 ) & rom_data(to_integer(unsigned(pc))+1) & rom_data(to_integer(unsigned(pc)) ) ;
    with pc select
    instruction <= (others => 'X') when (others => 'X'),
            (rom_data(to_integer(unsigned(pc))+3)  & rom_data(to_integer(unsigned(pc))+2 ) & rom_data(to_integer(unsigned(pc))+1) & rom_data(to_integer(unsigned(pc)) )) when others;

end Behavioral;
