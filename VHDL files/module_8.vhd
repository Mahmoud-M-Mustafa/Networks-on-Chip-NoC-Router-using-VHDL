library ieee;
use ieee.std_logic_1164.all;
entity rr is
port( clock:in std_logic;
din1,din2,din3,din4:in std_logic_vector(7 downto 0);
dout:out std_logic_vector(7 downto 0));
end entity;
architecture behave of rr is
Type state is (s1,s2,s3,s4);
signal current_state:state :=s1;
signal next_state:state;
BEGIN
process(clock)
begin
if rising_edge(clock) then
current_state <= next_state;
end if;
end process;
process(current_state)
begin
case current_state is
when s1 =>
next_state<=s2;
dout<=din2;
when s2 =>
next_state<=s3;
dout<=din3;
when s3 =>
next_state<=s4;
dout<=din4;
when s4 =>
next_state<=s1;
dout<=din1;
end case;
end process;
end architecture;library ieee;
use ieee.std_logic_1164.all;
entity rr is
port( clock:in std_logic;
din1,din2,din3,din4:in std_logic_vector(7 downto 0);
dout:out std_logic_vector(7 downto 0));
end entity;
architecture behave of rr is
Type state is (s1,s2,s3,s4);
signal current_state:state :=s1;
signal next_state:state;
BEGIN
process(clock)
begin
if rising_edge(clock) then
current_state <= next_state;
end if;
end process;
process(current_state)
begin
case current_state is
when s1 =>
next_state<=s2;
dout<=din2;
when s2 =>
next_state<=s3;
dout<=din3;
when s3 =>
next_state<=s4;
dout<=din4;
when s4 =>
next_state<=s1;
dout<=din1;
end case;
end process;
end architecture;
Module 9
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
entity router is
port( rst, wclock, rclock: in std_logic;
wr1,wr2,wr3,wr4:in std_logic;
datai1,datai2,dat
