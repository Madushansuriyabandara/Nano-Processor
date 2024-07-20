library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ProgramROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

SIGNAL ROM : rom_type := (
    "100010000011", -- 0    (MOVI R1 3  -  10 001 000 0011
    "100100000001", -- 1    (MOVI R2 1  -  10 010 000 0001
    "010100000000", -- 2    (NEG R2     -  01 010 000 0000
    "001110010000", -- 3    (ADD R7 R1  -  00 111 001 0000
    "000010100000", -- 4    (ADD R1 R2  -  00 001 010 0000
    "110010000111", -- 5    (JZR R1 7   -  11 001 000 0111
    "110000000011", -- 6    (JZR R0 3   -  11 000 000 0011
    "000000000000"  -- 7
    );

begin

process(address)
begin
    data <= ROM(to_integer(unsigned(address)));
end process;
    
end Behavioral;