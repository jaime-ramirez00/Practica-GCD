--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--Output Register GCD
library IEEE;
use IEEE.std_logic_1164.all;
entity outreg is
port(data_in: in std_logic_vector(3 downto 0); clk, load, reset: in std_logic; data_out:out std_logic_vector(3 downto 0));
end entity;
architecture behavior of outreg is 
begin
process(clk) 
begin
if reset = '1' then
data_out <= "0000";
else
if clk'event and clk='1' then
if load = '1' then
data_out <= data_in;
else 
null;
end if;
end if;
end if;
end process;
end behavior;