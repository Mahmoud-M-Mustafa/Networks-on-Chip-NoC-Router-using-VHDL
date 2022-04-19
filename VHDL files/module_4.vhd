LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY GrayCounter IS
GENERIC (N: integer := 4);
PORT (clock, reset, En: IN std_logic;
count_out: OUT std_logic_vector (N-1 DOWNTO 0));
END GrayCounter;
ARCHITECTURE beh OF GrayCounter IS
SIGNAL current_number, next_number, hold, next_hold: std_logic_vector (N-1 DOWNTO 0);
BEGIN
p1: PROCESS (clock)
BEGIN
IF (clock = '1' AND clock'EVENT) THEN
IF (reset = '1') THEN
current_number <= ("0000");
ELSIF (En = '1') THEN
current_number <= next_number;
END IF;
END IF;
END PROCESS;
hold <= current_number XOR ('0' & hold(N-1 DOWNTO 1));
next_hold <= std_logic_vector(unsigned(hold) + 1);
next_number <= next_hold XOR ('0' & next_hold(N-1 DOWNTO 1));
count_out <= current_number;
END beh;

