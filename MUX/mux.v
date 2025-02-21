module MUX_8_1(

    input             clk,rst,
    input  wire [0:0] A_0,A_1,A_2,
    input  wire [0:0] D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,
    output reg  [0:0] Y

);


always @ (posedge clk ) begin

    if(rst == 0) begin
    
        case({A_2,A_1,A_0})

            3'b000 : Y=D_0;
            3'b001 : Y=D_1;
            3'b010 : Y=D_2;
            3'b011 : Y=D_3;
            3'b100 : Y=D_4;
            3'b101 : Y=D_5;
            3'b110 : Y=D_6;
            3'b111 : Y=D_7;

            default: Y = 0;

        endcase
    end

end


endmodule

