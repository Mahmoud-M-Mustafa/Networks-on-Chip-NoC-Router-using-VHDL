library ieee;
use IEEE.std_logic_1164.all;
Entity FIFO_Controller is
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
end FIFO_Controller;
Architecture behave of FIFO_Controller is
Component GrayCounter IS
GENERIC (N: integer := 4);
PORT (clock, reset, En: IN std_logic;
count_out: OUT std_logic_vector (N-1 DOWNTO 0));
END component;
Component GrayToBinary is
port(gray_in:in std_logic_vector(3 downto 0);
b_out:out std_logic_vector(3 downto 0)
);
end Component;
signal read_counter_output: std_logic_vector (3 DOWNTO 0);
signal write_counter_output: std_logic_vector (3 DOWNTO 0);
signal read_rst: std_logic;
signal read_en: std_logic;
signal write_rst: std_logic;
signal write_en: std_logic;
signal read_converter_output: std_logic_vector (3 downto 0);
signal write_converter_output: std_logic_vector (3 downto 0);
signal write_v :std_logic;
signal read_v :std_logic;
signal s_empty: std_logic;
signal s_full : std_logic;
begin
Countv1: GrayCounter Port Map (rdclk,read_rst,read_en, read_counter_output); --read
Countv2: GrayCounter Port Map (wrclk,write_rst,write_en , write_counter_output); --write
Conv1: GrayToBinary Port Map (read_counter_output, read_converter_output);
Conv2: GrayToBinary Port Map (write_counter_output, write_converter_output);
p: process (rreq, wreq, reset,rdclk,wrclk)
begin
if(reset='1') then
write_v<='1';
read_rst<='1';
write_rst<='1';
read_en<='0';
write_en<='1';
s_empty<='1';
s_full<='0';
wr_ptr<="000";---
rd_ptr<="000";---
else
read_rst<='0';
write_rst<='0';
if(write_converter_output="UUUU") then---
s_empty<='1';
else
s_empty<='0';
end if;
if(rreq='1' and read_v='1') then
read_en<='1';
rd_ptr<=read_converter_output(2 downto 0);
else
read_en<='0';
end if;
if( wreq='1' and write_v='1') then
write_en<='1';
wr_ptr<=write_converter_output( 2 downto 0);
else
write_en<='0';
end if;
if(s_empty='1') then
read_v<='0';
elsif(write_converter_output=read_converter_output) then
read_v<='0';
read_en<='0';
elsif(read_converter_output="1000") then---
read_v<='0';
read_en<='0';
else
read_v<='1';
end if;
if(write_converter_output="1000") then----
AIN SHAMS UNIVERSITY
I-Credit Hours Engineering Programs (i.CHEP)
28 | Page
s_full<='1';
write_v<='0';
write_en<='0';
else
write_v<='1';
s_full<='0';
end if;
end if;
end process;
write_valid<=write_v;
read_valid<=read_v;
empty<=s_empty;
full<=s_full;
end architecture;
