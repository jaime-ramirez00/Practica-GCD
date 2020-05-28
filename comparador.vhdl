--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--Comparator GCD
library IEEE;
use IEEE.std_logic_1164.all;
entity comparador is
port(x, y : in std_logic_vector(3 downto 0); x_may_y, x_igual_y, x_men_y : out std_logic);
end entity;
architecture behavior of comparador is
begin
x_may_y <= '1' when (x > y) else '0';
x_igual_y <= '1' when (x = y) else '0';
x_men_y <= '1' when (x < y) else '0';
end behavior;