`timescale 1ns / 1ps
module add(dout, in1, in2);

    input [15:0] in1, in2;
    output reg [15:0]dout;

    always @ (*)
        dout = in1 + in2;

endmodule
