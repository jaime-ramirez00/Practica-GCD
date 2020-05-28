--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--Substractor GCD
library IEEE;
use IEEE.std_logic_1164.all;
entity subs is 
port(a, b, cin: in std_logic; d, cout: out std_logic);
end entity;
architecture behavior of subs is 
begin
d <= a xor (b xor cin);
cout <= (cin and ( b and (not a))) or ((not a) and b);
end behavior;