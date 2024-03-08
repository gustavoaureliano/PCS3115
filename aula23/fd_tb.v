module multiplicador_uc_tb #(parameter N=4);
	reg clk, rst, start;
	wire a_en, b_en, q_en, cnt_en, a_ld, b_ld, q_ld, cnt_ld, qlsb, zero;
	wire B_in, Q_in, 
	multiplicador_fd
		#(N)
		fd(clk, rst, a_rst,
		   a_en, b_en, q_en, cnt_en,
		   a_ld, b_ld, q_ld, cnt_ld,
		   qlsb, zero,
		   B_in, Q_in,
		   P_out);
	initial begin
		$monitor("%b %b %b %b %b %b %b %b", clk, start, a_rst, a_en, a_ld, b_en, b_ld, cnt_en );
		assign start = 1; #500;
	end
    initial begin
        clk = 1'b0;
	    forever #1 clk = ~clk; #1000;
    end
endmodule
