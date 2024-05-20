library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Instruction_Fetch is
    port(
        pc_in : in std_logic_vector(31 downto 0);
        pc_out : out std_logic_vector(31 downto 0);
        instruction_out : out std_logic_vector(31 downto 0)
    );
end Instruction_Fetch;

architecture Behavioral of Instruction_Fetch is

    component Instruction_Memory_VHDL is
        generic (
            n : integer := 32  -- Number of address bits
        );
        port (
            pc: in std_logic_vector(n - 1 downto 0);
            instruction: out std_logic_vector(n - 1 downto 0)
        );
    end component;



begin

    instruction_memory : Instruction_Memory_VHDL generic map ( n => 32)
    port map(
        pc => pc_in,
        instruction => instruction_out  
    );
    pc_out <= std_logic_vector(unsigned(pc_in) + 4);

end Behavioral;
