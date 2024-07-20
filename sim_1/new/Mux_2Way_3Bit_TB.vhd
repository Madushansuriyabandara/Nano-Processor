library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2Way_3Bit_TB is
--  Port ( );
end Mux_2Way_3Bit_TB;

architecture Behavioral of Mux_2Way_3Bit_TB is
Component Mux_2Way_3Bit
    Port ( Line0 : in STD_LOGIC_VECTOR (2 downto 0);
           Line1 : in STD_LOGIC_VECTOR (2 downto 0);
           LineSel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (2 downto 0));
end Component;

signal line0, line1, lineOut : std_logic_vector (2 downto 0);
signal LineSel : std_logic;

begin
UUT: Mux_2Way_3Bit PORT MAP(                                                                   
    Line0 => line0,
    Line1 => line1,
    LineSel => LineSel,
    LineOut => lineOut                                                                                                                                                   
);

process
    begin
        line0 <= "110";
        line1 <= "100";
        LineSel <= '0';
        wait for 500ns;
        LineSel <= '1';
        wait;
    end process;

end Behavioral;