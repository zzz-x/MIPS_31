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
    integer  file_open;

initial begin
    clk=1'b0;
    rst=1'b1;
    cnt=0;
    #15
    rst=1'b0;
    file_open = $fopen("output.txt", "a");
end
always#5 clk=~clk;
always @(negedge clk) begin
    cnt<=cnt+1'b1;
    if(cnt==32'h0000_0230)begin
        $fclose(file_open);
    end
    else begin
            $fdisplay(file_open, "pc: %h", pc);
            $fdisplay(file_open, "inst: %h", inst);
            $fdisplay(file_open, "aluc = %h", sc.cpu.aluc);
            $fdisplay(file_open, "lui = %h", sc.cpu.control.__lui__);
            $fdisplay(file_open, "aluB = %h", sc.cpu.alu_B);
            $fdisplay(file_open, "RF_Waddr = %h", sc.cpu.rd);
            $fdisplay(file_open, "RF_WENA = %h", sc.cpu.RF_Wena);
            $fdisplay(file_open, "RF_Wdata = %h", sc.cpu.RD_DATA);

            $fdisplay(file_open, "regfile0: %h", sc.cpu.RF.RF_regs[0]);
            $fdisplay(file_open, "regfile1: %h", sc.cpu.RF.RF_regs[1]);
            $fdisplay(file_open, "regfile2: %h", sc.cpu.RF.RF_regs[2]);
            $fdisplay(file_open, "regfile3: %h", sc.cpu.RF.RF_regs[3]);
            $fdisplay(file_open, "regfile4: %h", sc.cpu.RF.RF_regs[4]);
            $fdisplay(file_open, "regfile5: %h", sc.cpu.RF.RF_regs[5]);
            $fdisplay(file_open, "regfile6: %h", sc.cpu.RF.RF_regs[6]);
            $fdisplay(file_open, "regfile7: %h", sc.cpu.RF.RF_regs[7]);
            $fdisplay(file_open, "regfile8: %h", sc.cpu.RF.RF_regs[8]);
            $fdisplay(file_open, "regfile9: %h", sc.cpu.RF.RF_regs[9]);
            $fdisplay(file_open, "regfile10: %h", sc.cpu.RF.RF_regs[10]);
            $fdisplay(file_open, "regfile11: %h", sc.cpu.RF.RF_regs[11]);
            $fdisplay(file_open, "regfile12: %h", sc.cpu.RF.RF_regs[12]);
            $fdisplay(file_open, "regfile13: %h", sc.cpu.RF.RF_regs[13]);
            $fdisplay(file_open, "regfile14: %h", sc.cpu.RF.RF_regs[14]);
            $fdisplay(file_open, "regfile15: %h", sc.cpu.RF.RF_regs[15]);
            $fdisplay(file_open, "regfile16: %h", sc.cpu.RF.RF_regs[16]);
            $fdisplay(file_open, "regfile17: %h", sc.cpu.RF.RF_regs[17]);
            $fdisplay(file_open, "regfile18: %h", sc.cpu.RF.RF_regs[18]);
            $fdisplay(file_open, "regfile19: %h", sc.cpu.RF.RF_regs[19]);
            $fdisplay(file_open, "regfile20: %h", sc.cpu.RF.RF_regs[20]);
            $fdisplay(file_open, "regfile21: %h", sc.cpu.RF.RF_regs[21]);
            $fdisplay(file_open, "regfile22: %h", sc.cpu.RF.RF_regs[22]);
            $fdisplay(file_open, "regfile23: %h", sc.cpu.RF.RF_regs[23]);
            $fdisplay(file_open, "regfile24: %h", sc.cpu.RF.RF_regs[24]);
            $fdisplay(file_open, "regfile25: %h", sc.cpu.RF.RF_regs[25]);
            $fdisplay(file_open, "regfile26: %h", sc.cpu.RF.RF_regs[26]);
            $fdisplay(file_open, "regfile27: %h", sc.cpu.RF.RF_regs[27]);
            $fdisplay(file_open, "regfile28: %h", sc.cpu.RF.RF_regs[28]);
            $fdisplay(file_open, "regfile29: %h", sc.cpu.RF.RF_regs[29]);
            $fdisplay(file_open, "regfile30: %h", sc.cpu.RF.RF_regs[30]);
            $fdisplay(file_open, "regfile31: %h", sc.cpu.RF.RF_regs[31]);
        end
end


    sccomp_dataflow sc(
        .clk(clk),
        .rst(rst),
        .inst(inst),
        .pc(pc)
    );
endmodule
