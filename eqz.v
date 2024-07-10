`timescale 1ns / 1ps


module eqz(eq, data);

    input [15:0]data;
    output eq;

    assign eq = (data == 0);

endmodule
