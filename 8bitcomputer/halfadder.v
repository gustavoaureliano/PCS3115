module halfadder (
	input A,
	input B,
	output S,
	output Co
);
	assign S = A ^ B;
	assign Co = A & B;
endmodule
