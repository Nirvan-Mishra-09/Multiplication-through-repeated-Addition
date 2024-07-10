`timescale 1ns / 1ps

module counter(dout, din, ld, dec, clk);

    input clk, dec, ld;
    input [15:0] din;
    output reg [15:0]dout;

    always @ (posedge clk)
     if (ld) dout <= din;
     else if (dec) dout <= dout - 1;

endmodule
