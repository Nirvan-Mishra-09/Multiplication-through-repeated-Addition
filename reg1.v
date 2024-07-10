`timescale 1ns / 1ps

module reg1(dout, din, ld, clk);

    input clk, ld;
    input [15:0] din;
    output reg [15:0]dout;

    always @ (posedge clk)
     if (ld) dout <= din;

endmodule