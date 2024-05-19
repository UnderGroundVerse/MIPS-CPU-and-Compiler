library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Mux2x1 is
    generic(
        n : integer := 32
    );
    port(
        input0, input1 : in std_logic_vector(n-1 downto 0);
        selector : in std_logic;
        mux_out : out std_logic_vector(n-1 downto 0) 
    );

end Mux2x1;


architecture Behavioral of Mux2x1 is
begin
    mux_out <= input0 when selector = '0' 
        else input1 when selector = '1' else input0;
end Behavioral;



