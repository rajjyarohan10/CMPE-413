--
-- Entity: adder4
-- Architecture : structural
-- Author: cpatel2
-- Created On: 10/21/2004
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity adder4 is

  port (
    input1   : in  std_logic_vector(3 downto 0);
    input2   : in  std_logic_vector(3 downto 0);
    carryin  : in  std_logic;
    sum      : out std_logic_vector(3 downto 0);
    carryout : out std_logic);
end adder4;

architecture structural of adder4 is

component adder1
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    carryin  : in  std_logic;
    sum      : out std_logic;
    carryout : out std_logic);
end component;

for adder1_1, adder1_2, adder1_3, adder1_4: adder1 use entity work.adder1(structural);

signal ctemp: std_logic_vector(2 downto 0);

begin

adder1_1: adder1 port map (input1(0), input2(0), carryin, sum(0), ctemp(0));
adder1_2: adder1 port map (input1(1), input2(1), ctemp(0), sum(1), ctemp(1));
adder1_3: adder1 port map (input1(2), input2(2), ctemp(1), sum(2), ctemp(2));
adder1_4: adder1 port map (input1(3), input2(3), ctemp(2), sum(3), carryout);

end structural;
