module memory_tb;
	reg clk;
	reg write;
	reg  [3:0] address;
	reg  [7:0] data_in;
	wire [7:0] data_out;
	memory #(8,16) ram (
		.clk(clk),
		.write(write),
		.address(address),
		.data_in(data_in),
		.data_out(data_out)
	);
	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end
	integer i;
	initial begin
		$monitor("(%b) - %b | %b", address, data_in, data_out);
		write = 0;
		for (i = 0; i < 16; i = i + 1) begin
			address = i; #1;
		end
		write = 1;
		for (i = 0; i < 16; i = i + 1) begin
			address = i;
			data_in = i + 1;
			#2;
		end
		write = 0;
		for (i = 0; i < 16; i = i + 1) begin
			address = i; #1;
		end
		$finish();;
	end
endmodule
