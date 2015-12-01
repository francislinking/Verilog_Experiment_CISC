module instruction_reg(ldir,t3,bus,ir);
input ldir,t3;
input [7:0]  bus;
output [7:0] ir;
reg [7:0] ir;
always @(posedge t3 )
   if(ldir)      ir=bus;
endmodule 