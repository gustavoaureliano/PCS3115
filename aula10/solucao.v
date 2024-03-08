module solucao (m, inta, intb, intc, intd, sa, sb, sc, sd, y);
	input m, inta, intb, intc, intd, sa, sb, sc, sd;
	output y;
	wire [3:0] i;
	assign i[0] = sa;
	assign i[1] = sb;
	assign i[2] = sc;
	assign i[3] = sd;
	wire [1:0] ws;
	wire wm1, wm2;
	codprisimples u0 (
		.i(i),
		.en(m),
		.y(ws)
	);
	muxsimples mux1 (
		.a(inta),
		.b(intb),
		.s(ws[0]),
		.y(wm1)
	);
	muxsimples mux2 (
		.a(intc),
		.b(intd),
		.s(ws[0]),
		.y(wm2)
	);
	muxsimples mux3 (
		.a(wm1),
		.b(wm2),
		.s(ws[1]),
		.y(y)
	);
endmodule
