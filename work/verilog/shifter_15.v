/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_15 (
    input [15:0] x,
    input [15:0] y,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        out = x << y[0+3-:4];
      end
      2'h1: begin
        out = x >> y[0+3-:4];
      end
      2'h2: begin
        out = $signed(x) >>> y[0+3-:4];
      end
      default: begin
        out = x;
      end
    endcase
  end
endmodule
