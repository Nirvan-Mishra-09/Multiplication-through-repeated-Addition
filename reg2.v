`timescale 1ns / 1ps


module reg2(dout, din,ld, clr, clk);

    input clr, clk, ld;
    input [15:0] din;
    output reg [15:0]dout;

    always @ (posedge clk)
     if (clr) dout <= 16'b0;
     else if (ld) dout <= din; 
endmodule
