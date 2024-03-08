module adder_td;
	reg sub;
	reg [7:0] A;
	reg [7:0] B;
	wire [7:0] R;
	wire co;
	adder #(8) add (
		.sub(sub),
		.A(A),
		.B(B),
		.R(R),
		.co(co)
	);
	initial begin
		sub = 0;
		A = 2;
		B = 5;
		#10;
		$display("%d + %d = %b = %d", A, B, {co, R}, {co, R});
	end
endmodule
