module carry_skip_adder_64bit(

    input [63:0] a              ,
    input [63:0] b              ,
    input cin                   ,
    output [63:0] sum           ,
    output cout
);

    // Internal carry signals
    wire [8:0] block_carry;
    assign block_carry[0] = cin;

    // Generate 8 blocks of 8-bit each
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : skip_blocks
            wire [7:0] p; 
            wire block_cout;
            wire skip_cin;
            
            assign p = a[i*8+7:i*8] ^ b[i*8+7:i*8];
            
            // 8-bit ripple carry adder
            ripple_carry_8bit ripple (
                .a(a[i*8+7:i*8]),
                .b(b[i*8+7:i*8]),
                .cin(block_carry[i]),
                .sum(sum[i*8+7:i*8]),
                .cout(block_cout)
            );
            
            assign block_carry[i+1] = 
                (&p) ? block_carry[i] : block_cout;
        end
    endgenerate

    assign cout = block_carry[8];

endmodule

// 8-bit ripple carry adder module
module ripple_carry_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire [8:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : ripple
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[8];
endmodule

// Full adder module
module full_adder(
    input a         ,
    input b         ,
    input cin       ,
    output sum      ,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
