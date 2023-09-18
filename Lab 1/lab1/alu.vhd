--
-- Entity: alu
-- Architecture : structural
-- Author: rajjyap1 (Rajjya Rohan Paudyal)
-- Created On: 09/11/2023
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; -- for arithmetic operations

entity alu is

  port(
    -- X assigned as A in process level
    A     : in std_logic_vector(3 downto 0);
    Y     : in std_logic_vector(3 downto 0);
    Cin   : in std_logic;
    Cout  : out std_logic;
    G     : out std_logic_vector(3 downto 0));
end alu;

architecture structural of alu is
  signal X : std_logic_vector(3 downto 0);

begin -- architecture level
  
  X <= A; -- assiging the value of A to X
  -- variable temp: std_logic_vector(4 downto 0); -- 5 bits  
  
  alu_architecure: process (A, Y, Cin)
  variable temp: std_logic_vector(4 downto 0); -- 5 bits
  begin -- process level

    -- Selection based on value of Cin
    if (Cin = '0') then
      
      case Y is 
        when "0000" =>
          -- G = X
          G <= X; 
          Cout <= '0';
        when "1111" =>
          -- X - 1 
          --temp := std_logic_vector(unsigned("0000" & std_logic_vector(X)) - unsigned("00001")); -- concatenating using &
          --temp := std_logic_vector((unsigned("0000" & std_logic_vector(X)) - to_unsigned(1, 5))); -- concatenating using &
          temp := std_logic_vector(to_unsigned(0,4) & unsigned(X) + to_unsigned(0,4) & unsigned(Y)); -- concatenating for safety

          G <= temp(3 downto 0); -- taking last 3 downto 0 digits
          Cout <= temp(4); -- taking the MSB
        when others =>
          -- X + Y
          -- accounts for both S1 S0 = (10 and 01) 
          --temp:= ("0000" & X) + ("0000" & Y); -- concatenating for saftey
          --temp:= std_logic_vector(to_unsigned(0,4) & X) + std_logic_vector(to_unsigned(0,4) & Y); -- concatenating for safety
          temp := std_logic_vector((to_unsigned(0, 4) & unsigned(X)) + (to_unsigned(0, 4) & unsigned(Y))); -- concatenating for safety

          G <= temp(3 downto 0);
          Cout <= temp(4); -- taking the MSB

      end case;

    else -- Cin = '1'

      case Y is
        when "0000" =>
          -- X + 1
          --temp := ("0000" & X) + "00001";
          --temp := std_logic_vector(to_unsigned(0, 4) & X + to_unsigned(1, 5));
          temp := std_logic_vector((to_unsigned(0, 4) & unsigned(X)) + to_unsigned(1, 5));

          G <= temp(3 downto 0);
          Cout <= temp(4); -- taking the MSB
        when "1111" =>
          -- G = X
          G <= X;
          Cout <= '0';
        when others =>
          -- X + Y + 1
          -- accounts for both S1 S0 = (10 and 01) 
          --temp := ("0000" & X) + ("0000" & Y) + "00001"; 
          --temp := std_logic_vector(to_unsigned(0, 4) & X + to_unsigned(0, 4) & Y + to_unsigned(1, 5));
          temp := std_logic_vector((to_unsigned(0, 4) & unsigned(X)) + (to_unsigned(0, 4) & unsigned(Y)) + to_unsigned(1, 5));

          G <= temp(3 downto 0);
          Cout <= temp(4);
      
      end case;
    end if;
  end process;
end structural;