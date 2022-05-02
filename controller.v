`timescale 1ns / 1ps
module controller(
    input [31:0]instruction,
    output [3:0]aluc,
    output [5:0]op,
    output is_shamt,
    output is_signed,
    /*regfile操作*/
    output [4:0]rs,
    output [4:0]rt,
    output [4:0]rd,
    output RF_Wena,
    output [2:0]RF_datatype,
    /*DMEM操作*/
    output DM_W,
    output DM_R,
    /*J型指令*/
    output [4:0]jumpType

);

// op=0
wire __add__,__addu__,__sub__,__subu__,__and__,__or__;
wire __xor__,__nor__,__slt__,__sltu__,__sll__,__srl__;
wire __sra__,__sllv__,__srlv__,__srav__,__jr__;
//op!=0
wire __addi__,__addiu__,__andi__,__ori__,__xori__,__lw__;
wire __sw__,__beq__,__bne__,__slti__,__sltiu__,__lui__;
wire __j__,__jal__;

wire [5:0]func;
assign op=instruction[31:26];
assign func=(op==0)?instruction[5:0]:6'bz;

assign __add__  = (op==6'b0&&func==6'b100_000);
assign __addu__ = (op==6'b0&&func==6'b100_001);
assign __sub__  = (op==6'b0&&func==6'b100_010);
assign __subu__  = (op==6'b0&&func==6'b100_011);
assign __and__  = (op==6'b0&&func==6'b100_100);
assign __or__   = (op==6'b0&&func==6'b100_101);
assign __xor__  = (op==6'b0&&func==6'b100_110);
assign __nor__  = (op==6'b0&&func==6'b100_111);
assign __slt__  = (op==6'b0&&func==6'b101_010);
assign __sltu__ = (op==6'b0&&func==6'b101_011);
assign __sll__  = (op==6'b0&&func==6'b000_000);
assign __srl__  = (op==6'b0&&func==6'b000_010);
assign __sra__  = (op==6'b0&&func==6'b000_011);
assign __sllv__ = (op==6'b0&&func==6'b000_100);
assign __srlv__ = (op==6'b0&&func==6'b000_110);
assign __srav__ = (op==6'b0&&func==6'b000_111);
assign __jr__   = (op==6'b0&&func==6'b001_000);

assign __addi__ = (op==6'b001_000);
assign __addiu__= (op==6'b001_001);
assign __andi__ = (op==6'b001_100);
assign __ori__  = (op==6'b001_101);
assign __xori__ = (op==6'b001_110);
assign __lw__   = (op==6'b100_011);
assign __sw__   = (op==6'b101_011);
assign __beq__  = (op==6'b000_100);
assign __bne__  = (op==6'b000_101);
assign __slti__ = (op==6'b001_010);
assign __sltiu__= (op==6'b001_011);
assign __lui__  = (op==6'b001_111);

assign __j__    = (op==6'b000_010);
assign __jal__  = (op==6'b000_011);

// ALU指令
assign  aluc[0]=__subu__|__sub__|__or__|__nor__|__slt__|__srl__|__srlv__|__ori__|__slti__|__beq__|__bne__;
assign  aluc[1]=__add__|__sub__|__xor__|__nor__|__slt__|__sltu__|__sll__|__sllv__|__addi__|__xori__|__slti__|__sltiu__|__beq__|__bne__;
assign  aluc[2]=__and__|__or__|__xor__|__nor__|__sra__|__srav__|__sll__|__sllv__|__srl__|__srlv__|__andi__|__ori__|__xori__;
assign  aluc[3]=__lui__|__slt__|__sltu__|__sra__|__srav__|__sll__|__sllv__|__srl__|__srlv__|__slti__|__sltiu__;

//寄存器地址
assign rs=instruction[25:21];
assign rt=instruction[20:16];
assign rd=__jal__?31
                :(op?instruction[20:16]:instruction[15:11]);

//寄存器堆写
assign RF_Wena=~(__sw__|__j__|__jr__|__beq__|__bne__);
//assign RF_datatype={__lw__,__jal__,!__lw__&!__jal__};
assign RF_datatype= __lw__?3'b100:
                          __jal__?3'b010:
                          3'b001;

assign is_shamt=__sll__|__srl__|__sra__;
assign is_signed=__addi__|__addiu__|__slti__|__sltiu__;

assign DM_W = __sw__;
assign DM_R = __lw__;

assign jumpType= (__j__|__jal__)? 5'b00001:
                              __jr__? 5'b00010:
                              __bne__?5'b00100:
                              __beq__?5'b01000:5'b10000;

                            

endmodule
    