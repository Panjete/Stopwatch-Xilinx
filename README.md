# Stopwatch-Xilinx

I constructed a stopwatch using the LED displays and push button on the Basys 3 board.

Display format of the clock is (M:SS:T): minutes (M) on one LED display, seconds (SS) on two LED displayS and tenth of second (T) on one LED display.
In addition to this, the watch can be controlled via three push buttons:    
• start/continue     
• pause    
• reset   

    The stopwatch, once programmed by vivado, runs as per the folowing commands-

    Down Button - To pause the clock at it's current state.
    Up Button  -  As the Start/Continue button. By default, 
                  the clock was designed to run when it is first programmed. After pausing and
                  resetting it again and again, we can use it as many times as is necessary.
    Center Button - To Reset the clock. We have designed reset to reset the time to 0,
                    but retain the running state. If the clock was paused when reset was pressed, 
                    the clock returns to 0 and remains paused. If the clock was running when 
                    reset was pressed, the clock resets to 0 and remains running.

![a](https://user-images.githubusercontent.com/103451209/189372222-c119eee3-4dfa-4e70-a584-a7c328a22129.jpeg)
