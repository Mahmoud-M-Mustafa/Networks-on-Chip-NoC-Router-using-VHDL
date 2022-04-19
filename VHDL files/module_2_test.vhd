library ieee;
use ieee.std_logic_1164.all;
entity demux_test is
end entity;
architecture test_demux of demux_test is
component demux is
 generic (n: integer:=8);
port(d_in:in std_logic_vector (n-1 downto 0);
En : in std_logic;
sel : in std_logic_vector(1 downto 0);
d_out1:out std_logic_vector (n-1 downto 0);
d_out2:out std_logic_vector (n-1 downto 0);
d_out3:out std_logic_vector (n-1 downto 0);
d_out4:out std_logic_vector (n-1 downto 0));
 end component;
 signal d_in,d_out1,d_out2,d_out3,d_out4: std_logic_vector(7 downto 0);
 signal en: std_logic;
 signal sel :std_logic_vector(1 downto 0);
 begin
 test : demux port map(d_in,en,sel,d_out1,d_out2,d_out3,d_out4);
 process is begin
 en<='1';
 d_in<="01100110";
 sel<="00";
 wait for 10 ns;
 assert(d_out1)<="01100110" report " sel 00 test" severity warning;
 assert(d_out2)<="00000000" report " sel 00 test" severity warning;
 assert(d_out3)<="00000000" report " sel 00 test" severity warning;
 assert(d_out4)<="00000000" report " sel 00 test" severity warning;
 sel<="01";
 wait for 10 ns;
 assert(d_out1)<="00000000" report "sel 01 test" severity warning;
 assert(d_out2)<="01100110" report " sel 01 test" severity warning;
 assert(d_out3)<="00000000" report " sel 01 test" severity warning;
 assert(d_out4)<="00000000" report " sel 01 test" severity warning;
 sel<="10";
 d_in<="00001111";
 wait for 10 ns;
 assert(d_out1)<="00000000" report " sel 10 test" severity warning;
 assert(d_out2)<="00000000" report " sel 10 test" severity warning;
 assert(d_out3)<="00001111" report " sel 10 test" severity warning;
 assert(d_out4)<="00000000" report " sel 10 test" severity warning;
 sel<="11";
 d_in<="11111111";
 wait for 10 ns;
 assert(d_out1)<="00000000" report " sel 11 test" severity warning;
 assert(d_out2)<="00000000" report " sel 11 test" severity warning;
 assert(d_out3)<="00000000" report " sel 11 test" severity warning;
 assert(d_out4)<="11111111" report " sel 11 test" severity warning;
 sel<="00";
 d_in<="11111111";
 en<='0';
 wait for 10 ns;
 assert(d_out1)<="00000000" report "enable test" severity warning;
 assert(d_out2)<="00000000" report "enable test" severity warning;
 assert(d_out3)<="00000000" report "enable test" severity warning;
 assert(d_out4)<="11111111" report "enable test" severity warning;
 end process;
end architecture;

