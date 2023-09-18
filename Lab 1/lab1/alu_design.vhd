--
-- Entity: alu_design
-- Architecture : structural
-- Author: rajjyap1 (Rajjya Rohan Paudyal)
-- Created On: 09/14/2023
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity alu_design is

  port (
    A       : in std_logic_vector(3 downto 0);
    B       : in std_logic_vector(3 downto 0);
    S1      : in std_logic;
    S1      : in std_logic;
    G       : out std_logic_vector(3 downto 0);
    Cout    : out std_logic);
end alu_design;

architecture structural of alu_design is

  component y_generator is 
    port(
      B     : in std_logic_vector(3 downto 0);
      S1    : in std_logic;
      S0    : in std_logic;
      Y     : out std_logic_vector(3 downto 0);
    );
  end component;

  component alu is
    port (
      A     : in std_logic_vector(3 downto 0);
      Y     : in std_logic_vector(3 downto 0);
      Cin   : in std_logic;
      G     : out std_logic_vector(3 downto 0);
      Cout  : out std_logic;
    );
  end component;

  -- Use statements for each component specifying 
  -- which architecture to use
  for all: y_generator use entity work.y_generator(structural);
  for all: alu use entity work.alu(structural);

  signal Y: std_logic_vector(3 downto 0);

  begin
    y_generator: y_generator port map (B=>B,S1=>S1,S=>S0,Y=>Y);
    alu: alu port map (A=>A,Y=>Y,Cin=>Cin,G=>G,Cout=>Cout);

end structural;
