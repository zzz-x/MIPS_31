module npc(
    input [31:0]curAddr,
    output [31:0]nextAddr
);
assign nextAddr=curAddr+4;

endmodule