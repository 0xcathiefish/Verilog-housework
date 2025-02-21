`timescale  1ns/1ns

module dividion_3_tb;

    parameter cycle = 2;

    reg clk,rst;

    wire clk_3;

division_3 div_3(clk,rst,clk_3);

initial begin

    rst = 1;
    clk = 0;

    forever begin

        #(cycle/2) clk = ~clk;
    end

end

initial begin

    #10;
    rst = 0;

    #100 rst = 1;

end


endmodule
