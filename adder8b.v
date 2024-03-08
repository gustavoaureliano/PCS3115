module adder8b (
	input [7:0] A,
	input [7:0] B,
	output [8:0] S
);
	wire w4, w5, w6, w7, w8, w9, w10;
	halfAdder1b u3 (
		.A(A[0]),
		.B(B[0]),
		.S(S[0]),
		.Cout(w4)
	);
	fullAdder1b u4 (
		.A(A[1]),
		.B(B[1]),
		.Cin(w4),
		.S(S[1]),
		.Cout(w5)
	);
	fullAdder1b u5 (
		.A(A[2]),
		.B(B[2]),
		.Cin(w5),
		.S(S[2]),
		.Cout(w6)
	);
	fullAdder1b u6 (
		.A(A[3]),
		.B(B[3]),
		.Cin(w6),
		.S(S[3]),
		.Cout(w7)
	);
	fullAdder1b u7 (
		.A(A[4]),
		.B(B[4]),
		.Cin(w7),
		.S(S[4]),
		.Cout(w8)
	);
	fullAdder1b u8 (
		.A(A[5]),
		.B(B[5]),
		.Cin(w8),
		.S(S[5]),
		.Cout(w9)
	);
	fullAdder1b u9 (
		.A(A[6]),
		.B(B[6]),
		.Cin(w9),
		.S(S[6]),
		.Cout(w10)
	);
	fullAdder1b u10 (
		.A(A[7]),
		.B(B[7]),
		.Cin(w10),
		.S(S[7]),
		.Cout(S[8])
	);
endmodule
