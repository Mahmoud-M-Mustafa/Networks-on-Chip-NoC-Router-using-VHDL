library ieee;
use ieee.std_logic_1164.all;
entity reg is
port( Clock,Clock_En,Reset: in std_logic ;
Data_in:in std_logic_vector (7 downto 0);
Data_out: out std_logic_vector (7 downto 0));
end entity reg;
architecture behave of reg is
BEGIN
process (Clock,Clock_En,Reset)
begin
if(Reset='1') then
Data_out <="00000000";
elsif ( rising_edge(Clock)) then
if(Clock_En='1') then
Data_out <= Data_in;
end if;
end if;
end process;
end architecture;

