module DIV(
    input clk,
    input rst,
    output reg clk_out
);

reg[31:0] cnt;
parameter N =100000;

always @(posedge clk or posedge rst)begin
    if(rst)begin
        cnt<=0;
        clk_out<=0;
    end
    else if(cnt==N/2-1)begin
        clk_out<=~clk_out;
        cnt<=0;
    end
    else
        cnt<=cnt+1'b1;
end
endmodule