----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:49 05/20/2024 
-- Design Name: 
-- Module Name:    Write_back - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Write_back is
generic (
n : integer := 32
);
port(
mem_read_data : in std_logic_vector (n-1 downto 0);
alu_result    : in std_logic_vector (n-1 downto 0);
mem_to_reg    : in std_logic;
write_data    : out std_logic_vector (n-1 downto 0)	
);
end Write_back;


architecture Behavioral of Write_back is

component Mux2x1 is
    generic(
        n : integer := 32
    );
    port(
        input0, input1 : in std_logic_vector(n-1 downto 0);
        selector : in std_logic;
        mux_out : out std_logic_vector(n-1 downto 0) 
    );

end component;

begin
mem_to_reg_mux : Mux2x1 generic map (n=>32)

port map(
input0=>alu_result,
input1=>mem_read_data,
selector=>mem_to_reg,
mux_out=>write_data
);

end Behavioral;

