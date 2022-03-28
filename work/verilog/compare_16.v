/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_16 (
    input z,
    input v,
    input n,
    input [15:0] x,
    input [15:0] y,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out = 16'h0000;
    
    case (alufn[1+1-:2])
      2'h0: begin
        out[0+0-:1] = z;
      end
      2'h1: begin
        out[0+0-:1] = n ^ v;
      end
      2'h2: begin
        out[0+0-:1] = z || (n ^ v);
      end
      default: begin
        out[0+0-:1] = 1'h0;
      end
    endcase
  end
endmodule
