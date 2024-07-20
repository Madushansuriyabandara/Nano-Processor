library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_TB is
--  Port ( );
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is

component Instruction_Decoder
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           ZeroFlag : in STD_LOGIC;
           AddSubSel : out STD_LOGIC;
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           Value : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSel : out STD_LOGIC;
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : out STD_LOGIC);
end component;

signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal ZeroFlag : STD_LOGIC;
signal AddSubSel : STD_LOGIC;
signal RegSel1 : STD_LOGIC_VECTOR (2 downto 0);
signal RegSel2 : STD_LOGIC_VECTOR (2 downto 0);
signal Value : STD_LOGIC_VECTOR (3 downto 0);
signal LoadSel : STD_LOGIC;
signal RegEn : STD_LOGIC_VECTOR (2 downto 0);
signal Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
signal Jump_Flag : STD_LOGIC;

begin

uut: Instruction_Decoder
    port map (
        Instruction => Instruction,
        ZeroFlag => ZeroFlag,
        AddSubSel => AddSubSel,
        RegSel1 => RegSel1,
        RegSel2 => RegSel2,
        Value => Value,
        LoadSel => LoadSel,
        RegEn => RegEn,
        Jump_Address => Jump_Address,
        Jump_Flag => Jump_Flag
    );
    
process
begin
    Instruction <= "100010001010"; -- MOVI 001 1010
    wait for 200ns;
    Instruction <= "001110100000"; -- ADD 111, 010 
    wait for 200ns;
    Instruction <= "011100000000"; -- NEG 110
    wait for 200ns;
    Instruction <= "111010000011"; -- JZR 101, 011
    ZeroFlag <= '0';
    wait for 200ns;
    Instruction <= "111010000011"; -- JZR 101, 011
    ZeroFlag <= '1';
    wait;
end process;

end Behavioral;