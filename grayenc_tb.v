module grayenc_tb;
	reg [3:0] Nbin;
	wire [3:0] Ngray;
	grayenc u_grayenc (
		.Nbin(Nbin),
		.Ngray(Ngray)
	);
	reg clock = 0;
	always #5 clock = ~clock;
		integer i;
	initial begin
		$dumpfile("grayenc.vcd");
		$dumpvars;
		for (i = 0; i <= 15; i = i+1) begin
			Nbin = i;
			#10;
		end
		$finish;
	end
	always @(posedge clock) begin
		$display("N(%d) = %b -> %b", Nbin, Nbin, Ngray);
	end
endmodule
