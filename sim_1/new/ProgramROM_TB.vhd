library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramROM_TB is
--  Port ( );
end ProgramROM_TB;

architecture Behavioral of ProgramROM_TB is

component ProgramROM 
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal address : std_logic_vector (2 downto 0);
signal data : std_logic_vector (11 downto 0);
begin
UUT : ProgramROM Port Map (
    address => address,
    data => data);

process 
begin

    address <= "000";
    wait for 100 ns;
    
    address <= "001";
    wait for 100ns;

    address <= "010";
    wait for 100ns;

    address <= "011";
    wait for 100ns;

    address <= "100";
    wait for 100ns;

    address <= "101";
    wait for 100ns;
    
    address <= "110";
    wait for 100ns;
        
    address <= "111";
    wait for 100ns;
    
    wait;
end process;

end Behavioral;