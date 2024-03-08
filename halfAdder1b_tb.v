module halfAdder1b_tb;
	reg A;
	reg B;
	wire S;
	wire Cout;
	halfAdder1b u_halfAdder1b (
		.A(A),
		.B(B),
		.S(S),
		.Cout(Cout)
	);
	reg clock = 0;
	always #5 clock = ~clock;
	integer i;
	integer j;
	reg [1:0] num;
	initial begin
		$dumpfile("halfAdder1b.vcd");
		$dumpvars;
		for (i = 0; i <= 1; i += 1) begin
			for (j = 0; j <= 1; j += 1) begin
				A = i;
				B = j;
				#10;
			end
		end
		$finish;
	end
	always @(posedge clock) begin
		num[0] = S;
		num[1] = Cout;
		$write("%b + %b = %b%b / ", A, B, Cout, S);
		$display("%d + %d = %d", A, B, num);
	end
endmodule
