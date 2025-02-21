module full_adder(

    input              clk,

    input   wire [0:0] A,B,
    input   wire [0:0] Cin,
    output  wire [0:0] Sum,Cout

);

    assign Sum    = A ^ B ^ Cin;
    assign Cout = (Cin & (A ^ B)) | (A & B);


endmodule
