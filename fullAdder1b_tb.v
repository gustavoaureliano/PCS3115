module fullAdder1b_tb;
	reg A;
	reg B;
	reg Cin;
	wire S;
	wire Cout;
	fullAdder1b u_fullAdder1b (
		.A(A),
		.B(B),
		.Cin(Cin),
		.S(S),
		.Cout(Cout)
	);
	reg clock = 0;
	always #5 clock = ~clock;
	integer i;
	integer j;
	integer k;
	reg [1:0] num;
	initial begin
		$dumpfile("fullAdder1b.vcd");
		$dumpvars;
		for (i = 0; i < 2; i += 1) begin
			for (j = 0; j < 2; j += 1) begin
				for (k = 0; k < 2; k += 1) begin
					A = i;
					B = j;
					Cin = k;
					#10;
				end
			end
		end
		$finish;
	end
	always @(posedge clock) begin
		num[0] = S;
		num[1] = Cout;
		$write("%b + %b + %b = %b%b / ", A, B, Cin, Cout, S);
		$display("%d + %d + %d = %d", A, B, Cin, num);
	end
endmodule
