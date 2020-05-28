library IEEE;
use IEEE.std_logic_1164.all;
entity integ_tb is
end integ_tb;
architecture behavior of integ_tb is
component integ is
port(clk, rst : in std_logic; x,y : in std_logic_vector(3 downto 0); data_out : out std_logic_vector(3 downto 0));
end component;
signal clk,rst : std_logic := '0';
signal x,y,data_out : std_logic_vector(3 downto 0) := "0000";
begin
int1: integ port map(clk,rst,x,y,data_out);
clkpr : process
begin
clk <= not clk;
wait for 5 ns;
end process;   
pro : process
begin
x <= "1000";
y <= "0100";
rst <= '1';
wait for 5 ns;
rst <= '0';
wait for 5 ns;
x <= "1000";
y <= "0010";
rst <= '1';
wait for 5 ns;
rst <= '0';
wait for 5 ns;
x <= "1100";
y <= "1100";
wait for 5 ns;
rst <= '0';
end process;        
end behavior;