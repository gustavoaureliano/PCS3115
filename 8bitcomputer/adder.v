module adder #(
	parameter WIDTH = 8
) (
	input sub,
	input  [WIDTH-1:0] A,
	input  [WIDTH-1:0] B,
	output [WIDTH-1:0] R,
	output co
);
	assign {co,R} = sub ? A-B : A+B;
endmodule
