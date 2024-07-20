library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2Way_4Bit is
    Port ( Line0 : in STD_LOGIC_VECTOR (3 downto 0);
           Line1 : in STD_LOGIC_VECTOR (3 downto 0);
           LineSel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2Way_4Bit;

architecture Behavioral of Mux_2Way_4Bit is

begin

    LineOut(0) <= (Line0(0) AND NOT(LineSel)) OR (Line1(0) AND LineSel);
    LineOut(1) <= (Line0(1) AND NOT(LineSel)) OR (Line1(1) AND LineSel);
    LineOut(2) <= (Line0(2) AND NOT(LineSel)) OR (Line1(2) AND LineSel);
    LineOut(3) <= (Line0(3) AND NOT(LineSel)) OR (Line1(3) AND LineSel);

end Behavioral;