module fulladder (
	input A,
	input B,
	input Ci,
	output S,
	output Co
);
	wire G, P;
	halfadder ha0 (
		.A(A),
		.B(B),
		.S(P),
		.Co(G)
	);
	halfadder ha1 (
		.A(P),
		.B(Ci),
		.S(S),
		.Co(Co)
	);
endmodule
