module in_out(bus,nsw_bus,t4,ce,we,sw_addr,sw_data,load,port);

input nsw_bus,t4,ce,we,load;
input [7:0] sw_addr,sw_data;
output [7:0] port;
inout [7:0] bus;

reg [7:0] r0;
reg [7:0] port;

always @(posedge t4)
if(ce==0 && we==1)   // ce=0 且we=1
port=bus;

assign   bus=(nsw_bus||ce||we||load)?8'bzzzzzzzz: sw_data;
//参见微程序表---11
assign   bus=(nsw_bus||~load)?8'bzzzzzzzz: sw_addr;
//参见微程序表---00

endmodule