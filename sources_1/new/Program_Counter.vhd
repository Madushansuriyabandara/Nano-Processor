library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port (
        Input : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in  STD_LOGIC;
        Reset : in  STD_LOGIC;
        Output : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

component D_FF
    Port( D : in std_logic;
          Res : in std_logic;
          Clk : in std_logic;
          Q : out std_logic;
          Qbar : out std_logic);
end component;

begin

    D_FF0 : D_FF
        Port map ( 
            D => Input(0),
            Clk => Clk,
            Res => Reset,
            Q => Output(0)); 
    
    D_FF1 : D_FF
        Port map ( 
            D => Input(1),
            Clk => Clk,
            Res => Reset,
            Q => Output(1)); 
    
    D_FF2 : D_FF
        Port map (
            D => Input(2),
            Clk => Clk,
            Res => Reset,
            Q => Output(2)); 

end Behavioral;