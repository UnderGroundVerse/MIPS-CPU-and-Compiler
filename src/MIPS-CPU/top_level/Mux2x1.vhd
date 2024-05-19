library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Mux2x1 is
    port(
        input0, input1 : in std_logic_vector(31 downto 0);
        selector : in std_logic;
        output : out std_logic_vector(31 downto 0) 
    );

end Mux2x1;


architecture Behavioral of Mux2x1 is
begin
    output <= input0 when selector = '0' 
        else input1 when selector = '1' else
        X"00000000";
end Behavioral;



