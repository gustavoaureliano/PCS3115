module primo_tb();
	reg [3:0] N;
	wire F;
	primo u_primo ( 
		.N(N), 
		.F(F) 
	);
	reg clk = 0;
	always #5 clk = ~clk;
	integer i;

	initial begin
		$dumpfile("test.vcd");
		$dumpvars;
		for (i = 0; i <= 15; i = i+1) begin 
			N = i;
			#10;
		end
		$finish;
	end
	always @(posedge clk) begin
		$display("N(%d) = %b, F = %b", N, N, F);
	end
endmodule
