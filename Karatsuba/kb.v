module karatsuba_multiplier(

    input  wire                 clk     ,
    input  wire                 rst     ,
    input  wire [255:0]         a       ,
    input  wire [255:0]         b       ,
    output reg  [511:0]         result 
);

integer i                               ;
reg [31:0] k                            ;
reg [255:0] a1, a0, b1, b0              ;
reg [511:0] t0,t1,t2                    ;

initial begin

    i       = 0                         ;
    result  = 0                         ;
    a1      = 0                         ;
    a0      = 0                         ;
    b1      = 0                         ;
    b0      = 0                         ;
    k       = 0                         ;
    t0      = 0                         ;
    t1      = 0                         ;
    t2      = 0                         ;
end

// Function to find k where number = 10^k + x
function automatic [31:0] find_k;

    input [255:0] number_a,number_b;
    reg [255:0] power10_a,power10_b;  
    reg [31:0] find_ka,find_kb;

    begin
        find_ka = 0;
        find_kb = 0;
        power10_a = 10;  
        power10_b = 10;  

        while(power10_a <= number_a) begin
            find_ka = find_ka + 1;
            power10_a = power10_a * 10;
        end

        while(power10_b <= number_b) begin
            find_kb = find_kb + 1;
            power10_b = power10_b * 10;
        end
        
        find_k = find_ka >= find_kb ? find_kb : find_ka;
    end
endfunction


// Function to calculate power of 10
function automatic [255:0] pow10;
    input [31:0] k;
    reg [255:0] result;
    integer i;
    begin
        result = 1;
        for(i = 0; i < k; i = i + 1) begin
            result = result * 10;
        end
        pow10 = result;
    end
endfunction

//return high
function automatic [255:0] split_high;  
    input [255:0] number;
    input [31:0] k;
    reg [255:0] divisor;
    begin
        divisor = pow10(k);
        split_high = number / divisor;
    end
endfunction

//return low
function automatic [255:0] split_low;   
    input [255:0] number;
    input [31:0] k;
    reg [255:0] divisor;
    begin
        divisor = pow10(k);
        split_low = number - (split_high(number, k) * divisor);
    end
endfunction


always@(posedge clk) begin
    if(rst) begin
        result <= 0     ;
        k <= 0          ;
        a1 <= 0         ;
        a0 <= 0         ;
        b1 <= 0         ;
        b0 <= 0         ;
    end

    else begin

        k = find_k(a,b)                                         ;
        a1 = split_high(a, k)                                   ;
        a0 = split_low(a, k)                                    ;   
        b1 = split_high(b, k)                                   ;
        b0 = split_low(b, k)                                    ;

        t0 = a0 * b0                                            ;
        t1 = a1 * b1                                            ;
        t2 = (a1 + a0) * (b1 + b0) - t0 - t1                    ;

        result = t1 * pow10(2 * k) + t2 * pow10(k) + t0         ;

    end
end

endmodule


