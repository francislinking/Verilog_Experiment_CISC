module program_cnt(t4,ldpc,load,npc_bus,pc,bus);
input t4,ldpc,load,npc_bus;//nreset,clk,
output [7:0] pc;
inout [7:0] bus;
reg [7:0]q;

assign pc=q;
always @(posedge t4)
if(load)
   q<=bus;
else
   if(ldpc)    q<=q+1;
assign bus = npc_bus ? 8'bZZZZZZZZ : q;
endmodule