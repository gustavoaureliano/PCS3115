module multiplicador_uc_tb #(parameter N=4);
	reg clk, rst, start, qlsb, zero;
	wire a_rst, a_en, b_en, q_en, cnt_en,
			a_ld, b_ld, q_ld, cnt_ld, done;
	multiplicador_uc uc(
		.clk(clk),
		.rst(rst),
		.start(start),
		.qlsb(qlsb),
		.zero(zero),
		.a_rst(a_rst),
		.a_en(a_rst),
		.b_en(b_en),
		.q_en(q_en),
		.cnt_en(cnt_en),
		.a_ld(a_ld),
		.b_ld(b_ld),
		.q_ld(q_ld),
		.cnt_ld(cnt_ld),
		.done(done)
	);
	initial begin
		$monitor("%b %b %b %b %b %b %b %b", clk, start, a_rst, a_en, a_ld, b_en, b_ld, cnt_en );
		assign start = 1; #500;
	end
    initial begin
        clk = 1'b0;
	    forever #1 clk = ~clk; #500;
    end
endmodule
