module memory_tb;
	reg clk;
	reg rst;
	reg load;
	reg down;
	reg  [3:0] data;
	wire [3:0] count;
	counter #(4) cont (
		.clk(clk),
		.rst(rst),
		.load(load),
		.down(down),
		.data(data),
		.count(count)
	);
	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end
	initial begin
		$monitor("%b, %b, %b, %b, %b", rst, load, down, data, count);
		rst = 1; #1;
		rst = 0;
		#30;
		down = 1;
		#30;
		down = 0;
		data = 4'b1010;
		load = 1;
		#1;
		load = 0;
		#10;
		$finish();
	end
endmodule
