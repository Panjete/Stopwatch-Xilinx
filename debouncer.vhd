----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2022 03:25:02
-- Design Name: 
-- Module Name: debouncer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
  Port (start: in std_logic;
        pause: in std_logic;
        reset: in std_logic;
        clk: in std_logic;
        reset_out: out std_logic;
        enable: inout std_logic:= '1');
end debouncer;

architecture Behavioral of debouncer is
begin

process(clk)
begin

if(rising_edge(clk)) then 
        if(start = '1') then
            enable<= '1';
        elsif(pause = '1') then
            enable<= '0';
end if;
end if;
end process;
 reset_out<=reset;
end Behavioral;
