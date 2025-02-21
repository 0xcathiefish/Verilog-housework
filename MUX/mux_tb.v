`timescale 1ns/1ns
module MUX_tb;

    parameter Cycle = 2;

    reg clk,rst;
    reg [0:0] A_0,A_1,A_2;
    reg [0:0] D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7;
    wire [0:0] Y;

MUX_8_1 MUX_uut(clk,rst,A_0,A_1,A_2,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,Y);

initial begin
    rst = 1'b1;
    D_0 = 1'b1;
    D_1 = 1'b1;
    D_2 = 1'b0;
    D_3 = 1'b0;
    D_4 = 1'b1;
    D_5 = 1'b1;
    D_6 = 1'b0;
    D_7 = 1'b0;
    A_0 = 1'b0;
    A_1 = 1'b0;
    A_2 = 1'b0;

    clk = 1;
    forever begin
        
        #(Cycle/2)

        clk = ~clk;
    end
end
integer i;
initial begin
    #30;
    rst = 0;

    for(i=0; i<=7; i=i+1) begin : loop_1
        {A_2,A_1,A_0} = i;
        #20;
    end

    $finish;
end
endmodule
