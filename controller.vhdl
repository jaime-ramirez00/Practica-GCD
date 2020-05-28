--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--Controller GCD
library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
port(clk,reset: in std_logic; x_may_y,x_igual_y,x_men_y : in std_logic; x_sel,y_sel : out std_logic;x_rst,y_rst : out std_logic;x_load,y_load : out std_logic;x_sub,y_sub : out std_logic; o_en,o_rst : out std_logic);
end controller;
architecture behavior of controller is
signal estado : integer range 1 to 8 := 1;
begin
combinational : process(estado)
begin
case(estado) is
when 1 =>
x_sel <= '0';
y_sel <= '0';
x_load<= '0';
y_load<= '0';
x_sub <= '0';
y_sub <= '0';
o_en <= '0';
x_rst <= '1';
y_rst <= '1';
o_rst <= '1';
when 2 =>
o_rst <= '0';
x_rst <= '0';
y_rst <= '0';
x_load <= '1';
y_load <= '1';
x_sub <= '0' after 5 ns;
y_sub <= '0' after 5 ns;
when 8 =>
x_load <= '0' after 1 ns;
y_load <= '0' after 1 ns;
when 3 =>
y_sub <= '0';
x_sub <= '1';
when 4 =>
x_sub <= '0';
y_sub <= '1';
when 5 =>
o_en <= '1';
when 6 =>
x_sel <= '1';
when 7 =>
y_sel <= '1'; 
when others => null;       
end case;
end process;
sequential : process(clk,reset)
begin
if reset = '1' then
estado <= 1;
elsif clk'event and clk='1' then
case(estado) is
when 1 => estado <= 2;
when 2 => estado <= 8;
when 8 =>
if x_may_y = '1' then estado <= 3;
elsif x_men_y = '1' then estado <= 4;
elsif x_igual_y = '1' then estado <= 5;
end if;
when 3 => estado <= 6;
when 4 => estado <= 7;
when 5 => null;
when 6 => estado <= 2;
when 7 => estado <= 2;
end case;
end if;
end process;    
end behavior;