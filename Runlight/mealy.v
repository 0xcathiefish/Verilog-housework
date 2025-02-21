module run_light(
  input clk, reset,
  input wire [2:0] S,
  output reg [7:0] Y
);

localparam state_rst = 3'd0;
localparam state_1a = 3'd1;
localparam state_1b = 3'd2;
localparam state_2  = 3'd3;
localparam state_3a = 3'd4;
localparam state_3b = 3'd5;
localparam state_3c = 3'd6;
localparam state_4  = 3'd7;

integer i_1, i_1b, i_2, i_2b, k, i_4, w;
reg [2:0] state, next_state;

initial begin

  flag = 0;
  i_1 = 7;
  i_1b = 7;
  i_2 = 7;
  i_2b = 0;
  k = 0;
  i_4 = 0;
  w = 0;
  Y = 0;
  state = state_rst;
  next_state = state_rst;
end

// 状态转换逻辑
always @(posedge clk or posedge reset) begin
  if (reset) begin
    state <= state_rst; // 复位时回到初始状态
  end else begin
    state <= next_state; // 更新状态
  end
end

// 输出逻辑：根据当前状态计算 Y 的值
always @(*) begin

  case(state)

    state_1a: begin

      if (i_1 >= 0) begin
        Y[i_1] = 1;
        i_1 = i_1 - 1;
      end 

      else if (i_1b >= 0) begin
        Y[i_1b] = 0;
        i_1b = i_1b - 1;
      end 
      
      else begin
        next_state = state_rst; // 完成后进入复位状态
      end

    end
    



    state_2: begin
      if (i_2 >= 4) begin
        Y[i_2] = 1;
        Y[7 - i_2] = 1;
        i_2 = i_2 - 1;
      end 
      
      else if (i_2b <= 3) begin
        Y[i_2b] = 0;
        Y[7 - i_2b] = 0;
        i_2b = i_2b + 1;
      end 
      
      else if (i_2b == 4) begin
        Y = 8'b1111_0000;
        next_state = state_2;
      end

    end
    


    state_3a: begin

        if(flag == 0) begin

            Y = 8'b1111_0000; // 固定输出

            flag = 1;
        end

      #2;
      if (k <= 3) begin
        Y[k] = 1;
        k = k + 1;
      end else if (k >= 4 && k < 8) begin
        Y[k] = 0;
        k = k + 1;
      end else if (k == 8) begin
        Y = 8'b0000_1111;
        #10;
        next_state = state_rst;
      end
    end
    


    state_4: begin
      if (i_4 <= 6) begin
        Y[i_4] = 1;
        Y[i_4 + 1] = 1;
        i_4 = i_4 + 2;
      end else if (i_4 == 8) begin
        Y = 8'b0000_0000;
        next_state = state_rst;
      end
    end
    
    default: begin
      next_state = state_rst;
    end
  endcase
end

// 状态更新逻辑：根据 S 信号确定下一个状态
always @(*) begin
  case(S)
    3'd0: next_state = state_1a;
    3'd1: next_state = state_2;
    3'd2: next_state = state_3a;
    3'd3: next_state = state_4;
    default: next_state = state_rst;
  endcase
end

endmodule
