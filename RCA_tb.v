`timescale 1ns / 1ps

module RCA_tb;

    reg [3:0] a, b;
    reg Cin, clk;


    wire [3:0] sum;
    wire Cout;

    RCA uut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .clk(clk),
        .sum(sum),
        .Cout(Cout)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        a = 0;
        b = 0;
        Cin = 0;
     
        // Test vector 1
        a = 4'b0000; b = 4'b0000; Cin = 1;
        #10;

        // Test vector 2
        a = 4'b0001; b = 4'b0001; Cin = 0;
        #10;

        // Test vector 3
        a = 4'b0011; b = 4'b0010; Cin = 1;
        #10;

        // Test vector 4
        a = 4'b0101; b = 4'b0110; Cin = 0;
        #10;

        // Test vector 5
        a = 4'b1111; b = 4'b0001; Cin = 1;
        #10;

        // Test vector 6
        a = 4'b1010; b = 4'b1010; Cin = 0;
        #10;

        // End simulation
        $finish;
    end

    initial begin
        $monitor("Time=%0t | a=%b b=%b Cin=%b | sum=%b Cout=%b",
                 $time, a, b, Cin, sum, Cout);
    end
endmodule
