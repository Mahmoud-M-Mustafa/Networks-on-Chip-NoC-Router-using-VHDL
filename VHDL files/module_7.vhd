library ieee;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL;
Entity FIFO is
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
end FIFO;
architecture struct of FIFO is
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
---------------------
component ram is
port(wea,rea,clka,clkb: in std_logic ;
addra,addrb: in std_logic_vector (2 downto 0);
d_in: in std_logic_vector (7 downto 0);
d_out: out std_logic_vector (7 downto 0));
end component;
----------------------------
signal read_valid,write_valid : std_logic;
signal wr_ptr,rd_ptr : std_logic_vector (2 downto 0);
---------------------------
begin
controller : FIFO_controller port map(reset,rdclk,wrclk,rreq,wreq,write_valid,
read_valid,wr_ptr,rd_ptr,empty,full);
memory : ram port map(write_valid,read_valid,wrclk,rdclk,wr_ptr,rd_ptr,
data_in,data_out);
end architecture;

