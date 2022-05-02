module PC(
    input [31:0] startAddr, //default addr
    input [31:0] nextAddr,
    input rst,
    input clk,
    output [31:0] curAddr
);
 reg [31:0] PCReg;
    always @(negedge clk or posedge rst) begin
            if (rst) begin
                PCReg <= startAddr;
            end
            else begin
                PCReg <= nextAddr;
            end
        end

    assign curAddr=PCReg;

endmodule