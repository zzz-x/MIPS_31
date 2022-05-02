`timescale 1ns / 1ps
module cpu31(
    input clk,
    input rst,
    input [31:0]IM_inst,
    input [31:0]DM_rdata,
    output [31:0]PC,
    output [31:0]res,
    output DM_Wena,
    output DM_Rena,
    output [31:0]DM_wdata,
    output [10:0]DM_addr
);

wire [31:0]npc;
assign npc=PC+4;

wire ZF,SF,CF,OF;
wire [3:0]aluc;
wire [4:0]rs,rt,rd;
wire [5:0]op;
wire is_shamt,is_signed;
wire RF_Wena;

wire [31:0]RS_DATA,RT_DATA,RD_DATA;
wire [4:0] jumpType;
wire [2:0] RF_datatype;

controller control(
    .instruction(IM_inst),
    .aluc(aluc),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .op(op),
    .is_shamt(is_shamt),
    .is_signed(is_signed),
    .RF_Wena(RF_Wena),
    .RF_datatype(RF_datatype),
    .DM_W(DM_Wena),
    .DM_R(DM_Rena),
    .jumpType(jumpType)
);


mux3 RFwdata(
    .op(RF_datatype),
    .data0(res),
    .data1(npc),
    .data2(DM_rdata),
    .odata(RD_DATA)
);

RegFile RF(
    .clk(clk),
    .rst(rst),
    .ena(1'b1),
    .RF_Wena(RF_Wena),
    .r_addr1(rs),
    .r_addr2(rt),
    .w_addr(rd),
    .w_data(RD_DATA),
    .r_data1(RS_DATA),
    .r_data2(RT_DATA)
);

wire [31:0]alu_A,alu_B;
assign alu_A=is_shamt?{27'b0,IM_inst[10:6]}:RS_DATA;
assign alu_B=(op&&!jumpType[3]&&!jumpType[2])?(is_signed?{{16{IM_inst[15]}},IM_inst[15:0]}:{16'b0,IM_inst[15:0]}):RT_DATA;
assign DM_wdata = RT_DATA; 
assign DM_addr = (RS_DATA + {{16{IM_inst[15]}},IM_inst[15:0]}- 32'h10010000)/4;

wire [31:0]mux_pc;
wire [4:0]mux5_op;
wire  beq_ok=jumpType[3]&&res==0;
wire  bne_ok=jumpType[2]&&res!=0;
wire  npc_ok=~(beq_ok|bne_ok|jumpType[0]|jumpType[1]);
assign mux5_op={npc_ok,beq_ok,bne_ok,jumpType[1:0]};

wire [31:0]mux5_data1;
wire [31:0]mux5_data2;
assign mux5_data1=npc+{{14{IM_inst[15]}},IM_inst[15:0],2'b0};
assign mux5_data2=npc+{{14{IM_inst[15]}},IM_inst[15:0],2'b0};

mux5 muxpc(
    .op(mux5_op),
    .data0({npc[31:28],IM_inst[25:0],2'b0}),
    .data1(RS_DATA),
    .data2(mux5_data1),
    .data3(mux5_data2),
    .data4(npc),
    .odata(mux_pc)
);
 
alu ALU(
    .a(alu_A),
    .b(alu_B),
    .aluc(aluc),
    .r(res),
    .zero(ZF),
    .carry(CF),  
    .negative(SF), //sign
    .overflow(OF)
);

PC progamecounter(
    .startAddr(32'h00400000),
    .nextAddr(mux_pc),
    .rst(rst),
    .clk(clk),
    .curAddr(PC)
);

endmodule
