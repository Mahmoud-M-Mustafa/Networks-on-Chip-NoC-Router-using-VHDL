library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
entity routertb is
end entity;
architecture behave of routertb is
component router is
port( rst, wclock, rclock: in std_logic;
wr1,wr2,wr3,wr4:in std_logic;
datai1,datai2,datai3,datai4:in std_logic_vector (7 downto 0);
datao1,datao2,datao3,datao4:out std_logic_vector (7 downto 0));
end component;
signal rst, wclock, rclock,wr1,wr2,wr3,wr4: std_logic;
signal datai1,datai2,datai3,datai4,datao1,datao2,datao3,datao4:std_logic_vector (7 down
to 0);
BEGIN
rout: router port map(rst, wclock, rclock,wr1,wr2,wr3,wr4,datai1,datai2,datai3,
datai4,datao1,datao2,datao3,datao4);
process
begin
rclock<='0'; wait for 5 ns;
rclock<='1'; wait for 5 ns;
end process;
process
begin ---- write clock cycle should be 4* read clock cycle
wclock <='0';
wait for 20 ns;
wclock <='1';
wait for 20 ns;
end process;
process
begin
rst<='1';
wait for 20 ns;
--reset check
assert datao1="UUUUUUUU" report "reset error" severity warning;
assert datao2="UUUUUUUU" report "reset error" severity warning;
assert datao3="UUUUUUUU" report "reset error" severity warning;
assert datao4="UUUUUUUU" report "reset error" severity warning;
wait for 20 ns;
rst<='0';
wr1<='0';wr2<='0';wr3<='0';wr4<='0';
datai1<="10000000";
datai2<="01010110";
datai3<="10101010";
datai4<="11001100";
wait for 40 ns;
--random input
wr1<='1';wr2<='1';wr3<='1';wr4<='1';
wait for 40 ns;
--random input
datai1<="00000011";
datai2<="01010101";
datai3<="10101011";
datai4<="11001101";
wait for 40 ns;
--test case for all inputs enter different scheduler
datai1<="01010100";
datai2<="00110001";
datai3<="10101010";
datai4<="00011111";
wait for 40 ns;
--test case for all inputs enter a single scheduler
datai1<="00011110";
datai2<="01011110";
datai3<="10011110";
datai4<="11011110";
wait for 30 ns;
--this assertion turning into true validates the wr test case
--the output is propagated after one extra cycle of write clock
assert datao1="10000000" report "1st error" severity warning;
assert datao2="00000000" report "1st error" severity warning;
assert datao3="00000000" report "1st error" severity warning;
assert datao4="00000000" report "1st error" severity warning;
wait for 10 ns;
assert datao3="01010110" report "2nd error" severity warning;
assert datao2="00000000" report "2nd error" severity warning;
assert datao1="00000000" report "2nd error" severity warning;
assert datao4="00000000" report "2nd error" severity warning;
wait for 10 ns;
assert datao3="10101010" report "3rd error" severity warning;
assert datao2="00000000" report "3rd error" severity warning;
assert datao1="00000000" report "3rd error" severity warning;
assert datao4="00000000" report "3rd error" severity warning;
wait for 10 ns;
assert datao1="11001100" report "4th error" severity warning;
assert datao2="00000000" report "4th error" severity warning;
assert datao3="00000000" report "4th error" severity warning;
assert datao4="00000000" report "4th error" severity warning;
wait for 10 ns;
assert datao4="00000011" report "5th error" severity warning;
assert datao2="00000000" report "5th error" severity warning;
assert datao1="00000000" report "5th error" severity warning;
assert datao3="00000000" report "5th error" severity warning;
wait for 10 ns;
assert datao2="01010101" report "6th error" severity warning;
assert datao3="00000000" report "6th error" severity warning;
assert datao1="00000000" report "6th error" severity warning;
assert datao4="00000000" report "6th error" severity warning;
wait for 10 ns;
assert datao4="10101011" report "7th error" severity warning;
assert datao2="00000000" report "7th error" severity warning;
assert datao1="00000000" report "7th error" severity warning;
assert datao3="00000000" report "7th error" severity warning;
wait for 10 ns;
assert datao2="11001101" report "8th error" severity warning;
assert datao3="00000000" report "8th error" severity warning;
assert datao1="00000000" report "8th error" severity warning;
assert datao4="00000000" report "8th error" severity warning;
wait for 10 ns;
assert datao1="01010100" report "9th error" severity warning;
assert datao2="00000000" report "9th error" severity warning;
assert datao3="00000000" report "9th error" severity warning;
assert datao4="00000000" report "9th error" severity warning;
wait for 10 ns;
assert datao2="00110001" report "10th error" severity warning;
assert datao3="00000000" report "10th error" severity warning;
assert datao1="00000000" report "10th error" severity warning;
assert datao4="00000000" report "10th error" severity warning;
wait for 10 ns;
assert datao3="10101010" report "11th error" severity warning;
assert datao2="00000000" report "11th error" severity warning;
assert datao1="00000000" report "11th error" severity warning;
assert datao4="00000000" report "11th error" severity warning;
wait for 10 ns;
assert datao4="00011111" report "12th error" severity warning;
assert datao2="00000000" report "12th error" severity warning;
assert datao1="00000000" report "12th error" severity warning;
assert datao3="00000000" report "12th error" severity warning;
wait for 10 ns;
assert datao3="00011110" report "13th error" severity warning;
assert datao2="00000000" report "13th error" severity warning;
assert datao1="00000000" report "13th error" severity warning;
assert datao4="00000000" report "13th error" severity warning;
wait for 10 ns;
assert datao3="01011110" report "14th error" severity warning;
assert datao2="00000000" report "14th error" severity warning;
assert datao1="00000000" report "14th error" severity warning;
assert datao4="00000000" report "14th error" severity warning;
wait for 10 ns;
assert datao3="10011110" report "15th error" severity warning;
assert datao2="00000000" report "15th error" severity warning;
assert datao1="00000000" report "15th error" severity warning;
assert datao4="00000000" report "15th error" severity warning;
wait for 10 ns;
assert datao3="11011110" report "16th error" severity warning;
assert datao2="00000000" report "16th error" severity warning;
assert datao1="00000000" report "16th error" severity warning;
assert datao4="00000000" report "16th error" severity warning;
wait;
end process;
end architecture;
