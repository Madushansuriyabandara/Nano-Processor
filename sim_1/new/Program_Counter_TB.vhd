library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter_TB is
--  Port ( );
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is
component Program_Counter 
port (
    Input : in std_logic_vector(2 downto 0);
    Clk : in  std_logic;
    Reset : in  std_logic;
    Output : out std_logic_vector(2 downto 0));
end component;

signal Clk, Reset : std_logic;
signal Input, Output : std_logic_vector (2 downto 0);

begin
UUT : Program_Counter Port Map (
    Input => Input,
    Clk => Clk,
    Reset => Reset,
    Output => Output
    );
process
begin
    Clk <= '0';
    wait for 100ns;
    while true loop
        Clk <= not(Clk);
        wait for 100ns;
        Clk <= not(Clk);
        wait for 100ns;
    end loop;
end process;

process 
    begin
    Reset <= '1';
    wait for 250ns;
    Reset <= '0';
    wait for 10ns;
    Input <= "001";
    wait for 200ns;
    Input <= "010";
    wait for 200ns;
    Reset <= '1';
    wait;
end process;

end Behavioral;