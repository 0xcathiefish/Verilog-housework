`timescale 1ns/1ns

module run_light_tb;
  
  parameter cycle = 2;
  
  reg clk,reset;
  
  reg [1:0] S;
  
  wire [7:0] Y; 
  
run_light run_light_1(clk,reset,S,Y);


initial begin
  
  clk = 1;
  reset = 1;
  S=0;
  
  forever begin
    
    #(cycle/2) clk = ~clk;
  end
  
end

initial begin
  #10;
  reset = 0;

  S = 'd0;

  #70;
  S = 'd1;

  #40;
  S = 'd2;

  #36;
  S = 'd3;

  #20;
  reset = 1;

end  
 
endmodule

