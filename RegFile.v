`timescale 1ns/1ps

module RegFile(
    input clk,
    input rst,
    input ena,
    input RF_Wena,

    input[4:0]r_addr1,
    input[4:0]r_addr2,
    input[4:0]w_addr,
    input[31:0] w_data,
    output [31:0] r_data1,
    output [31:0] r_data2
);
reg [31:0] RF_regs[31:0];
always@(posedge clk or posedge rst)begin
    if(rst&&ena)begin
        RF_regs[0]<=32'b0;
        RF_regs[1]<=32'b0;
        RF_regs[2]<=32'b0;
        RF_regs[3]<=32'b0;
        RF_regs[4]<=32'b0;
        RF_regs[5]<=32'b0;
        RF_regs[6]<=32'b0;
        RF_regs[7]<=32'b0;
        RF_regs[8]<=32'b0;
        RF_regs[9]<=32'b0;
        RF_regs[10]<=32'b0;
        RF_regs[11]<=32'b0;
        RF_regs[12]<=32'b0;
        RF_regs[13]<=32'b0;
        RF_regs[14]<=32'b0;
        RF_regs[15]<=32'b0;
        RF_regs[16]<=32'b0;
        RF_regs[17]<=32'b0;
        RF_regs[18]<=32'b0;
        RF_regs[19]<=32'b0;
        RF_regs[20]<=32'b0;
        RF_regs[21]<=32'b0;
        RF_regs[22]<=32'b0;
        RF_regs[23]<=32'b0;
        RF_regs[24]<=32'b0;
        RF_regs[25]<=32'b0;
        RF_regs[26]<=32'b0;
        RF_regs[27]<=32'b0;
        RF_regs[28]<=32'b0;
        RF_regs[29]<=32'b0;
        RF_regs[30]<=32'b0;
        RF_regs[31]<=32'b0;
    end
    else begin
        if(RF_Wena&&ena&&w_addr!=5'b0)    //0寄存器不能修改
            RF_regs[w_addr]<=w_data;     
    end
end

assign r_data1=ena?RF_regs[r_addr1]:32'bz;
assign r_data2=ena?RF_regs[r_addr2]:32'bz;

endmodule