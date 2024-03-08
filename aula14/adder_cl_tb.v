`timescale 1ns/1ps
// Testbench para os somadores (meio e completo)
// 1. Entenda o circuito gerado (no arquivo adders.v fornecido)
// 2. Execute este TB com:
//    iverilog -o adders_tb.o adders.v adders_tb.v
//    vvp adders_tb.o
// 3. Abra o arquivo gerado adders_tb.vcd com o GTKWave.
// 4. Estude atentamente a forma de onda. Observe o que acontece entre dois casos de teste e discuta com seu grupo.

module adders_tb;

    reg [3:0] a, b;
	reg ci;
	wire [3:0] sRc;
	wire [3:0] sCl;
	wire coRc;
	wire coCl;
	adder_rc adderRc (
		.a(a),
		.b(b),
		.ci(ci),
		.s(sRc),
		.co(coRc)
	);
	adder_cl adderCl (
		.a(a),
		.b(b),
		.ci(ci),
		.s(sCl),
		.co(coCl)
	);
	integer i;
	integer j;
    initial begin
        $dumpfile ("adders_tb.vcd");
        $dumpvars(0, adders_tb);   
		ci = 0;
		a = 0;
		b = 0;
		#20;
		for (i = 0; i < 16; i += 1) begin
			for (j = 0; j < 16; j += 1) begin
				a = i;
				b = j;
				#20;
				$write("a = %b, b = %b, ci = %b -> s = %b, co = %b", a, b, ci, sRc, coRc);
				$display(" - s = %b, co = %b", sCl, coCl);
			end
		end
        $finish;
    end
endmodule
