module mux5(
    input [4:0]op,
    input [31:0] data0,
    input [31:0] data1,
    input [31:0] data2,
    input [31:0] data3,
    input [31:0] data4,
    output reg[31:0]odata
);

always@(*)begin
    case (op)
    5'b00001: odata=data0;
    5'b00010: odata=data1;
    5'b00100: odata=data2;
    5'b01000: odata=data3;
    5'b10000: odata=data4;
endcase
end
endmodule