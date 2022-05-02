module mux4(
    input [3:0]op,
    input [31:0] data0,
    input [31:0] data1,
    input [31:0] data2,
    input [31:0] data3,
    output reg[31:0]odata
);

always@(*)begin
    case (op)
    4'b0001: odata=data0;
    4'b0010: odata=data1;
    4'b0100: odata=data2;
    4'b1000: odata=data3;
endcase
end
endmodule