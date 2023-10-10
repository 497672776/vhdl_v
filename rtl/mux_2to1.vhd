library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
  port (
    a, b: in std_logic;   -- 选择器输入
    sel: in std_logic;    -- 选择信号
    y: out std_logic      -- 选择结果输出
  );
end mux_2to1;

architecture behavioral of mux_2to1 is
begin
  process (a, b, sel)
  begin
    if sel = '0' then    -- 当选择信号为'0'时，输出选择器的第一个输入
      y <= a;
    else                -- 当选择信号为'1'时，输出选择器的第二个输入
      y <= b;
    end if;
  end process;
end behavioral;