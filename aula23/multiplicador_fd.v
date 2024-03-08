module multiplicador_fd 
    #(parameter WIDTH=4)    
    (
        input clk, rst, a_rst,
              a_en, b_en, q_en, cnt_en,
              a_ld, b_ld, q_ld, cnt_ld,
        output qlsb, zero,
        input  [WIDTH-1:0] B_in, Q_in,
        output [WIDTH*2-1:0] P_out
		);
	wire [$clog2(WIDTH)-1:0] outCounter;
	wire [WIDTH-1:0] outA;
	wire [WIDTH-1:0] outB;
	wire [WIDTH-1:0] outQ;
	wire [WIDTH-1:0] inA;

	counter_dec #($clog2(WIDTH)) contador (
		.clk(clk),
		.rst(rst),
		.en(cnt_en),
		.ld(cnt_ld),
		.d(WIDTH-1),
		.q(outCounter)
	);
	shiftr_reg #(WIDTH) B (
		.clk(clk),
		.rst(rst),
		.en(b_en),
		.load(b_ld),
		.si(1'b0),
		.d(B_in),
		.q(outB)
	);
	shiftr_reg #(WIDTH) A (
		.clk(clk),
		.rst(a_rst),
		.en(a_en),
		.load(a_ld),
		.si(1'b0),
		.d(inA),
		.q(outA)
	);
	shiftr_reg #(WIDTH) Q (
		.clk(clk),
		.rst(rst),
		.en(q_en),
		.load(q_ld),
		.si(outA[0]),
		.d(Q_in),
		.q(outQ)
	);
	assign P_out = {outA, outQ};
	assign qlsb = outQ[0];
	assign zero = (outCounter == 0);
	assign inA = outB + outA;
endmodule
