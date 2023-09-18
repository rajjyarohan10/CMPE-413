--
-- Entity: y_generator
-- Architecture : structural
-- Author: rajjyap1 (Rajjya Rohan Paudyal)
-- Created On: 09/11/2023
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity y_generator is:

  port(
    B   : in std_logic_vector(3 downto 0);
    S0  : in std_logic_vector(3 downto 0);
    S1  : in std_logic_vector(3 downto 0);
    Y   : out std_logic_vector(3 downto 0));
end y_generator;

architecture structural of y_generator is

begin -- architecture level

  process (B, S0, S1)
  begin -- process level

    if (S0 = '0' and S1 = '0') then
      Y <= "0000";
    elsif (S0 = '0' and S1 ='1') then
      Y <= B;
    elsif (S0 = '1' and S1 ='0') then
      Y <= not B;
    else -- (S0 = '1' and S1 = '1')
      Y <= "1111";
    end if;
  
  end process;

end structural
