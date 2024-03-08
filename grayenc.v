module grayenc (
input [3:0] Nbin,
output [3:0] Ngray
);

wire w1,w2,w3,w4,w6,w7,w8,w9,w11,w12,w13;
and(w1,~Nbin[3],~Nbin[2],~Nbin[1],~Nbin[0]);
and(w2,Nbin[3],~Nbin[1],Nbin[0]);
and(w3,Nbin[3],Nbin[1]);
and(w4,Nbin[3],Nbin[2],~Nbin[1]);
or(Ngray[3],w1,w2,w3,w4);

and(w6,Nbin[3],~Nbin[2]);
and(w7,Nbin[3],~Nbin[1],~Nbin[0]);
and(w8,~Nbin[3],Nbin[2],Nbin[0]);
and(w9,~Nbin[3],Nbin[2],Nbin[1]);
or(Ngray[2],w6,w7,w8,w9);

and(w11,Nbin[2],~Nbin[1]);
and(w12,~Nbin[2],Nbin[1],Nbin[0]);
and(w13,Nbin[2],Nbin[1],~Nbin[0]);
or(Ngray[1],w11,w12,w13);

and(Ngray[0],Nbin[1], 1);

endmodule 