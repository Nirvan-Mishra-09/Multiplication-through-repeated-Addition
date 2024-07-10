`timescale 1ns / 1ps
module MTRA_datapath(eqz, ldA, ldB, ldP, clrP, decB, data_in, clk);

    input ldA, ldB, ldP, clrP, decB, clk;
    input [15:0] data_in;
    output eqz;

    wire [15:0] X, Y, Z, data_bus, bout;
    assign data_bus = data_in;
    reg1 Reg_A (X, data_bus, ldA, clk);
    reg2 Reg_P (Y, Z, ldP, clrP, clk);
    counter cntr (bout, data_bus, ldB, decB, clk);
    add ADDn(Z, X, Y);
    eqz COMP (eqz, bout);
endmodule
