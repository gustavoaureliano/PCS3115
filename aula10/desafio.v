module solucao (
    input m, 
    input [31:0] int,
    input [15:0] s, 
    output reg [1:0] y);
    // m é a chave geral (sempre da prioridade para o inta, que nesse desafio
    //     corresponde ao int[1:0]).
    // int são os comandos dos interruptores, o vetor está "packed", ou seja, 
    //     int[1:0]=inta, int[3:2]=intb e assim por diante. No total, são 16 
    //     interruptores de 2 bits.
    // s são os sensores, s[0] corresponde ao sensor sa.
    // y é a saída, note que o int é de 2 bits, então a saída também é.

    // Escreva sua solução a partir aqui
	wire [3:0] sel;
	codpri16b u0 (
		s,
		m,
		sel
	);
	mux8x1 u1 (
		
	);
endmodule
module codpri16b (
	input [15:0] i,
	input en,
	output [3:0] y
);
	assign y[3] = (i[15] + i[14] + i[13] + i[12] + i[11] + i[10] + i[9] + i[8]) & en;
	assign y[2] = (i[15] + i[14] + i[13] + i[12] + i[7] + i[6] + i[5] + i[4]) & en;
	assign y[1] = (i[15] + i[14] + i[11] + i[10] + i[7] + i[6] + i[3] + i[2]) & en;
	assign y[0] = (i[15] + i[13] + i[11] + i[9] + i[7] + i[5] + i[3] + i[1]) & en;
endmodule
module mux2x2 (
	input [3:0] i,
	input s,
	output [1:0] y
);
    assign y = s ? i[3:2] : i[1:0];
endmodule
module mux4x1 (
	input [7:0] i,
	input [1:0] s,
	output [1:0] y
);
	wire [3:0] wm;	
	mux2x2 mux1 (
		.i(i[3:0]),
		.s(s[0]),
		.y(wm[1:0])
	);
	mux2x2 mux2 (
		.i(i[7:4]),
		.s(s[0]),
		.y(wm[3:2])
	);
	mux2x2 mux3 (
		.i(wm),
		.s(s[1]),
		.y(y)
	);
endmodule
module mux8x1 (
	input [15:0] i,
	input [2:0] s,
	output [1:0] y
);
	wire [3:0] wm;	
	mux4x1 mux1 (
		.i(i[7:0]),
		.s(s[1:0]),
		.y(wm[1:0])
	);
	mux4x1 mux2 (
		.i(i[15:8]),
		.s(s[1:0]),
		.y(wm[3:2])
	);
	mux2x2 mux3 (
		.i(wm),
		.s(s[2]),
		.y(y)
	);
endmodule
module mux16x1 (
	input [32:0] i,
	input [3:0] s,
	output [1:0] y
);
	wire [3:0] wm;	
	mux8x1 mux1 (
		.i(i[15:0]),
		.s(s[2:0]),
		.y(wm[1:0])
	);
	mux8x1 mux2 (
		.i(i[31:16]),
		.s(s[2:0]),
		.y(wm[3:2])
	);
	mux2x2 mux3 (
		.i(wm),
		.s(s[3]),
		.y(y)
	);
endmodule
