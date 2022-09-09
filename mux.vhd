library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
 Port ( inp1: in std_logic_vector(3 downto 0);
    inp2: in std_logic_vector(3 downto 0);
    inp3: in std_logic_vector(3 downto 0);
    inp4: in std_logic_vector(3 downto 0);
    sel: in std_logic_vector(1 downto 0);
    output: out std_logic_vector(3 downto 0));
    
end mux;

architecture Behavioral of mux is

begin
with sel select
    output <= 	inp1 when "00",
                inp2 when "01",
                inp3 when "10",
                inp4 when "11",
                inp1 when others;
end Behavioral;