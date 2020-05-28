--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--Mux GCD
library IEEE;
use IEEE.std_logic_1164.all;
entity mux is 
port(x, y : in std_logic_vector(3 downto 0); sel : in std_logic; res : out std_logic_vector(3 downto 0));
end entity;
architecture behavior of mux is
begin
res <=  x when (sel = '0') 
else y; 
end behavior;