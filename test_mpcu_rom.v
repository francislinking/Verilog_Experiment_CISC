module test_mpcu_rom(clk,ad,q);
input clk;
input 	[4:0] ad;
output [23:0] q;

MPC_ROM U1(
	.address(ad[4:0]),
	.clock(clk),
	.q(q[23:0]));

endmodule 