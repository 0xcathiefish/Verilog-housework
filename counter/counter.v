module counter(
  input I_rst_n,
  input I_clk,
  
  output reg [7:0] o_cnt,
  output reg o_cout
  );
  
  parameter PERIOD = 8'd27;
  
    always@(negedge I_rst_n,posedge I_clk)
    begin
        if(~I_rst_n)
        begin
            o_cout <= 1'b0;
            o_cnt  <= 8'd0;
        end
        else
        begin
            if(PERIOD == o_cnt)
            begin
                o_cnt  <= 8'd0;
                o_cout <= 1'b1;
            end
            else
            begin
              o_cnt <= o_cnt + 8'd1;
              o_cout <= 1'b0;
            end
        end
    end
endmodule

