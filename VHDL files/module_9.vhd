
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
entity router is
port( rst, wclock, rclock: in std_logic;
wr1,wr2,wr3,wr4:in std_logic;
datai1,datai2,datai3,datai4:in std_logic_vector (7 downto 0);
datao1,datao2,datao3,datao4:out std_logic_vector (7 downto 0));
end entity;
ARCHITECTURE behave of router is
component reg is
port( Clock,Clock_En,Reset: in std_logic ;
Data_in:in std_logic_vector (7 downto 0);
Data_out: out std_logic_vector (7 downto 0));
end component;
----------------------------
component demux is
generic (n: integer:=8);
port(d_in:in std_logic_vector (n-1 downto 0);
En : in std_logic;
sel : in std_logic_vector(1 downto 0);
d_out1:out std_logic_vector (n-1 downto 0);
d_out2:out std_logic_vector (n-1 downto 0);
d_out3:out std_logic_vector (n-1 downto 0);
d_out4:out std_logic_vector (n-1 downto 0));
end component;
----------------------------
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
--------------------------------------
component rr is
port( clock:in std_logic;
din1,din2,din3,din4:in std_logic_vector(7 downto 0);
dout:out std_logic_vector(7 downto 0));
end component;
----------------------------------------------
signal reg_out1,reg_out2,reg_out3,reg_out4:std_logic_vector (7 downto 0);
signal demux_out1,demux_out2,demux_out3,demux_out4:std_logic_vector (7 downto 0);
signal demux_out5,demux_out6,demux_out7,demux_out8:std_logic_vector (7 downto 0);
signal demux_out9,demux_out10,demux_out11,demux_out12:std_logic_vector (7 downto 0);
signal demux_out13,demux_out14,demux_out15,demux_out16:std_logic_vector (7 downto 0);
signal fifo_out1,fifo_out2,fifo_out3,fifo_out4,
fifo_out5,fifo_out6,fifo_out7,fifo_out8,
fifo_out9,fifo_out10,fifo_out11,fifo_out12,
fifo_out13,fifo_out14,fifo_out15,fifo_out16: std_logic_vector(7 downto 0);
signal empty1,empty2,empty3,empty4,empty5,empty6,empty7,empty8,
empty9,empty10,empty11,empty12,empty13,empty14,empty15,empty16:std_logic;
signal full1,full2,full3,full4,full5,full6,full7,full8,
full9,full10,full11,full12,full13,full14,full15,full16:std_logic;
BEGIN
r1:reg port map(wclock,wr1,rst,datai1,reg_out1);
r2:reg port map(wclock,wr2,rst,datai2,reg_out2);
r3:reg port map(wclock,wr3,rst,datai3,reg_out3);
r4:reg port map(wclock,wr4,rst,datai4,reg_out4);
d1:demux port map(reg_out1,wr1,reg_out1(1 downto 0),demux_out1,demux_out2,demux_out3,
demux_out4);
d2:demux port map(reg_out2,wr2,reg_out2(1 downto 0),demux_out5,demux_out6,demux_out7,
demux_out8);
d3:demux port map(reg_out3,wr3,reg_out3(1 downto 0),demux_out9,demux_out10,demux_out11,
demux_out12);
d4:demux port map(reg_out4,wr4,reg_out4(1 downto 0),demux_out13,demux_out14,demux_out15
,demux_out16);
f1: fifo port map(rst,wclock,wclock,'1',wr1,demux_out1,fifo_out1,empty1,full1);
f2: fifo port map(rst,wclock,wclock,'1',wr1,demux_out2,fifo_out2,empty2,full2);
f3: fifo port map(rst,wclock,wclock,'1',wr1,demux_out3,fifo_out3,empty3,full3);
f4: fifo port map(rst,wclock,wclock,'1',wr1,demux_out4,fifo_out4,empty4,full4);
f5: fifo port map(rst,wclock,wclock,'1',wr2,demux_out5,fifo_out5,empty5,full5);
f6: fifo port map(rst,wclock,wclock,'1',wr2,demux_out6,fifo_out6,empty6,full6);
f7: fifo port map(rst,wclock,wclock,'1',wr2,demux_out7,fifo_out7,empty7,full7);
f8: fifo port map(rst,wclock,wclock,'1',wr2,demux_out8,fifo_out8,empty8,full8);
f9: fifo port map(rst,wclock,wclock,'1',wr3,demux_out9,fifo_out9,empty9,full9);
f10: fifo port map(rst,wclock,wclock,'1',wr3,demux_out10,fifo_out10,empty10,full10);
f11: fifo port map(rst,wclock,wclock,'1',wr3,demux_out11,fifo_out11,empty11,full11);
f12: fifo port map(rst,wclock,wclock,'1',wr3,demux_out12,fifo_out12,empty12,full12);
f13: fifo port map(rst,wclock,wclock,'1',wr4,demux_out13,fifo_out13,empty13,full13);
f14: fifo port map(rst,wclock,wclock,'1',wr4,demux_out14,fifo_out14,empty14,full14);
f15: fifo port map(rst,wclock,wclock,'1',wr4,demux_out15,fifo_out15,empty15,full15);
f16: fifo port map(rst,wclock,wclock,'1',wr4,demux_out16,fifo_out16,empty16,full16);
rr1: rr port map(rclock,fifo_out1,fifo_out5,fifo_out9,fifo_out13,datao1);
rr2: rr port map(rclock,fifo_out2,fifo_out6,fifo_out10,fifo_out14,datao2);
rr3: rr port map(rclock,fifo_out3,fifo_out7,fifo_out11,fifo_out15,datao3);
rr4: rr port map(rclock,fifo_out4,fifo_out8,fifo_out12,fifo_out16,datao4);
end ARCHITECTURE;
