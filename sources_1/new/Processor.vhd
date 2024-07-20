library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           An : out STD_LOGIC_VECTOR (3 downto 0);
           Display : out STD_LOGIC_VECTOR (6 downto 0));
end Processor;

architecture Behavioral of Processor is

component ProgramROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Program_Counter
    Port ( Input : in std_logic_vector (2 downto 0);
           Clk : in  std_logic;
           Reset : in  std_logic;
           Output : out std_logic_vector(2 downto 0));
end component;

component RCA_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;

component Mux_2Way_3Bit
    Port ( Line0 : in STD_LOGIC_VECTOR (2 downto 0);
           Line1 : in STD_LOGIC_VECTOR (2 downto 0);
           LineSel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (2 downto 0));
end component;

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

component Mux_2Way_4Bit
    Port ( Line0 : in STD_LOGIC_VECTOR (3 downto 0);
           Line1 : in STD_LOGIC_VECTOR (3 downto 0);
           LineSel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_Unit
    Port ( A : in STD_LOGIC_vector (3 downto 0);
           B : in STD_LOGIC_vector (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_vector(3 downto 0);
           C_out : out STD_LOGIC;
           Zero_Flag : out STD_LOGIC;
           V : out STD_LOGIC);
end component;

component Mux_8Way_4Bit
    Port ( RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_vector(3 downto 0));
end component;

component Reg_Bank
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Out0 : out STD_LOGIC_VECTOR (3 downto 0);
           Out1 : out STD_LOGIC_VECTOR (3 downto 0);
           Out2 : out STD_LOGIC_VECTOR (3 downto 0);
           Out3 : out STD_LOGIC_VECTOR (3 downto 0);
           Out4 : out STD_LOGIC_VECTOR (3 downto 0);
           Out5 : out STD_LOGIC_VECTOR (3 downto 0);
           Out6 : out STD_LOGIC_VECTOR (3 downto 0);
           Out7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

SIGNAL AdderOut, PC_Out, MUX_2_3_Out, RegSel1, RegSel2, RegEn  : std_logic_vector (2 downto 0);
SIGNAL MUX_2_4_Out, Value, AddSub_Out : std_logic_vector (3 downto 0);
SIGNAL ROM_Out : std_logic_vector (11 downto 0);
SIGNAL AdderCarry : std_logic;
SIGNAL sClk, Jump_Flag, AddSub_ZF, LoadSel, AddSubSel, C_out : std_logic;
SIGNAL Jump_Address : std_logic_vector (2 downto 0);
SIGNAL Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 : std_logic_vector (3 downto 0);
SIGNAL MUX_8_4_A_Out, MUX_8_4_B_Out : std_logic_vector (3 downto 0);

begin

    Slow_Clk_0 : Slow_Clk
        port map (
            Clk_in => Clk,
            Clk_out => sClk);
    
    PC : Program_Counter
        port map (
            Input => MUX_2_3_Out,
            Clk => sClk,
            Reset => Reset,
            Output => PC_Out);
    
    Adder : RCA_3
        port map (
            A => PC_Out,
            S => AdderOut,
            C_out => AdderCarry);
    
    MUX_23 : Mux_2Way_3Bit
        port map (
            Line0 => AdderOut,
            Line1 => Jump_Address,
            LineSel => Jump_Flag,
            LineOut => MUX_2_3_Out);
    
    PR : ProgramROM
        port map (
            address => PC_Out,
            data => ROM_Out);
    
    LUT_7seg : LUT_16_7
        port map (
            address => Reg7,
            data => Display);
    
    MUX_24 : Mux_2Way_4Bit
        port map (
            Line0 => AddSub_Out,
            Line1 => Value,
            LineSel => LoadSel,
            LineOut => MUX_2_4_Out);
    
    ID : Instruction_Decoder 
        port map (
            Instruction => ROM_Out, 
            ZeroFlag => AddSub_ZF,
            AddSubSel => AddSubSel,
            RegSel1 => RegSel1,
            RegSel2 => RegSel2,
            Value => Value,
            LoadSel => LoadSel,
            RegEn => RegEn,
            Jump_Address => Jump_Address,
            Jump_Flag => Jump_Flag);
    
    AddSub : Add_Sub_Unit 
        port map (
            A => MUX_8_4_B_Out,
            B => MUX_8_4_A_Out,
            M => AddSubSel,
            S => AddSub_Out,
            C_out => C_out,
            Zero_Flag => AddSub_ZF,
            V => Overflow);
    
    MUX_84_A : Mux_8Way_4Bit
        port map (
            RegSel => RegSel1, 
            Reg0 => Reg0,
            Reg1 => Reg1,
            Reg2 => Reg2,
            Reg3 => Reg3,
            Reg4 => Reg4,
            Reg5 => Reg5,
            Reg6 => Reg6,
            Reg7 => Reg7,
            S => MUX_8_4_A_Out);
                    
    MUX_84_B : Mux_8Way_4Bit
        port map (
            RegSel => RegSel2, 
            Reg0 => Reg0,
            Reg1 => Reg1,
            Reg2 => Reg2,
            Reg3 => Reg3,
            Reg4 => Reg4,
            Reg5 => Reg5,
            Reg6 => Reg6,
            Reg7 => Reg7,
            S => MUX_8_4_B_Out);
                                  
    RB : Reg_Bank 
        port map (
            D => MUX_2_4_Out,
            RegEn => RegEn,
            Reset => Reset,
            Clk => sClk,
            Out0 => Reg0,
            Out1 => Reg1,
            Out2 => Reg2,
            Out3 => Reg3,
            Out4 => Reg4,
            Out5 => Reg5,
            Out6 => Reg6,
            Out7 => Reg7);
                    
process(AddSub_ZF)
begin
    ZeroFlag <= AddSub_ZF;
end process;

    An <= "1110"; --Anode output

process(Reg7)
begin
    LED <= Reg7;
end process;

end Behavioral;