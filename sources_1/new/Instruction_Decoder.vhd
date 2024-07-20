library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
    
    -- base case
    RegEn <= Instruction(9 downto 7);
    RegSel1 <= Instruction(9 downto 7);
    RegSel2 <= Instruction(6 downto 4);
    
    -- jump case
    Jump_Address <= Instruction(2 downto 0);
    Jump_Flag <= Instruction(11) AND Instruction(10) AND ZeroFlag; -- using zeroflag to check if a register is zero
    
    -- move case
    LoadSel <= Instruction(11) AND NOT(Instruction(10));
    Value <= Instruction(3 downto 0);
    
    -- add, sub case
    AddSubSel <= NOT(Instruction(11)) AND Instruction(10);
    
end Behavioral;