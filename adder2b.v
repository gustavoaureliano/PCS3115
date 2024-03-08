module adder2b (
	input [1:0] A,
	input [1:0] B,
	output [1:0] S,
	output Cout
);
	wire w4;
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
		.Cout(Cout)
	);
endmodule
