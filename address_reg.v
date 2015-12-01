module address_reg(ldar,t3,bus,ar);
input [7:0]  bus;
input ldar,t3;
output [7:0] ar;
reg [7:0]ar;
always @(posedge t3 )
if(ldar)
   ar=bus;
endmodule
