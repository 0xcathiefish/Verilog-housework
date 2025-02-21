`timescale 1ns/1ns

module counter_tb();
  reg rst_n;
  reg clk;

  wire[7:0] cnt;
  wire cout;

  counter I1_counter(

  .I_rst_n(rst_n),
  .I_clk(clk),
  .o_cnt(cnt),
  .o_cout(cout)
  );
  
  initial
  begin
      clk = 1'b0;
      rst_n = 1'b0;
      #4_rst_n =1'b1;
  end
  
  always #1 clk <= ~clk;
endmodule


