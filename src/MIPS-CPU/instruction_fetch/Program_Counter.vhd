library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;




entity Program_Counter is
    port(
        clk : in std_logic;
        pc_in : in std_logic_vector(31 downto 0);
        pc_out : out std_logic_vector(31 downto 0);
        stall : in std_logic
    );
end Program_Counter;



architecture Behavioral of Program_Counter is
    signal pc_temp : std_logic_vector(31 downto 0) := X"00000000";
begin
    process(clk, stall)
    begin
        if(rising_edge(clk) and stall = '0') then
            pc_temp <= pc_in;
        end if;
    end process;
    pc_out <= pc_temp;
end Behavioral;