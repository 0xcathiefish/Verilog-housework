`timescale 1ns/1ns

module drink_tb;
    reg       clk,reset,ena;
    parameter cycle = 2;
    reg [1:0] half_dollar,one_dollar;
    wire [7:0] money;
    wire half_out,collect;
    wire [1:0] state,dispense;

drink drink_1 (clk,reset,ena,half_dollar,one_dollar,half_out,collect,dispense,state,money);

initial begin 

    ena   = 0;
    reset = 1;
    clk   = 1;

    forever begin
    #(cycle/2) clk = ~clk;
    end
end

initial begin

    half_dollar = 0;
    one_dollar  = 0;
end


initial begin

    #10;
    reset = 0;
    ena = 1;
    half_dollar = 2'd1;           //第一次投入2.5元
    one_dollar  = 2'd2;           //第二次投入3.0元
    #2;
    reset = 1;
    #8;
    reset = 0;
    half_dollar = 2'd2;
    one_dollar  = 2'd2;
    #2 reset = 1;
end

endmodule
