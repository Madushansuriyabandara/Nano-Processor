library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8Way_4Bit is
    Port (  RegSel : in STD_LOGIC_VECTOR (2 downto 0);
            Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
            S : out STD_LOGIC_vector(3 downto 0));
end Mux_8Way_4Bit;

architecture Behavioral of Mux_8Way_4Bit is

begin
    S(0) <= ( NOT(RegSel(0) or RegSel(1) or RegSel(2)) AND Reg0(0) ) OR
            ( NOT(RegSel(1) or RegSel(2)) AND RegSel(0) AND Reg1(0) ) OR
            ( NOT(RegSel(0) or RegSel(2)) AND RegSel(1) AND Reg2(0) ) OR
            ( NOT(RegSel(2)) AND RegSel(0) AND RegSel(1) AND Reg3(0) ) OR
            ( NOT(RegSel(1) or RegSel(0)) AND RegSel(2) AND Reg4(0) ) OR
            ( NOT(RegSel(1)) AND RegSel(0) AND RegSel(2) AND Reg5(0) ) OR
            ( NOT(RegSel(0)) AND RegSel(1) AND RegSel(2) AND Reg6(0) ) OR
            ( RegSel(0) AND RegSel(1) AND RegSel(2) AND Reg7(0) );  
           
    S(1) <= ( NOT(RegSel(0) or RegSel(1) or RegSel(2)) AND Reg0(1) ) OR
            ( NOT(RegSel(1) or RegSel(2)) AND RegSel(0) AND Reg1(1) ) OR
            ( NOT(RegSel(0) or RegSel(2)) AND RegSel(1) AND Reg2(1) ) OR
            ( NOT(RegSel(2)) AND RegSel(0) AND RegSel(1) AND Reg3(1) ) OR
            ( NOT(RegSel(1) or RegSel(0)) AND RegSel(2) AND Reg4(1) ) OR
            ( NOT(RegSel(1)) AND RegSel(0) AND RegSel(2) AND Reg5(1) ) OR
            ( NOT(RegSel(0)) AND RegSel(1) AND RegSel(2) AND Reg6(1) ) OR
            ( RegSel(0) AND RegSel(1) AND RegSel(2) AND Reg7(1) );  
                   
    S(2) <= ( NOT(RegSel(0) or RegSel(1) or RegSel(2)) AND Reg0(2) ) OR
            ( NOT(RegSel(1) or RegSel(2)) AND RegSel(0) AND Reg1(2) ) OR
            ( NOT(RegSel(0) or RegSel(2)) AND RegSel(1) AND Reg2(2) ) OR
            ( NOT(RegSel(2)) AND RegSel(0) AND RegSel(1) AND Reg3(2) ) OR
            ( NOT(RegSel(1) or RegSel(0)) AND RegSel(2) AND Reg4(2) ) OR
            ( NOT(RegSel(1)) AND RegSel(0) AND RegSel(2) AND Reg5(2) ) OR
            ( NOT(RegSel(0)) AND RegSel(1) AND RegSel(2) AND Reg6(2) ) OR
            ( RegSel(0) AND RegSel(1) AND RegSel(2) AND Reg7(2) );  
                           
    S(3) <= ( NOT(RegSel(0) or RegSel(1) or RegSel(2)) AND Reg0(3) ) OR
            ( NOT(RegSel(1) or RegSel(2)) AND RegSel(0) AND Reg1(3) ) OR
            ( NOT(RegSel(0) or RegSel(2)) AND RegSel(1) AND Reg2(3) ) OR
            ( NOT(RegSel(2)) AND RegSel(0) AND RegSel(1) AND Reg3(3) ) OR
            ( NOT(RegSel(1) or RegSel(0)) AND RegSel(2) AND Reg4(3) ) OR
            ( NOT(RegSel(1)) AND RegSel(0) AND RegSel(2) AND Reg5(3) ) OR
            ( NOT(RegSel(0)) AND RegSel(1) AND RegSel(2) AND Reg6(3) ) OR
            ( RegSel(0) AND RegSel(1) AND RegSel(2) AND Reg7(3) );
 
end Behavioral;