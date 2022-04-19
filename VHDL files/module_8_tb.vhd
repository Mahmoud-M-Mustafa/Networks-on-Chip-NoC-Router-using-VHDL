library ieee;
use ieee.std_logic_1164.all;
entity rr_test is
end entity;
Architecture behave of rr_test is
component rr is
 port( clock:in std_logic;
 din1,din2,din3,din4:in std_logic_vector(7 downto 0);
 dout:out std_logic_vector(7 downto 0));
end component;
signal clock:std_logic;
signal din1,din2,din3,din4,dout: std_logic_vector(7 downto 0);
BEGIN
robin: rr port map(clock,din1,din2,din3,din4,dout);
process
begin
 clock<='0';
 wait for 10 ns;
 clock<='1';
 wait for 10 ns;
end process;
process
begin
din1<= "00000001"; din2 <= "00000011"; din3<= "00001111"; din4 <="11110000";
wait for 21 ns;
assert(dout="00001111") report "error in s3" severity warning;
wait for 21 ns;
assert(dout="11110000") report "error in s4" severity warning;
wait for 21 ns;
assert(dout="00000001") report "error in s1" severity warning;
wait for 21 ns;
assert(dout="00000011") report "error in s2" severity warning;
wait for 21 ns;
assert(dout="00001111") report "error in s3 second time" severity warning;
wait;
end process;
end architecture;

