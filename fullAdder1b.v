module fullAdder1b(
	input A,
	input B,
	input Cin,
	output S,
	output Cout
);
	wire w1, w2, w3;
	halfAdder1b u0 (
		.A(A),
		.B(B),
		.S(w1),
		.Cout(w2)
	);
	halfAdder1b u1 (
		.A(w1),
		.B(Cin),
		.S(S),
		.Cout(w3)
	);
	or u2 (Cout, w2, w3);
endmodule
