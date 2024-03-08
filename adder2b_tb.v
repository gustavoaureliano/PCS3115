module adder2b_tb;
	reg [1:0] A;
	reg [1:0] B;
	wire [1:0] S;
	wire Cout;
	adder2b u_adder2b (
		.A(A),
		.B(B),
		.S(S),
		.Cout(Cout)
	);
	reg clock = 0;
	always #5 clock = ~clock;
	integer i;
	integer j;
	reg [2:0] num;
	initial begin
		$dumpfile("adder2b.vcd");
		$dumpvars;
		for (i = 0; i < 4; i += 1) begin
			for (j = 0; j < 4; j += 1) begin
				A = i;
				B = j;
				#10;
			end
		end
		$finish;
	end
	always @(posedge clock) begin
		num[2] = Cout;
		num[1] = S[1];
		num[0] = S[0];
		$write("%b + %b = %b%b / ", A, B, Cout, S);
		$display("%d + %d = %d", A, B, num);
	end
endmodule
