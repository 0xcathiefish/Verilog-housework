module drink(
    
    input  wire clk,reset,ena,
    input  wire [1:0] half_dollar,one_dollar,
    output reg  half_out,collect,
    output reg  [1:0] dispense,
    output wire [1:0]  state,
    output wire [7:0]  money
);

// reg [1:0] money_one,money_half;

localparam state_not_enough  = 2'b00;
localparam state_just_enough = 2'b01;
localparam state_need_charge = 2'b10;

//wire [7:0]  moeny;
initial begin

    half_out = 0;
    dispense = 0;
    collect  = 0;

end

function [1:0] state_caculate;
    
    input [7:0] din;
    begin
        if      (din < 25) state_caculate = state_not_enough;
        
        else if (din ==25) state_caculate = state_just_enough;

        else if (din > 25) state_caculate = state_need_charge; 
    end
endfunction

assign state  = state_caculate(money);

assign money  = 'd10 * one_dollar[0] + 'd20 * one_dollar[1] + 'd5 * half_dollar[0] + 'd10 * half_dollar[1];

always @ (posedge clk) begin
    if(ena == 1) begin

        if(reset == 1) begin

            half_out = 0;
            collect  = 0;
        end
        else begin 

            case (state)
                
                state_not_enough: begin
                    dispense <= 1'b0;
                    collect  <= 1'b0;
                    half_out <= 1'b0;                
                end 
                
                state_just_enough: begin
                    dispense <= dispense + 'b1;
                    collect  <= 1'b1;
                    half_out <= 1'b0;      
                end

                state_need_charge: begin
                    dispense <= dispense + 'b1;
                    collect  <= 1'b1;
                    half_out <= 1'b1;  
                end

                default: begin
                    dispense <= 1'b0;
                    collect  <= 1'b0;
                    half_out <= 1'b0;  
                end
            endcase
        end
    end
end

endmodule
