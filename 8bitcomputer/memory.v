module memory #(
	parameter WIDTH = 8,
	parameter DEPTH = 16,
	parameter DEPTH_LOG = $clog2(DEPTH)
) (
	input clk,
	input write,
	input  [DEPTH_LOG-1:0] address,
	input  [WIDTH-1:0] data_in,
	output [WIDTH-1:0] data_out
);
	reg [WIDTH-1:0] ram [0:DEPTH-1];
	initial begin
		$readmemh("ram.data", ram);
	end
	always @(posedge clk) begin
		if (write)
			ram[address] <= data_in;
	end
	assign data_out = ram[address];
endmodule
