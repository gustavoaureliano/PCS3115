module adder8b_tb;
	reg [7:0] A;
	reg [7:0] B;
	wire [8:0] S;
	integer i;
	integer j;
	adder8b u_adder8b (
		.A(A),
		.B(B),
		.S(S)
	);
	integer count = 0;;
	initial begin
		$dumpfile("adder4b.vcd");
		$dumpvars;
		$monitor("%b + %b = %b", A, B, S);
		for (i = 0; i < 256; i += 1) begin
			for (j = 0; j < 256; j += 1) begin
				#1;
				if ((A+B) !== S) begin
					count += 1;
					$display("%b + %b = %b --> should be %b", A, B, S, (A+B));
				end
				A = i;
				B = j;
			end
		end
		if (count <= 0)
			$display("No error, module working as expected");
		else
			$display("(%d) -> %d <- Error, module not working as expected", count, count > 0);
		$finish;
	end
endmodule
