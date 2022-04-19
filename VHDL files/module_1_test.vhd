library ieee;
use ieee.std_logic_1164.all;
entity reg_tb is
end entity;
Architecture test of reg_tb is
component reg is
 port( Clock,Clock_En,Reset: in std_logic ;
 Data_in:in std_logic_vector (7 downto 0);
 Data_out: out std_logic_vector (7 downto 0));
end component;
signal Clock,Clock_En,Reset: std_logic;
signal data_out,Data_in: std_logic_vector (7 downto 0);
Begin
dut: reg port map(Clock,Clock_En,Reset,data_in,data_out);
process
begin
 Clock <='0';
 wait for 10 ns;
 Clock <='1';
 wait for 10 ns;
end process;
process
begin
reset <= '1';
wait for 20 ns;
assert ( data_out ="00000000") report "error in reset" severity warning;
reset <='0';
data_in<="00000001";
clock_en<='1';
wait for 20 ns;
assert ( data_out ="00000001") report "error in data 1" severity warning;
data_in<="00000010";
wait for 20 ns;
assert ( data_out ="00000010") report "error in data 2" severity warning;
data_in<="00000011";
wait for 20 ns;
assert ( data_out ="00000011") report "error in data 3" severity warning;
data_in<="00000100";
wait for 20 ns;
assert ( data_out ="00000100") report "error in data 4" severity warning;
data_in<="10000010";
wait for 20 ns;
assert ( data_out ="10000010") report "error in data 130" severity warning;
data_in<="00111010";
wait for 20 ns;
assert ( data_out ="00111010") report "error in data 58" severity warning;
clock_en<='0';
wait for 20 ns;
assert ( data_out ="00111010") report "error in preserving data 58" severity warning;
data_in<="11111001";
clock_en<='1';
wait for 20 ns;
assert ( data_out ="11111001") report "error in data 249" severity warning;
reset<='1';
wait for 20 ns;
assert ( data_out ="00000000") report "error in reset" severity warning;
end process;
end architecture ;

