module election(


    input  wire [6:0] people,

    output reg [0:0] result

);


integer i;
reg         [2:0] count;


always @(*) begin

    count = 3'd0;

    for(i=0; i<=6; i=i+1) begin 

        if ( people[i] == 1) begin

            count = count + 1'b1;
        end
    end


    if(count > 3'd3 ) begin

        result = 1;
    end


    else begin

        result = 0;
    end


end

endmodule
