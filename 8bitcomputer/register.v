module register #(
	parameter N = 8
) (
	input clk, 
	input rst,
	input load,
	input  [N-1:0] d,
	output [N-1:0] q
);
	reg [N-1:0] sreg;
	always @(posedge clk, rst) begin
		if (rst)
			sreg = 0;
		else if (load)
			sreg = d;
	end
	assign q = sreg;
endmodule
