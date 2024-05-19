----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:07 04/24/2024 
-- Design Name: 
-- Module Name:    AlUComponent - Behavioral 
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

entity AlUComponent is
generic(
 p : integer := 2;
 c : integer := 6; 
 n : integer := 32);
 
port(
	alu_op : in std_logic_vector(p-1 downto 0);
	alu_zero : out std_logic;
	alu_out : out std_logic_vector (n-1 downto 0);
	function_op : in std_logic_vector(c-1 downto 0);
	alu_shamt:in std_logic_vector (4 downto 0) :=(others=>'0');
	operand1,operand2 : in std_logic_vector(n-1 downto 0);
	clk: in std_logic
	);

end AlUComponent;

architecture Behavioral of AlUComponent is



component ALU 
PORT(
	alu_control_in: in std_logic_vector(3 downto 0);
	alu_out :out std_logic_vector (31 downto 0);
	alu_zero : out std_logic;
	alu_shamt:in std_logic_vector (4 downto 0) :=(others=>'0');
	operand1,operand2 :in std_logic_vector(31 downto 0);
	
	clk : in std_logic
);
end component;

component AluControlUnit 

PORT(
 alu_control_out: out std_logic_vector(3 downto 0);
 function_op : in std_logic_vector(5 downto 0);
 alu_op: in std_logic_vector(1 downto 0);
 clk: in std_logic
 );
end component;

signal alu_c : std_logic_vector(3 downto 0) ;


begin

p1: AluControlUnit port map(
alu_control_out=>alu_c,
function_op=>function_op,
alu_op=>alu_op,
clk=>clk	);

p2: ALU port map(alu_control_in=>alu_c,
alu_shamt=>alu_shamt,
alu_out=>alu_out,
operand1=>operand1,
operand2=>operand2,
alu_zero=>alu_zero,
clk=>clk);




end Behavioral;

