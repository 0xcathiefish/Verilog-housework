module division_3(

    input wire clk_in,rst,
    output reg clk_3
);

reg [1:0] count;

always @(posedge clk_in or posedge rst or negedge clk_in) begin
    
    if (rst ==1) begin
        
        clk_3 = 0;
        count <= 2'd0;
    end

    else begin 

        if(count == 2'd2) begin

            count <= 2'd0;
            clk_3 <= ~clk_3;
        end

        else begin

            count <= count +1;
        end


    end


end

endmodule
