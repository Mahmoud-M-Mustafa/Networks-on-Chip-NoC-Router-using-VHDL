LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY gc_tb IS
END entity;
ARCHITECTURE behave OF gc_tb IS
component GrayCounter IS
 GENERIC (N: integer := 4);
 PORT (clock, reset, En: IN std_logic;
 count_out: OUT std_logic_vector (N-1 DOWNTO 0));
END component;
 SIGNAL clock, reset, En: std_logic;
 SIGNAL count_out : std_logic_vector(3 DOWNTO 0);
BEGIN
 Comp: GrayCounter PORT MAP (clock, reset, En, count_out);

process
 BEGIN
 clock <= '1'; WAIT FOR 10 ns;
 clock <= '0'; WAIT FOR 10 ns;
 END process ;

process
 BEGIN
reset<='1'; en<='1';
wait for 20 ns;
assert(count_out ="0000") report" error in reset" severity warning;reset<='0';
wait for 20 ns;
assert(count_out ="0001") report" error in counting 0001" severity warning;
wait for 20 ns;
assert(count_out ="0011") report" error in counting 0011" severity warning;
wait for 20 ns;
assert(count_out ="0010") report" error in counting 0010" severity warning;
wait for 20 ns;
assert(count_out ="0110") report" error in counting 0110" severity warning;
wait for 20 ns;
assert(count_out ="0111") report" error in counting 0111" severity warning;
en<='0';
wait for 20 ns;
assert(count_out ="0111") report" error in turning enable off" severity warning;
reset<='1'; en<='1';
wait for 20 ns;
assert(count_out ="0000") report" error in reset v2" severity warning;
 WAIT;
END process ;
end architecture;

