`timescale 1ns/1ns

module adder_tb;

reg [63:0] a;
reg [63:0] b;
reg cin;
wire [63:0] sum;
wire cout;

carry_skip_adder_64bit ins(a,b,cin,sum,cout);


initial begin

    a = 64'h00000000000000FF;
    b = 64'h00000000000000cd;
    cin = 0;

end



endmodule