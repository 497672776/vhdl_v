`timescale 1ns/1ns    // 定义时钟时序

module tb_mux_2to1;
  
  // 输入信号
  reg a;
  reg b;
  reg sel;
  
  // 输出信号
  wire y;
  
  // 实例化选择器模块
  mux_2to1 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );
  
  // 时钟生成模块（50MHz时钟）
  reg clk = 0;
  always #10 clk = ~clk;
  
  // 测试过程
  initial begin
    // 初始化输入
    a = 0;
    b = 0;
    sel = 0;
    
    // 等待10个时钟周期
    repeat(10) @(posedge clk);
    
    // 输出选择器结果
    $display("sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);
    
    // 测试用例 1
    a = 1;
    b = 0;
    sel = 0;
    repeat(10) @(posedge clk);
    $display("sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);
    
    // 测试用例 2
    a = 0;
    b = 1;
    sel = 1;
    repeat(10) @(posedge clk);
    $display("sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);
    
    // 添加更多的测试用例...
    
    // 结束仿真
    $finish;
  end
  
endmodule