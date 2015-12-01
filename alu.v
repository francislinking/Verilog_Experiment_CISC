module alu(lddr1,lddr2,nalu_bus,t4,bus,s,m,cn );
input lddr1,lddr2,m,t4,nalu_bus,cn;
input [3:0] s;     
inout [7:0] bus;
reg[7:0] dr1,dr2,out;    
tri [7:0] bus;

assign   bus=nalu_bus?8'bzzzzzzzz:out;

always @(s or m or dr1 or dr2 or cn)
if (!m)
case(s)
	4'b0000:out=dr1;
	4'b0001:out=dr1|dr2;
	4'b0010:out=dr1 |(~dr2);
	4'b0011:out=8'hff;

	4'b0100:out=dr1+(dr1&(~dr2));
	4'b0101:out=(dr1|dr2)+(dr1 & (~dr2));
	4'b0110:out=dr1 - dr2-cn;
	4'b0111:out=(dr1 & (~dr2))-cn;

	4'b1000:out=dr1+(dr1 & dr2);
	4'b1001:out=dr1+dr2;
	4'b1010:out=(dr1 | (~dr2))+(dr1 & dr2);
	4'b1011:out=(dr1 & dr2)-cn;

	4'b1100:out=dr1+dr1;
	4'b1101:out=(dr1|dr2)+dr1;
	4'b1110:out=(dr1|(~dr2))+dr1;
	4'b1111:out=dr1 -cn;
endcase
else
case(s)
	4'b0000:out=~dr1;
	4'b0001:out=~(dr1|dr2);
	4'b0010:out=(~dr1 )& dr2;
	4'b0011:out=0;

	4'b0100:out=~(dr1&dr2);
	4'b0101:out=~dr2;
	4'b0110:out=(dr1&(~dr2))|((~dr1)&dr2);
	4'b0111:out=dr1 & (~dr2);

	4'b1000:out=~dr1|dr2;
	4'b1001:out=~(dr1&(~dr2))|((~dr1)&dr2);
	4'b1010:out=dr2;
	4'b1011:out=dr1 & dr2;

	4'b1100:out=8'hff;
	4'b1101:out=dr1|(~dr2);
	4'b1110:out=dr1 | dr2;
	4'b1111:out=dr1 ;
endcase

always @(posedge t4)
      if(lddr1) dr1=bus;
always @(posedge t4)
	 if(lddr2) dr2=bus;
	 
endmodule 