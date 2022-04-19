library ieee;
use ieee.std_logic_1164.all;
entity GrayToBinary is
port(gray_in:in std_logic_vector(3 downto 0);
b_out:out std_logic_vector(3 downto 0)
);
end entity;
architecture arch of GrayToBinary is
begin
b_out(0)<=gray_in(3) xor gray_in(2) xor gray_in(1) xor gray_in(0);
b_out(1)<=gray_in(3) xor gray_in(2) xor gray_in(1);
b_out(2)<=gray_in(3) xor gray_in(2);
b_out(3)<=gray_in(3);
end arch;

