--
-- Entity: alu_design_test_stdout
-- Architecture : test
-- Author: rajjyap1 (Rajjya Rohan Paudyal)
-- Created On: 09/14/2023
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;

entity alu_design_test_stdout is

end alu_design_test_stdout;

architecture test of alu_design_test_stdout is

  signal A, B : std_logic_vector(3 downto 0);
  signal S0, S1, Cin : std_logical;
  signal G : std_logic_vector(3 downto 0);
  signal Cout : std_logic;
  
  -- File I/O
  file out_line : text open write_mode is "results.txt";
  variable line_buf : line;

  begin
    -- Instantiate alu_desgin entity design
    DUT: entity work.alu_desgin
      -- DUT: Device Under Test
      port map(
        A => A,
        B => B,
        S0 => S0,
        S1 => S1,
        Cin => Cin,
        G => G,
        Cout => Cout);

   -- Test Process
    simulation_process: process
    begin
      -- Initialize inputs
      A <= "0000";
      B <= "0000";
      S0 <= '0';
      S1 <= '0';
      Cin <= '0';
      wait for 100 ns;

      -- Test case 1
      A <= "0101";
      B <= "0011";
      S0 <= '0';
      S1 <= '0';
      Cin <= '0';
      wait for 100 ns;

      -- Stop the simulation
      assert false
      report "End of simulation" severity note;
      wait;

    end process simulation_process;
end test;