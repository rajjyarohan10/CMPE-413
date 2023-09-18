--
-- Entity: adder4_test_stdout 
-- Architecture : test
-- Author: cpatel2
-- Created On: 10/22/04
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;

entity adder4_test_stdout is

end adder4_test_stdout;

architecture test of adder4_test_stdout is

component adder4
  port (
    input1   : in  std_logic_vector(3 downto 0);
    input2   : in  std_logic_vector(3 downto 0);
    carryin  : in  std_logic;
    sum      : out std_logic_vector(3 downto 0);
    carryout : out std_logic);
end component;

for adder4_1 : adder4 use entity work.adder4(structural);
   signal ip1, ip2, op : std_logic_vector(3 downto 0);
   signal cin, cout: std_logic;
   signal create_input: std_logic_vector(8 downto 0):=b"000000000";

procedure print_output is
   variable out_line: line;

   begin
   write (out_line, string'(" Input1:"));
   write (out_line, ip1);
   write (out_line, string'(" Input2:"));
   write (out_line, ip2);
   write (out_line, string'(" Carry In:"));
   write (out_line, cin);
   writeline(output, out_line);
   write (out_line, string'(" Output:"));
   write (out_line, op);
   write (out_line, string'(" Carry Out:"));
   write (out_line, cout);
   writeline(output, out_line);
   writeline(output, out_line);
end print_output;


begin

adder4_1 : adder4 port map (ip1, ip2, cin, op, cout);

create_input <= unsigned(create_input)+ unsigned'(b"000000001") after 2
ns;

io_process: process
   variable out_line: line;

begin
       write(out_line, string'("Running all possible combinations. Will take some time to run !!!!"));
       writeline(output, out_line);
       write(out_line, string'("Type 'run 1024 ns' to continue or 'exit' to quit"));
       writeline(output, out_line);
       write(out_line, string'("Redirect output using > if required and multiple ^C's to quit"));
       writeline(output, out_line);

    for i in 0 to 511 loop
       wait for 1 ns;

       ip2<= create_input(8 downto 5);
       ip1<= create_input(4 downto 1);
       cin<= create_input(0);

       wait for 1 ns;

       print_output;
   end loop;
end process io_process;

end test;
