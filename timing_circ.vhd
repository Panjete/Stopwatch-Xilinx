library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timing_circ is
  Port (clk: in std_logic;
        reset: in std_logic;
        
          sel: out std_logic_vector(1 downto 0); 
          anod: out std_logic_vector(3 downto 0);
          dp: out std_logic);
          
          
end timing_circ;

architecture Behavioral of timing_circ is
signal temp: INTEGER RANGE 0 to 100000;
signal msecond_out: INTEGER RANGE 0 to 3;
begin
    process(clk, reset)
            begin
            	if(reset='1') then 
                	temp<=0;
                    msecond_out<=0;
                elsif(rising_edge(clk)) then
                    --CHANGE THIS VALUE
                    if(temp=100000) then 
                        temp<=0;
                        if(msecond_out = 3) then
                            msecond_out <= 0; 
                        else 
                            msecond_out<= 1+ msecond_out;                        
                        end if;
                    else
                        temp<= temp +1;
                    end if;
                end if;
                
                sel<=std_logic_vector(to_unsigned(msecond_out, 2));
                
                if(msecond_out=0) then
                       anod <= "1110";
                       dp<='1';
                elsif(msecond_out=1) then
                       anod <= "1101";
                       dp<='0';
                elsif(msecond_out=2) then
                       anod <= "1011";
                       dp<='1';
                else
                       anod <= "0111";
                       dp<='0';
                end if; 
        end process;
end Behavioral;