module halfAdder1b (
	input A,
	input B,
	output S,
	output Cout
);
	xor (S, A, B);
	and (Cout, A, B);
endmodule
