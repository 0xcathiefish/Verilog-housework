module run_light(

  input clk,reset,
  
  input wire [2:0] S,
  
  output reg [7:0] Y
  
);

localparam state_rst = 'd0;

localparam state_1a = 'd1;
localparam state_1b = 'd2;

localparam state_2  = 'd3;

localparam state_3a = 'd4;
localparam state_3b = 'd5;
localparam state_3c = 'd6;

localparam state_4 = 'd7;

localparam mod_0 = 'd0;
localparam mod_1 = 'd1;
localparam mod_2 = 'd2;
localparam mod_3 = 'd3;



integer i_1,i_1b,i_2,i_2b,k,i_4,w,flag,flag_a,g;

reg [3:0] state;

initial begin
  
  flag = 0;
  flag_a = 0;
  g = 0;

  i_1 = 7;
  i_1b = 7;
  
  i_2 =   7;
  i_2b = 'd0;
  
  k = 0;
  i_4 = 0;
  
  w = 0;
  
  Y = 0;
  state = 0;
  
end


always @(posedge clk) begin
  
  if(reset) begin
    
    Y = 0;

  end
  
  else begin
  

    case(S) 
    
        'd0 : state = state_1a;
        'd1 : state = state_2;
        'd2 : state = state_3a;
        'd3 : state = state_4;
        'd4 : state = state_rst;

        default : state = state_1a;

    endcase

            
  
  case(state)
    
    state_1a :begin
      
      if(i_1 >=0) begin
        
        Y[i_1] <= 'd1;
        i_1 <= i_1 -1;
        
      end
      
      else if(i_1b >=0) begin
        
        
        Y[i_1b] <= 'd0;

        i_1b <= i_1b -1;

      end


      else state = state_1a;

      
    end
  
    
    // state_1b: begin
      
    //     if(i_1b >=0) begin
        
    //     Y[i_1b] <= 'd0;
    //     i_1b <= i_1b -1;
        
    //   end
      
    // else begin
      
    //   state = state_rst;
    // end
      
    // end
    
    
    
    
    state_2: begin
      
    if(i_2>= 4)begin
        
        Y[i_2] <= 'd1;
        Y[7-i_2] <= 'd1;
        
        i_2 = i_2 - 1;
        
      end
      
    else if(i_2b <= 3) begin
      
        
        Y[i_2b] <= 'd0;
        
        Y[7-i_2b] <= 'd0;
        
        i_2b = i_2b + 1;
        
    end
      
    else if(i_2b == 'd4) begin 
        

        state = state_2;

    end
      
    end
    
    
    
    
    
    state_3a: begin
      
      Y <= 8'b1111_0000;

      state = state_3b;

    end
    
    
    state_3b: begin
    
    if(g <= 7) begin

      if(g <= 3) begin

        Y [7-g] <= 'd0;
      end

      g <= g + 1;

    end

    if(g == 8) begin

    Y <= 8'b1111_0000;

    g = g + 1;

    end

    if(g == 9) begin

      state = state_3a;

    end
      
    end
    
  
    // state_3c: begin
      
    //   Y <= 8'b1111_0000;
      
    //   state  <= state_rst;
      
    // end
    
    
    state_4: begin
    
      if(i_4 <=6) begin
        
        Y[i_4] <= 'd1;
        Y[i_4+'d1] <= 'd1;
        
        i_4 <= i_4 +'d2;
      end
      
      else if(i_4 == 8) begin
        
        Y <= 'd0;
      
        state <= state_4;
      
      end
    

    
    end

    
    
    state_rst :begin
      
        flag = 0;

        flag_a = 0;

        i_1 = 7;
        i_1b = 7;
        
        i_2 =   7;
        i_2b = 'd0;
        
        k = 0;
        i_4 = 0;
        
        w = 0;
        
        Y = 0;
  
      
    end
    
    
    default : state <= state_rst;
    
    
  endcase
  
  
  end
  
end
  
  
  
endmodule

