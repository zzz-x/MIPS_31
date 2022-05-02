module mux3(
    input [2:0]op,
    input [31:0] data0,
    input [31:0] data1,
    input [31:0] data2,
    output reg[31:0]odata
);

always@(*)begin
    case (op)
    3'b001: odata=data0;
    3'b010: odata=data1;
    3'b100: odata=data2;
    endcase
end
endmodule