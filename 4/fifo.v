module fifo(
	input [7:0] Din, // data in
	output [7:0] Dout, // data out
	input Wen, // Write enable
	input Ren, // Read enable
	input rst, // reset
	input clk, //clock
	output reg Fempty, // Flag Empty
	output  reg Ffull // Flag Full
);
	reg [7:0] FMEM[0:15]; // FIFO memory
	reg [3:0] Wptr, Rptr; // Write Read pointer
	reg [7:0] obuf; // out buffer?
	wire [3:0] NWptr, NRptr; // Next pointer?
	
	wire [7:0] f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15;
	assign f0 = FMEM[0];
	assign f1 = FMEM[1];
	assign f2 = FMEM[2];
	assign f3 = FMEM[3];
	assign f4 = FMEM[4];
	assign f5 = FMEM[5];
	assign f6 = FMEM[6];
	assign f7 = FMEM[7];
	assign f8 = FMEM[8];
	assign f9 = FMEM[9];
	assign f10 = FMEM[10];
	assign f11 = FMEM[11];
	assign f12 = FMEM[12];
	assign f13 = FMEM[13];
	assign f14 = FMEM[14];
	assign f15 = FMEM[15];
	
	assign NWptr = Wptr+1;
	assign NRptr = Rptr+1;
	assign Dout = obuf;
	always @(posedge clk)begin
		if(rst)begin
			if(Wen==1)begin
				if(Wptr!=Rptr-1 & Ffull!=1)begin
					FMEM[Wptr] <= Din;
					Fempty <= 0;
					Wptr <= NWptr;
				end else if(Ffull!=1 & Wptr==Rptr-1) begin
					FMEM[Wptr] <= Din;
					Fempty <= 0;
					Wptr <= NWptr;
					Ffull <= 1;
				end
			end else if(Ren==1) begin
				if(Wptr-1!=Rptr & Fempty!=1) begin
					obuf <= FMEM[Rptr];
					Rptr <= NRptr;
					Ffull <= 0;
					
				end else if(Fempty!=1 & Wptr-1==Rptr)begin
					obuf <= FMEM[Rptr];
					Rptr <= NRptr;
					Ffull <= 0;
					Fempty <= 1;
				end
			end
		end else begin
			Fempty <= 1;
			Ffull <= 0;
			Wptr <= 0;
			Rptr <= 0;
		end
	end



endmodule
