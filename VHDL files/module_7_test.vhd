library ieee;
use ieee.std_logic_1164.all;
entity module_7_test is
end entity;
architecture test of module_7_test is
component FIFO is
 port ( reset: in std_logic;
 rdclk: in std_logic;
 wrclk: in std_logic;
 rreq: in std_logic;
 wreq: in std_logic;
 data_in : in std_logic_vector(7 downto 0);
 data_out: out std_logic_vector(7 downto 0);
 empty: out std_logic; --flag
 full: out std_logic --flag
 );
 end component;
 signal reset,rdclk,wrclk,rreq,wreq,empty,full: std_logic;
 signal data_in,data_out:std_logic_vector(7 downto 0);
 begin
 i1 : FIFO port map(reset,rdclk,wrclk,rreq,wreq,data_in,data_out,empty,full);
 rclk: process is begin
 rdclk<='0','1' after 10 ns;
 wait for 20 ns;
 end process;
 wclk : process is begin
 wrclk<='0','1' after 10 ns;
 wait for 20 ns;
 end process;
 process is begin
 reset<='1';
 rreq<='1';
 wreq<='1';
 data_in<="01010101";
 assert data_out<="UUUUUUUU" report "reset check" severity warning;
 wait for 20 ns;
 reset<='0';
 wait for 20 ns;
 assert data_out<="01010101" report "first data" severity warning;
 data_in<="10101010";
 wait for 20 ns;
 data_in<="00000000";
 wait for 20 ns;
 data_in<="11111110";
 wait for 20 ns;
 assert data_out<="10101010" report "second data" severity warning;
 data_in<="11111110";
 wait for 20 ns;
 assert data_out<="00000000" report "third data" severity warning;
 data_in<="11110110";
 wait for 20 ns;
 assert data_out<="11111110" report "fourth data" severity warning;
 data_in<="10111110";
 wait for 20 ns;
 wait for 20 ns;
 assert data_out<="11110110" report "fifth data" severity warning;
 wait for 20 ns;
 assert data_out<="10111110" report "sixth data" severity warning;
 wreq<='0';rreq<='0';
 data_in<="11001100";
 wait for 60 ns;
 assert data_out<="11110010" report "request check" severity warning;

wait;
 end process;
end architecture;
