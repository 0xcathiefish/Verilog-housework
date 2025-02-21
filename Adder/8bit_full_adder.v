module eight_bit_full_adder (

    input             clk,

    input  wire [0:0] cin,
    input  wire [7:0] A,B,
    
    output wire [7:0] sum,
    output wire [0:0] cout

);

    genvar i;
    generate
            
        // for(i=0; i<=15; i=i+1) begin :loop_input

        //     wire [0:0] A;
        //     wire [0:0] B;
        // end


        // for(i=0; i<=7;  i=i+1) begin :loop_sum

        //     wire [0:0] sum;
        // end


        for(i=0; i<=7;  i=i+1) begin :loop_temp

            //wire [0:0] temp_sum;
            wire [0:0] temp_cout;
        end


        for(i=0; i<=7;  i=i+1) begin :loop_adder

            if (i ==0) begin

            full_adder adder(

                .clk(clk),
                .A(A[0]),
                .B(B[0]),
                .Cin(cin),
                .Sum(sum[0]),
                .Cout(loop_temp[0].temp_cout)

            );

            end


            else begin

                full_adder adder(

                .clk(clk),
                .A(A[i]),
                .B(B[i]),
                .Cin(loop_temp[i-1].temp_cout),
                .Sum(sum[i]),
                .Cout(loop_temp[i].temp_cout)

                );

            end

        end

    endgenerate


assign cout = loop_temp[7].temp_cout;



endmodule