`timescale 1ns / 1ns

module karatsuba_multiplier_tb;

    parameter cycle = 2;

    reg clk,rst;

    reg [255:0] a,b;
    wire [511:0] result;



karatsuba_multiplier uut(clk,rst,a,b,result);

initial begin


    clk = 0;
    rst = 1;

    forever begin
        #(cycle/2) clk = ~clk;
    end

end


initial begin

    #10;
    rst = 0;
    
    a = 1234;
    b = 5678;
end

endmodule
