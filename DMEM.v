`timescale 1ns / 1ps
module DMEM(
    input clk,
    input ena,
    input wena,
    input [10:0]addr,
    input [31:0]data_in,
    output[31:0]data_out
);
reg[31:0] DMEM_REG[0:31];

always@(posedge clk)begin
    if(ena&wena)begin
        DMEM_REG[addr]<=data_in;
    end
end

assign data_out=(ena)?DMEM_REG[addr]:32'bz;
endmodule