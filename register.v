module register(ldr0,t4,nr0_bus,bus,r0);
input ldr0,t4,nr0_bus;
inout [7:0] bus;
output [7:0] r0;
reg [7:0]r0;

always @(posedge t4)
if(ldr0)    
	r0=bus;

assign bus=nr0_bus?8'bzzzzzzzz:r0;
endmodule 