`timescale 1ns / 1ps


module FA(
            input a,
            input b,
            input c,
            output sum,
            output carry);
            
assign sum = (a ^ b ^ c);
assign carry = (a&b | b&c | c&a);

endmodule 

module D_FF(
           input clk,
           input reg_in,
           output reg reg_out);
always @(posedge clk) 
    begin
            reg_out <= reg_in;
    end
endmodule 

module RCA (input [3:0] a,b,
            input Cin,
            input clk,
            output [3:0] sum,
            output Cout);

wire cin1, cin2, cin3;
wire [2:0] carry;
wire sum00;
wire sum10;
wire a20,b20;
wire sum20;
wire a30,b30;

FA FA0(.a(a[0]), .b(b[0]), .c(Cin), .sum(sum00), .carry(carry[0]));
D_FF D0(.clk(clk), .reg_in(sum00), .reg_out(sum[0]));


FA FA1(.a(a[1]), .b(b[1]), .c(carry[0]), .sum(sum10), .carry(carry[1]));
D_FF D1(.clk(clk), .reg_in(sum10), .reg_out(sum[1]));

D_FF D2(.clk(clk), .reg_in(a[2]), .reg_out(a20));
D_FF D3(.clk(clk), .reg_in(b[2]), .reg_out(b20));
FA FA2(.a(a20), .b(b20), .c(carry[1]), .sum(sum[2]), .carry(carry[2]));

D_FF D4( .clk (clk), .reg_in( a[3] ), .reg_out( a30 ) );
D_FF D5( .clk (clk), .reg_in( b[3] ) , .reg_out( b30 ) );
FA FA3(.a(a30), .b(b30), .c(carry[2]), .sum(sum[3]), .carry(Cout));
          
endmodule
