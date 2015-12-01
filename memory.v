module memory(clk,ar,ce,we,t3,bus);

input clk;
input [7:0] ar;
inout [7:0] bus;
input ce,we,t3; 

wire wren,rden,oe;
wire [7:0] q,dout;
wire clk;
assign wren=(ce && ar[7]) && (we && t3);
assign rden=(ce && ar[7]) && (~we&& t3);
assign oe=ce && (~we) && (~ar[7]);

assign clk_1=clk;

//lpm_ram_dp1 ram0(bus,ar,ar,wren,rden,dout);
           //module lpm_ram_dp0(data,wraddress,rdaddress,wren,rden,q);
           
RAM0 U1(
	.clock(clk),
	.data(bus),
	.rdaddress(ar),
	.rden(rden),
	.wraddress(ar),
	.wren(wren),
	.q(dout));
assign bus=rden?dout:8'bzzzzzzzz;

//romm rom0(ar,q);  //module romm(ar,q);
ROM0 U2(
	.address(ar),
	.clock(clk_1),
	.q(q));
assign bus=oe?q:8'bzzzzzzzz;

endmodule