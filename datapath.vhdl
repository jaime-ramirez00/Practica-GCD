--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
--datapath GCD
library IEEE;
use IEEE.std_logic_1164.all;
entity datapath is
port(x,y : in std_logic_vector(3 downto 0); x_sel,y_sel : in std_logic; clk : in std_logic; x_load,y_load,x_reset,y_reset : in std_logic; x_sub,y_sub : in std_logic; o_en,o_reset : in std_logic; x_may_y, x_igual_y, x_men_y : out std_logic; z : out std_logic_vector(3 downto 0));
end datapath;
architecture behavior of datapath is
component mux is
port(x,y : in std_logic_vector(3 downto 0); sel : in std_logic; res : out std_logic_vector(3 downto 0));
end component;
component outreg is 
port(data_in : in std_logic_vector(3 downto 0); clk, load , reset : in std_logic; data_out : out std_logic_vector(3 downto 0));
end component;
component subs4 is
port(en: in std_logic; a, b: in std_logic_vector(3 downto 0); d  : out std_logic_vector(3 downto 0));
end component;
component comparador is
port(x, y : in std_logic_vector(3 downto 0); x_may_y, x_igual_y, x_men_y : out std_logic);
end component;
signal xsig,ysig : std_logic_vector(3 downto 0) := "0000";
signal inx,iny : std_logic_vector(3 downto 0) := "0000";
signal outx,outy : std_logic_vector(3 downto 0) := "0000";
begin
mux1 : mux port map(x,xsig,x_sel,inx);
mux2 : mux port map(y,ysig,y_sel,iny);
reg1 : outreg port map(inx,clk,x_load,x_reset,outx);
reg2 : outreg port map(iny,clk,y_load,y_reset,outy);
comp  : comparador port map(outx,outy, x_may_y, x_igual_y, x_men_y); 
subx  : subs4 port map(x_sub,outx,outy,xsig);
suby  : subs4 port map(y_sub,outy,outx,ysig);
outr : outreg port map(outx,clk,o_en,o_reset,z);
end behavior;