--
-- Entity: adder4_test 
-- Architecture : test 
-- Author: cpatel2
-- Created On: 10/22/04
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity adder4_test is

end adder4_test;

architecture test of adder4_test is

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
   signal clock : std_logic;

begin

adder4_1 : adder4 port map (ip1, ip2, cin, op, cout);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

io_process: process

  file infile  : text is in "adder4_in.txt";
  file outfile : text is out "adder4_out.txt";
  variable i1, i2, op1 : std_logic_vector(3 downto 0);
  variable ci, co: std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,i1);
    ip1<=i1;

    readline(infile,buf);
    read (buf,i2);
    ip2<=i2;

    readline(infile,buf);
    read (buf,ci);
    cin<=ci;

    wait until falling_edge(clock);

    op1:=op;
    co:=cout;

    write(buf,op1);
    writeline(outfile,buf);

    write(buf,co);
    writeline(outfile,buf);

  end loop;

end process io_process;

end test;
