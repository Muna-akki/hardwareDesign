module alu(
	input	[7:0]	A,
	input	[7:0]	B,
	output	[7:0]	out,
	input	[3:0]	CTR,
	input	ck
);
	reg	[7:0]	INA, INB, O;
	reg	[3:0]	C;
	wire	[7:0]	OUT;
	assign out = O;
	always @(posedge ck) begin
		
		case (C)
		'b0000: O <= INA+INB;
		'b0001: O <= INA-INB;
		'b1000: O <= INA&INB;
		'b1001: O <= INA|INB;
		'b1010: O <= INA^INB;
		'b1011: O <= ~INA;
		'b1100: O <= {1'b0,INA[7:1]};
		'b1101: O <= {INA[6:0],1'b0};
		'b1110: O <= {INA[0],INA[7:1]};
		'b1111: O <= {INA[6:0],INA[7]};
		default: O <= 0;
		endcase
		
		INA <= A;
		INB <= B;
		C <= CTR;
		
	end
endmodule
