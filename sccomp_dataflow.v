`timescale 1ns / 1ps
module sccomp_dataflow(
    input clk,
    input rst,
    output [31:0]inst,
    output [31:0]pc,
    output [7:0]o_seg,
    output [7:0]o_sel
);

wire [31:0] inst,pc;
wire clk_div;

assign clk_div=clk;

//DIV divin(
//    .clk(clk),
//    .rst(rst),
//    .clk_out(clk_div)
//);

wire DM_wena,DM_rena;
wire[31:0]DM_wdata,DM_rdata,res;

wire [31:0]IM_addr;
wire [10:0]DM_addr;
assign IM_addr=(pc-32'h0040_0000)/4;

IMEM instruction_mem(
    .addr(IM_addr),
    .instruction(inst)
);

DMEM data_mem(
    .clk(clk_div),
    .ena(DM_rena|DM_wena),
    .wena(DM_wena),
    .addr(DM_addr),
    .data_in(DM_wdata),
    .data_out(DM_rdata)
);

cpu31 cpu(
    .clk(clk_div),
    .rst(rst),
    .IM_inst(inst),
    .DM_rdata(DM_rdata),
    .PC(pc),
    .res(res),
    .DM_Wena(DM_wena),
    .DM_Rena(DM_rena),
    .DM_wdata(DM_wdata),
    .DM_addr(DM_addr)
);

seg7x16 seg7(
    .clk(clk),
    .reset(rst),
    .cs(1'b1),
    .i_data(pc),
    .o_seg(o_seg),
    .o_sel(o_sel)
);

endmodule   


