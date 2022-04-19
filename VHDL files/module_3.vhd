library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
entity ram is
port(wea,rea,clka,clkb: in std_logic ;
addra,addrb: in std_logic_vector (2 downto 0);
d_in: in std_logic_vector (7 downto 0);
d_out: out std_logic_vector (7 downto 0));
end entity;
Architecture behave_ram of ram is
type ram is array (0 to 7) of std_logic_vector (7 downto 0);
signal bram : ram :=(others =>"XXXXXXXX") ;
BEGIN
proc1:process(wea,clka)
begin
if( rising_edge(clka)) then
if(wea='1')then
bram(to_integer( unsigned(addra))) <= d_in;
end if;
end if;
end process;
proc2: process(rea,clkb)
begin
if( rising_edge(clkb) ) then
if(rea<='1') then
d_out <= bram( to_integer(unsigned(addrb)));
end if;
end if;
end process;
end architecture;

