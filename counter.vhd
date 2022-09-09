library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity counter is
  Port ( clk, reset, enable: in std_logic;
        tenth: out std_logic_vector(3 downto 0);
        secc: out std_logic_vector(3 downto 0);
        tsecc: out std_logic_vector(3 downto 0);
        minnn: out std_logic_vector(3 downto 0));
  
end counter;

architecture Behavioral of counter is
    signal msecond: INTEGER RANGE 0 to 9;
    signal second: INTEGER RANGE 0 to 9;
    signal tsecond: INTEGER RANGE 0 to 5;
    signal minn: INTEGER RANGE 0 to 9;
    
    signal temp: INTEGER RANGE 0 to 10000000 := 0;
begin


        process(clk, reset) 
            begin
                if(reset='1') then 
                    temp<=0;
                    msecond<=0;
                    second<=0;
                    tsecond <= 0;
                    minn <= 0;
                elsif(rising_edge(clk) and enable = '1') then
                    --CHANGE THIS VALUE
                    if(temp=9999999) then 
                        temp<= 0;
                    else
                        temp<=temp+1;
                    end if;
                    
                    if(temp=0) then
                      if(msecond = 9) then
                          msecond <= 0;
                          if(second = 9) then
                              second <= 0;
                              if(tsecond = 5) then
                                   tsecond <= 0;
                                   if(minn = 9) then
                                       minn <= 0;
                                   else 
                                       minn <= 1 + minn; 
                                   end if;
                              else 
                                   tsecond <= 1 + tsecond; 
                              end if;
                          else 
                              second <= 1 + second; 
                          end if;
                          
                      else 
                          msecond <= 1 + msecond; 
                      end if;
                    end if;
                    
                    
                    
                end if;    
                tenth<=std_logic_vector(to_unsigned(msecond, 4));
                secc<=std_logic_vector(to_unsigned(second, 4));
                tsecc<=std_logic_vector(to_unsigned(tsecond, 4));
                minnn<=std_logic_vector(to_unsigned(minn, 4));
        end process;
end Behavioral;