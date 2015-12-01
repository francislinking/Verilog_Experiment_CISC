module CISC_TOP_MODULE(	ldr0,/*t4,*/nr0_bus,bus,r0,
						lddr1,lddr2,nalu_bus,/*t4,/*bus,*/s,m,cn,
						clk,t1,t2,t3,t4,nreset,
						/*t4,*/ldpc,load,npc_bus,pc,/*bus*/
						ldar,/*t3,bus,*/ar,
						/*clk,ar,*/ce,we,/*t3,bus,*/
						ldir,/*t3,bus,*/ir,
						/*bus,*/nsw_bus,/*t4,ce,we,*/sw_addr,sw_data,/*load,*/port,
						/*clk,*/ad,iro,p1,nclr,/*t2,t4,*/iri,swe,srd,/*s,m,*/ncn,/*load,ce,we,ldr0,lddr1,lddr2,ldir,ldpc,ldar,nalu_bus,npc_bus,nr0_bus,nsw_bus*/
						q,
						);
//register port			
//input ldr0,/*t4,*/nr0_bus;
inout [7:0] bus;
output [7:0] r0;

//alu port
input /*lddr1,lddr2,m,t4,nalu_bus,*/cn;
//input [3:0] s;     

//sequential_gen port
input  clk,nreset;
output t1,t2,t3,t4;

//program_cnt port
//input /*t4,*/ldpc,load,npc_bus;//nreset,clk,
output [7:0] pc;

//address_reg
//input ldar/*,t3*/;
output [7:0] ar;
					
//memory port
//input ce,we/*,t3*/; 

//instruction_reg port
//input ldir/*,t3*/;
output [7:0] ir;

//mcpu port
output [3:0] s;
output m,ncn,ce,we,ldr0,lddr1,lddr2,ldir,ldpc,ldar;
output nalu_bus,npc_bus,nr0_bus,nsw_bus,load;
output [4:0] ad;
output [7:5] iro;
output [7:5] iri;
output p1;

output [23:0] q;

input swe,srd,nclr/*,t2*/;


//in_out port
//input nsw_bus/*,t4,ce,we,load*/;
input [7:0] sw_addr,sw_data;
output [7:0] port;

register		U1(ldr0,t4,nr0_bus,bus,r0);

alu 			U2(lddr1,lddr2,nalu_bus,t4,bus,s,m,cn);

sequential_gen	U3(clk,t1,t2,t3,t4,nreset);

program_cnt		U4(t4,ldpc,load,npc_bus,pc,bus);

address_reg		U5(ldar,t3,bus,ar);

memory			U6(clk,ar,ce,we,t3,bus);

instruction_reg	U7(ldir,t3,bus,ir);

mpcu			U8(q,clk,ad,iro,p1,nclr,t2,t4,ir,iri,swe,srd,s,m,ncn,load,ce,we,ldr0,lddr1,lddr2,ldir,ldpc,ldar,nalu_bus,npc_bus,nr0_bus,nsw_bus); 

in_out			U9(bus,nsw_bus,t4,ce,we,sw_addr,sw_data,load,port);


endmodule 