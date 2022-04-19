library ieee;
use ieee.std_logic_1164.all;
entity gconv_tb is
end entity;
architecture arch of gconv_tb is
component GrayToBinary is
 port(gray_in:in std_logic_vector(3 downto 0);
 b_out:out std_logic_vector(3 downto 0)
 );
end component;
signal gray_in,b_out:std_logic_vector(3 downto 0);
begin
gtb: GrayToBinary port map(gray_in,b_out);
process
begin
gray_in<="0000";
wait for 20 ns;
assert (b_out="0000") report"error converting to binary" severity warning;
gray_in<="1000";
wait for 20 ns;
assert (b_out="1111") report"error converting to binary" severity warning;
gray_in<="0100";
wait for 20 ns;
assert (b_out="0111") report"error converting to binary" severity warning;
gray_in<="0111";
wait for 20 ns;
assert (b_out="0101") report"error converting to binary" severity warning;
gray_in<="1100";
wait for 20 ns;
assert (b_out="1000") report"error converting to binary" severity warning;
gray_in<="1010";
wait for 20 ns;
assert (b_out="1100") report"error converting to binary" severity warning;
gray_in<="0001";
wait for 20 ns;
assert (b_out="0001") report"error converting to binary" severity warning;
gray_in<="0011";
wait for 20 ns;
assert (b_out="0010") report"error converting to binary" severity warning;
gray_in<="1001";
wait for 20 ns;
assert (b_out="1110") report"error converting to binary" severity warning;wait;
end process;
end architecture;

