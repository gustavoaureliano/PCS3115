module adder4b (
	input [3:0] A,
	input [3:0] B,
	output [4:0] S
);
	wire w4, w5, w6, w8;
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
		.Cout(S[4])
	);
endmodule
