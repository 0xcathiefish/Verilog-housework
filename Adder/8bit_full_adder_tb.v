`timescale  1ns/1ns

module eight_bit_full_adder_tb;

    parameter Cycle = 2;

    reg clk;
    
    reg [7:0] A,B;
    
    wire [7:0] sum;

    wire [0:0] cout;

    reg [0:0] cin;

eight_bit_full_adder adder_2(clk,cin,A,B,sum,cout);

initial begin

    clk = 1;
    forever begin

        #(Cycle/2) clk = ~clk;
    end
end

initial begin

    A    = 8'd0;
    B    = 8'd0;

    cin  = 1'd0;
end

initial begin

    #10;

    A = 8'b1111_1110;
    B = 8'b0000_0001;

    cin = 1'd0;


end


endmodule