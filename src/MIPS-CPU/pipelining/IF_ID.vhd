library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;




entity IF_ID is
    port(
        instruction_in : in std_logic_vector(31 downto 0);
        pc_plus4_in : in std_logic_vector(31 downto 0);
        clk : in std_logic;
        instruction_out : out std_logic_vector(31 downto 0);
        pc_plus4_out : out std_logic_vector(31 downto 0)
    );
end IF_ID;


architecture Behavioral of IF_ID is
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            instruction_out <= instruction_in;
            pc_plus4_out <= pc_plus4_in;
        end if;
    end process;
end Behavioral;