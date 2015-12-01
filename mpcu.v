module mpcu(q,clk,ad,iro,p1,nclr,t2,t4,ir,iri,swe,srd,s,m,ncn,load,ce,we,ldr0,lddr1,lddr2,ldir,ldpc,ldar,nalu_bus,npc_bus,nr0_bus,nsw_bus); 

input clk;

output [3:0] s;
output m,ncn,ce,we,ldr0,lddr1,lddr2,ldir,ldpc,ldar;
output nalu_bus,npc_bus,nr0_bus,nsw_bus,load;
output [4:0] ad;	
output [7:5] iro;
output [7:5] iri;
output p1;

input swe,srd,nclr,t2;
input [7:0] ir;
input t4;

output [23:0] q;
wire [23:0] q;
reg [23:5] out;
reg [4:0]  ad;
wire [7:5]  iro;

assign iri=ir[7:5];

assign iro[7]=!(p1&&t4&&ir[7]);
assign iro[6]=!(p1&&t4&&ir[6]);
assign iro[5]=!(p1&&t4&&ir[5]);

assign s[3:0]=out[23:20];
assign m=out[19];

assign ncn=out[18];
assign load=out[17];
assign ce=out[16];
assign we=out[15];
assign ldr0=out[14];
assign lddr1=out[13];
assign lddr2=out[12];
assign ldir=out[11];
assign ldpc=out[10];
assign ldar=out[9];
assign nalu_bus=out[8];

assign p1=out[5];

assign nsw_bus=!((!out[7]) && out[6]);//01
assign nr0_bus=!(out[7] && (!out[6]));//10
assign npc_bus=!(out[7] && out[6]);//11

always @(posedge t2 or posedge !nclr   or  posedge !iro[5])
if(!nclr==1)
     ad[0]=0;
else
     begin
         if(iro[5]==0) ad[0]=1; else ad[0]=q[0];
     end


always @(posedge t2 or posedge !nclr   or  posedge !iro[6])
if(!nclr==1)
     ad[1]=0;
else
     begin
        if(iro[6]==0) ad[1]=1; else ad[1]=q[1];
     end
always @(posedge t2 or posedge !nclr   or  posedge !iro[7])
if(!nclr==1)
   ad[2]=0;
else
   begin
      if(iro[7]==0) 
          ad[2]=1; 
    else 
          ad[2]=q[2];
   end

always @(posedge t2 or posedge !nclr   or  posedge !srd)
if(!nclr==1)
   ad[3]=0;
else
   begin
       if(srd==0) 
          ad[3]=1; 
      else 
          ad[3]=q[3];
   end
always @(posedge t2 or posedge !nclr   or  posedge !swe)
if(!nclr==1)
   ad[4]=0;
else
   begin
      if(swe==0) 
          ad[4]=1; 
      else 
          ad[4]=q[4];
   end

always @(posedge t2  or posedge !nclr)
if (nclr==0)
   out[23:5]=0;
else 
   out[23:5]=q[23:5];

//lpm_rom1 rom0(ad[4:0],q[23:0]);   //memory of microinstruction
MPC_ROM U1(
	.address(ad[4:0]),
	.clock(clk),
	.q(q[23:0]));

endmodule