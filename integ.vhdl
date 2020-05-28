library IEEE;
use IEEE.std_logic_1164.all;
entity integ is
port(clk, rst : in std_logic; x,y : in std_logic_vector(3 downto 0); data_out : out std_logic_vector(3 downto 0));
end integ;
architecture behavior of integ is
component controller is
port(clk,reset: in std_logic; x_may_y,x_igual_y,x_men_y : in std_logic; x_sel,y_sel : out std_logic;x_rst,y_rst : out std_logic;x_load,y_load : out std_logic;x_sub,y_sub : out std_logic; o_en,o_rst : out std_logic);
end component;
component datapath is
port(x,y : in std_logic_vector(3 downto 0); x_sel,y_sel : in std_logic; clk : in std_logic; x_load,y_load,x_reset,y_reset : in std_logic; x_sub,y_sub : in std_logic; o_en,o_reset : in std_logic; x_may_y, x_igual_y, x_men_y : out std_logic; z : out std_logic_vector(3 downto 0));
end component;
signal x_may_y, x_igual_y, x_men_y, x_sel,y_sel, x_load,y_load,x_reset,y_reset, x_sub,y_sub, o_en,o_reset : std_logic;
begin
control1 : controller port map(clk,rst,x_may_y, x_igual_y, x_men_y,x_sel,y_sel,x_load,y_load,x_reset,y_reset,x_sub,y_sub,o_en,o_reset);
datapath1 : datapath port map(x,y,x_sel,y_sel,clk,x_load,y_load,x_reset,y_reset,x_sub,y_sub,o_en,o_reset,x_may_y, x_igual_y, x_men_y,data_out);
end behavior;