library ieee;
use ieee.std_logic_1164.all;
entity fifo_c_test is
end entity;
architecture test of fifo_c_test is
 component FIFO_Controller is
 port ( reset: in std_logic;
 rdclk: in std_logic;
 wrclk: in std_logic;
 rreq: in std_logic;
 wreq: in std_logic;
 write_valid: out std_logic;
 read_valid: out std_logic;
 wr_ptr: out std_logic_vector ( 2 downto 0 );
 rd_ptr: out std_logic_vector ( 2 downto 0);
 empty: out std_logic; --flag
 full: out std_logic --flag
 );
 end component;
 signal reset,rdclk,wrclk,rreq,wreq,write_valid,read_valid,empty,full : std_logic;
 signal wr_ptr,rd_ptr : std_logic_vector(2 downto 0);
 begin
 controller : FIFO_controller port map(reset,rdclk,wrclk,rreq,wreq,write_valid,read_
valid,wr_ptr,rd_ptr,empty,full);
 rclk: process is begin
 rdclk<='0','1' after 10 ns;
 wait for 20 ns;
 end process;
 wclk : process is begin
 wrclk<='0','1' after 10 ns;
 wait for 20 ns;
 end process;
 x: process is begin
 reset<='1';
 wait for 10 ns;-- after 10ns
 assert write_valid='1' report "write valid reset check" severity warning;
  assert read_valid='0' report "read valid reset check" severity warning;
 assert empty='1' report "empty reset check" severity warning;
 assert full='0' report "full reset check" severity warning;
 wait for 10 ns;
 rreq<='1';
 reset<='0';
 wait for 10 ns;
 assert read_valid='0' report "cant read before writing" severity warning;
 wait for 10 ns;
 reset<='0';
 wreq<='1';
 rreq<='1';
 wait for 10 ns;-- after 30ns
 assert write_valid='1' report "first write valid check" severity warning;
 assert empty='0' report "first empty check" severity warning;
 assert full='0' report "first full check" severity warning;
 assert wr_ptr="000" report "first write pointer check" severity warning;
 wait for 20 ns;-- after 50ns
 assert write_valid='1' report "second write valid check" severity warning;
 assert read_valid='1' report "second read valid check" severity warning;
 assert empty='0' report "second empty check" severity warning;
 assert full='0' report "second full check" severity warning;
 assert wr_ptr="001" report "second write pointer check" severity warning;
 assert rd_ptr="000" report "first read pointer check" severity warning;
 wait for 20 ns;
 assert write_valid='1' report "second write valid check" severity warning;
 assert read_valid='1' report "second read valid check" severity warning;
 assert empty='0' report "second empty check" severity warning;
 assert full='0' report "second full check" severity warning;
 assert wr_ptr="010" report "second write pointer check" severity warning;
 assert rd_ptr="000" report "first read pointer check" severity warning;
 wait for 20 ns;-- after 70ns
 assert write_valid='1' report "third write valid check" severity warning;
 assert read_valid='1' report "third read valid check" severity warning;
 assert empty='0' report "third empty check" severity warning;
 assert full='0' report "third full check" severity warning;
 assert wr_ptr="011" report "third write pointer check" severity warning;
 assert rd_ptr="001" report "third read pointer check" severity warning;
 wait for 20 ns;-- after 90ns
 assert write_valid='1' report "fourth write valid check" severity warning;
 assert read_valid='1' report "fourth read valid check" severity warning;
 assert empty='0' report "fourth empty check" severity warning;
 assert full='0' report "fourth full check" severity warning;
 assert wr_ptr="100" report "fourth write pointer check" severity warning;
 assert rd_ptr="010" report "fourth read pointer check" severity warning;
 wait for 20 ns;-- after 110ns
 assert write_valid='1' report "fifth write valid check" severity warning;
  assert read_valid='1' report "fifth read valid check" severity warning;
 assert empty='0' report "fifth empty check" severity warning;
 assert full='0' report "fifth full check" severity warning;
 assert wr_ptr="101" report "fifth write pointer check" severity warning;
 assert rd_ptr="011" report "fifth read pointer check" severity warning;
 wait for 20 ns;-- after 130ns
 assert write_valid='1' report "sixth write valid check" severity warning;
 assert read_valid='1' report "sixth read valid check" severity warning;
 assert empty='0' report "sixth empty check" severity warning;
 assert full='0' report "sixth full check" severity warning;
 assert wr_ptr="110" report "sixth write pointer check" severity warning;
 assert rd_ptr="100" report "sixth read pointer check" severity warning;
 wait for 20 ns;-- after 150ns
 assert write_valid='1' report "seventh write valid check" severity warning;
 assert read_valid='1' report "seventh read valid check" severity warning;
 assert empty='0' report "seventh empty check" severity warning;
 assert full='0' report "seventh full check" severity warning;
 assert wr_ptr="111" report "seventh write pointer check" severity warning;
 assert rd_ptr="101" report "seventh read pointer check" severity warning;
 wreq<='0';
 wait for 40 ns;
 rreq<='0';
 wait for 20 ns;-- after 150ns
 assert write_valid='0' report "8th write valid check" severity warning;
 assert read_valid='0' report "8th read valid check" severity warning;
 assert empty='0' report "8th empty check" severity warning;
 assert full='1' report "8th full check" severity warning;
 assert wr_ptr="111" report "8th write pointer check" severity warning;
 assert rd_ptr="111" report "8th read pointer check" severity warning;
 wait for 10000 ns;
end process;
end architecture;
