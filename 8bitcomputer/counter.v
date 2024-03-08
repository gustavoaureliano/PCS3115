module counter #(
	parameter N = 4
) (
	input clk,
	input rst,
	input load,
	input down,
	input wire [N-1:0] data,
	output reg [N-1:0] count
);
	always @(posedge clk, rst) begin
		if (rst)
			count <= 0;
		else if (load)
			count <= data;
		else if (down)
			count <= count - 1;
		else
			count <= count + 1;
	end
endmodule
