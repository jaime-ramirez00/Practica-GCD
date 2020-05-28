--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--4 bit substractor
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity subs4 is
port(a, b : in std_logic_vector(3 downto 0); en: in std_logic; d: out std_logic_vector(3 downto 0));
end entity;
architecture behavior of subs4 is
begin
d<=a when en='0'
else std_logic_vector(unsigned(a)-unsigned(b));
end behavior;