`timescale 1ns/1ns

module election_tb;

    parameter Cycle = 2;

    reg clk;

    reg [6:0] people;

    wire [0:0] result;

    election elec_1(people,result);

initial begin

    clk = 1;

    forever begin

        #(Cycle/2) clk = ~clk;
    end
end


initial begin 

    people = 7'd0;

end

initial begin

    #10;

    people = 7'b0011111;

    #10;

    people = 7'b0000001;

    

end

endmodule 
