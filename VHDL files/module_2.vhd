library ieee;
use ieee.std_logic_1164.all;
entity demux is
generic (n: integer:=8);
port(d_in:in std_logic_vector (n-1 downto 0);
En : in std_logic;
sel : in std_logic_vector(1 downto 0);
d_out1:out std_logic_vector (n-1 downto 0);
d_out2:out std_logic_vector (n-1 downto 0);
d_out3:out std_logic_vector (n-1 downto 0);
d_out4:out std_logic_vector (n-1 downto 0));
end entity;
architecture behav of demux is
begin
p1: process(sel,d_in) is begin
if(EN='1') then
case sel is
when "00" =>
d_out1<=d_in;
d_out2<="00000000";
d_out3<="00000000";
d_out4<="00000000";
when "01" =>
d_out2<=d_in;
d_out1<="00000000";
d_out3<="00000000";
d_out4<="00000000";
when "10" =>
d_out3<=d_in;
d_out2<="00000000";
d_out1<="00000000";
d_out4<="00000000";
when "11" =>
d_out4<=d_in;
d_out2<="00000000";
d_out3<="00000000";
d_out1<="00000000";
when others => null;
end case;
end if;
end process;
end architecture;

