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

use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


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
	function_op : in std_logic_vector(5 downto 0);
	alu_shamt:in std_logic_vector (4 downto 0) :=(others=>'0');
	operand1,operand2 : in std_logic_vector(n-1 downto 0);
	clk: in std_logic;
	alu_op : in std_logic_vector(1 downto 0);
	alu_src : in std_logic;
	alu_zero : out std_logic;
	alu_out : out std_logic_vector (n-1 downto 0)
	
	);

end AlUComponent;

architecture Behavioral of AlUComponent is


	signal alu_code : std_logic_vector (3 downto 0) ;
	signal alu_zero_temp : std_logic;
	signal result : std_logic_vector (31 downto 0) ;
	signal mul : std_logic_vector (63 downto 0);
	signal div : std_logic_vector (63 downto 0);
	signal hi : std_logic_vector (n-1 downto 0);
	signal lo : std_logic_vector (n-1 downto 0); 
begin

process(alu_op,function_op)
begin
	if(alu_op = "10") --(R Type)
		then 
		case function_op is
			when "100000" =>  --add,moveRtoR
				alu_code<="0010";
			when "100010" =>   --subtract
				alu_code<="0110";
			when "100101" => --or
				alu_code<="0001";
			when "100100" =>  --and
				alu_code<="0000"; 		
			when "011000" => --mul
				alu_code<="1000";
			when others => 				
				alu_code<="1111";
			end case;
				-- alu_control_out<=alu_code;
	elsif (alu_op /= "10") --(I-Type)
	then
		case alu_op is
			when "00" =>  --addi , moveMtoR , moveRtoM 
				alu_code<="0010";
			when "01" => --skip
				alu_code<="0011";
		 --when "01" => --beq(subtract)
		--		alu_code<="0110";
			when "10" => --bun
				alu_code<="0111";	
			when "11" => --inp
				alu_code<="0101";
			when others => 	null;
								
		end case;	
	end if;





		alu_zero_temp<='0';
		case alu_code is
			when "0010" => 
				result<= operand1 + operand2;
			when "0110" => 
				result<= operand1 - operand2;
			when "0001" =>
				result<= operand1 or operand2;
			when "0000" =>
				result<= operand1 and operand2;
			when "1000" => 
				mul<= operand1 * operand2;
				lo<=mul(31 downto 0);
				hi<=mul(63 downto 32);
				result<=lo;	
		
		--	when "0101" =>   --inp
		--		result <= operand1;
			when "0111" =>   --bun
				alu_zero_temp<='1';
			when others => null;
				
			end case;
			if((alu_code="0110") and (result = (X"00000000"))) then --beq
				alu_zero_temp<='1';
			end if;
			if((alu_code="0011") and (operand1(31) = '0')) then --skip
				alu_zero_temp<='1';
			end if;
				
	
end process;


alu_out<=result;
alu_zero <= alu_zero_temp;






-- component ALU 
-- PORT(
-- 	alu_control_in: in std_logic_vector(3 downto 0);
-- 	alu_src : in std_logic;
-- 	alu_out :out std_logic_vector (31 downto 0);
-- 	alu_zero : out std_logic;
-- 	alu_shamt:in std_logic_vector (4 downto 0) :=(others=>'0');
-- 	operand1,operand2 :in std_logic_vector(31 downto 0);
	
-- 	clk : in std_logic
-- );
-- end component;

-- component AluControlUnit 

-- PORT(
--  alu_control_out: out std_logic_vector(3 downto 0);
--  alu_src : in std_logic;
--  function_op : in std_logic_vector(5 downto 0);
--  alu_op: in std_logic_vector(1 downto 0);
--  clk: in std_logic
--  );
-- end component;

-- signal alu_c : std_logic_vector(3 downto 0) ;


--begin

-- p1: AluControlUnit port map(
-- alu_control_out=>alu_c,
-- alu_src => alu_src,
-- function_op=>function_op,
-- alu_op=>alu_op,
-- clk=>clk	);

-- p2: ALU port map(alu_control_in=>alu_c, alu_src => alu_src,
-- alu_shamt=>alu_shamt,
-- alu_out=>alu_out,
-- operand1=>operand1,
-- operand2=>operand2,
-- alu_zero=>alu_zero,
-- clk=>clk);




end Behavioral;

