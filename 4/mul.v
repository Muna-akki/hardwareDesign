module mul(
	input	[7:0]	A,
	input	[7:0]	B,
	output	[16:0]	O,
	input	clk,
	input	start,
	output	fin
);
	reg	[3:0]	st;
	reg	[7:0]	inA,inB;
	reg	[16:0]	out;
	reg finish;
	assign fin = finish;
	assign O = out;
	always @(posedge clk)begin
		if(start==1)begin
			inA <= A;
			inB <= B;
			st <= 0;
			finish <= 0;
			out <= 0;
		end else begin
			if(st<=6)begin
				out <= (out<<1) +inA*inB[7-st];
				st <= st+1;
			end else if(st==7)begin
				out <= (out<<1) +inA*inB[7-st];
				st <= st+1;
				finish <= 1;
			end else begin
				finish <= 0;
			end
		end
	end
	
endmodule
