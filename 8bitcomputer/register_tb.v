module register_tb;
	reg clk;
	reg rst;
	reg load;
	reg  [7:0] d;
	wire [7:0] q;
	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end
	register #(8) regs (
		.clk(clk),
		.rst(rst),
		.load(load),
		.d(d),
		.q(q)
	);
	initial begin
		$monitor("%b | %b", d, q);
		rst = 1; #5;
		rst = 0;
		d = 8'b01011010;
		#5;
		load = 1;
		#5;
		load = 0;
		rst = 1;
		#5;
		rst = 0;
		$finish();
	end
endmodule
