library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch is 
Port (clk : in std_logic;
      pp: in std_logic;
      reset: in std_logic;
      start: in std_logic;
      ans: out std_logic_vector(3 downto 0);
      cats: out std_logic_vector(6 downto 0);
      dp: out std_logic);

end stopwatch;

architecture Behavioral of stopwatch is

signal anode, digit, tenth_sec, sec, tensec, mins: std_logic_vector(3 downto 0);
signal sel_sig: std_logic_vector(1 downto 0);
signal enable_w, reset_w,b: std_logic;
begin
b<= not(pp);
Get_all: entity work.counter port map(clk, reset_w, enable_w ,tenth_sec, sec, tensec, mins);
Multiplexer: entity work.mux port map(tenth_sec, sec, tensec, mins, sel_sig, digit);
Display: entity work.SSegment port map(digit, cats);
TimingCircuit: entity work.timing_circ port map(clk, reset_w, sel_sig,anode, dp);
Deb: entity work.debouncer port map(start, pp, reset, clk, reset_w, enable_w);
ans<=anode;


end Behavioral;