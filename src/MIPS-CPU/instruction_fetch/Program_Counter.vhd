library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;




entity Program_Counter is
    port(
        clk : in std_logic;
        pc_in : in std_logic_vector(31 downto 0);
        pc_out : out std_logic_vector(31 downto 0)
    );
end Program_Counter;



architecture Behavioral of Program_Counter is
    signal pc_temp : std_logic_vector(31 downto 0) := X"00000000";
begin
    process(clk)
    begin
        pc_out <= pc_temp;
        if(rising_edge(clk)) then
            pc_out <= pc_in;
        end if;
    end process;
end Behavioral;