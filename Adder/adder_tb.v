`timescale 1ns/1ns

module adder_tb;

    parameter cycle = 2;

    integer i;

    reg clk;

    reg [0:0] A,B,Cin;
    
    wire [0:0] Sum,Cout;



full_adder adder_1(clk,A,B,Cin,Sum,Cout);

initial begin

    A = 0;
    B = 0;
    Cin = 0;

end

initial begin

    clk = 1;

    forever begin

        #(cycle/2) clk = ~clk;
    end

end

initial begin

    #10;

    for(i=0; i<=7; i=i+1) begin : loop_1


    {A,B,Cin} = i;

    #4;

    end
    

end



endmodule