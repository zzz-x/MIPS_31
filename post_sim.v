`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/01 14:21:11
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test;
    reg clk,rst;
    wire [31:0]inst,pc;
    reg [31:0] cnt;
    wire[10:0] dma,ima;
    
initial begin
    clk=1'b0;
    rst=1'b1;
    cnt=0;
    #75
    rst=1'b0;
end
always#25 clk=~clk;
always @(posedge clk) begin
    cnt<=cnt+1'b1;
    if(cnt==32'h0000_0230)begin
        //$fclose(file_open);
    end
    else begin
            // $fdisplay(file_open, "pc = %h", pc);
            // $fdisplay(file_open, "inst = %h", inst);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[0]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[1]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[2]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[3]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[4]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[5]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[6]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[7]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[8]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[9]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[10]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[11]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[12]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[13]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[14]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[15]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[16]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[17]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[18]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[19]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[20]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[21]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[22]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[23]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[24]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[25]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[26]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[27]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[28]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[29]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[30]);
            // $fdisplay(file_open, "regfile = %h", sc.cpu.cpu_rf.registers[31]);
        end
end

    sccomp_dataflow sc(
        .clk(clk),
        .rst(rst),
        .inst(inst),
        .pc(pc)
    );
endmodule
