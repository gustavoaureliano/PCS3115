module codpri (i, en, y);
    input [3:0] i;
    input en;
    output [1:0] y;
   	
   	assign en = 1;
	assign y[1] = ((~i[3] & i[2]) | i[3]) & en;
    assign y[0] = ((~i[3] & ~i[2] & i[1]) | i[3]) & en;

endmodule
