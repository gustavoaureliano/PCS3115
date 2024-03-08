module primo(N, F);
input [3:0] N;
output F;
	wire w1, w2, w3, w4;
	and u0 (w1, N[2], ~N[1], N[0]);
	and u1 (w2, ~N[3], N[1], N[0]);
	and u2 (w3, ~N[3], ~N[2], N[1]);
	and u3 (w4, ~N[2], N[1], N[0]);
	or u4 (F, w1, w2, w3, w4);
endmodule
