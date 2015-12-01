module sequential_gen(clk,t1,t2,t3,t4,nreset);
input  clk,nreset;
output t1,t2,t3,t4;
reg [1:0]  c;
reg t1,t2,t3,t4;

always @(posedge clk )          //×´Ì¬»ú
if(nreset==0)
      c=0;
else
      c=c+1;
always @(posedge clk )       //2-4ÒëÂëÆ÷
if (nreset==0)
     begin 
            t1=0;t2=0;t3=0;t4=0;
     end
else
     case(c)
   		2'b00: begin t1=1;t2=0;t3=0;t4=0;end
   		2'b01: begin t1=0;t2=1;t3=0;t4=0;end
   		2'b10: begin t1=0;t2=0;t3=1;t4=0;end
   		2'b11: begin t1=0;t2=0;t3=0;t4=1;end
     endcase
endmodule