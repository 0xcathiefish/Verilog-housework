`timescale 1ns/1ns

module subtraction_tb;

    parameter Cycle = 2;
    reg clk;

    reg [0:0] A,B,cin;

    wire [0:0] D,cout;

    subtraction sub_1(A,B,cin,D,cout);

initial begin
    
    clk = 1;

    forever begin
        
        #(Cycle/2) clk = ~clk;
    end

end

initial begin

    A   = 0;
    B   = 0;
    cin = 0;

end

initial begin

    #10;

    A <= 1;
    B <= 0;


end


endmodule
