module subtraction (


    input  wire [0:0] A,B,Cin,

    output wire [0:0] D,Cout

);


assign D = A ^ B ^ Cin;
assign Cout = ( (~A) & (B ^ Cin) ) | (B & Cin);



endmodule
