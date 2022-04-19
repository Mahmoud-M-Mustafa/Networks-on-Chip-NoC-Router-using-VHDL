library ieee;
use ieee.std_logic_1164.all;
entity ram_tb is
end entity;
Architecture behave of ram_tb is
component ram is
 port(wea,rea,clka,clkb: in std_logic ;
 addra,addrb: in std_logic_vector (2 downto 0);
 d_in: in std_logic_vector (7 downto 0);
 d_out: out std_logic_vector (7 downto 0));
end component;
signal wea,rea,clka,clkb: std_logic;
signal addra,addrb: std_logic_vector (2 downto 0);
signal d_in,d_out: std_logic_vector (7 downto 0);
Begin
br: ram port map (wea,rea,clka,clkb,addra,addrb,d_in,d_out);
process
begin
 clka <='0';
 wait for 5 ns;
 clka <='1';
 wait for 15 ns;
end process;
process
begin
 clkb <='0';
 wait for 5 ns;
 clkb <='1';
 wait for 10 ns;
end process;
process
begin
d_in<="00001111";
addrb<="000";wea<='1'; rea<='0';
addra<="000";
wait for 20 ns;
assert ( d_out ="XXXXXXXX") report "error 0" severity warning;
rea<='1';
wait for 20 ns;
assert ( d_out ="00001111") report "error 1" severity warning;
d_in<="00001001";
addra<="001";
addrb<="011";
wait for 20 ns;
assert ( d_out ="XXXXXXXX") report "error 2" severity warning;
addrb<="001";
wait for 20 ns;
assert ( d_out ="00001001") report "error 3" severity warning;
d_in<="10001001";
addra<="101";
addrb<="101";
wait for 20 ns;
assert ( d_out ="10001001") report "error 4" severity warning;
-----------------------------------------------------------------
wea<='0';
d_in<="11111001";
addra<="111";
addrb<="111";
wait for 20 ns;
assert ( d_out ="XXXXXXXX") report "error Write enable supposed to be off " severity w
arning;
wea<='1';
rea<='0';
d_in<="11111001";
addra<="111";
addrb<="111";
wait for 20 ns;
assert ( d_out ="XXXXXXXX") report "error read enable supposed to be off " severity wa
rning;
rea<='1';
wait for 40 ns;
assert ( d_out ="11111001") report "error read enable supposed to be on " severity war
ning;
wait;
end process;
end architecture;
