`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 19:57:49
// Design Name: 
// Module Name: alu
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


module alu(
    input[31:0]a,
    input[31:0]b,
    input[3:0]aluc,
    output reg [31:0]r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
    );

parameter ADDU =4'b0000;
parameter ADD  =4'b0010;
parameter SUBU =4'b0001;
parameter SUB  =4'b0011;
parameter AND  =4'b0100;
parameter OR   =4'b0101;
parameter XOR  =4'b0110;
parameter NOR  =4'b0111;
parameter LUI  =4'b100x;
parameter SLT  =4'b1011;
parameter SLTU =4'b1010;
parameter SRA  =4'b1100;
parameter SLL  =4'b111x;
parameter SRL  =4'b1101;

always @(*)
 begin
     if(aluc[3:1]==3'b100)
            begin
                r={b[15:0],16'b0};
                zero=(r==0)?1:0;
                negative=r[31];
            end
     else if(aluc[3:1]==4'b111)
            begin
                {carry,r}=b<<a;
                zero=(r==0)?1:0;
                negative=r[31];
            end
    else
     begin
     case(aluc)
        ADD :begin
            r=a+b;
             overflow=(a[31]==b[31])&&(~r[31]==a[31])?1:0;
             zero=(r==0)?1:0;
             negative=r[31];
        end
            
        ADDU:begin
            {carry,r}=a+b;
            zero=(r==0)?1:0;
            negative=r[31];
        end

        SUB:begin
            r=a-b;
            overflow=((a[31]==1&&b[31]==0&&r[31]==0)||(a[31]==0&&b[31]==1&&r[31]==1));
            zero=(a==b)?1:0;
            negative=r[31];
        end

        SUBU:begin
            {carry,r}=a-b;
            zero=(a==b)?1:0;
            negative=r[31];
        end

        OR:begin
          r=a|b;
          zero=(r==0)?1:0; 
          negative=r[31];
        end

        AND:begin
            r=a&b;
            zero=(r==0)?1:0;
            negative=r[31];
        end

        XOR:begin
            r=a^b;
            zero=(r==0)?1:0;
            negative=r[31];
        end

        NOR:begin
            r=~(a|b);
            zero=(r==0)?1:0;
            negative=r[31];
        end

        SLT:begin
            if(a[31]==1&&b[31]==0)
                r=1;
            else if(a[31]==0&&b[31]==1)
                r=0;
            else
                r=(a<b)?1:0;
            negative=r;    
            zero=(a-b==0)?1:0;
        end

        SLTU:begin
            r=(a<b)?1:0;
            carry=r;
            zero=(a-b==0)?1:0;
            negative=0;
        end
        
        SRA:begin
            r=($signed(b))>>>a;
            zero=(r==0)?1:0;
            negative=r[31];
            if(a>=1)
            carry=b[a-1];
            else
            carry=0;
        end

        SRL:begin
            r=b>>a;
            zero=(r==0)?1:0;
            negative=r[31];
            if(a>=1)
                carry=b[a-1];
            else
                carry=0;
        end
        default:;
        endcase
     end
end
endmodule
