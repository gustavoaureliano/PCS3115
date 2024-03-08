module mux_tb;
    reg a;
	reg b;
	reg c;
	reg d;
	reg [1:0] s;
    wire y;
	wire w1, w2, w3;
    muxsimples dut0 (
		.a(a),
		.b(b),
		.s(s[0]),
		.y(w1)
	);
    muxsimples dut1 (
		.a(c),
		.b(d),
		.s(s[0]),
		.y(w2)
	);
    muxsimples dut2 (
		.a(w1),
		.b(w2),
		.s(s[1]),
		.y(y)
	);
 	integer i;
    initial begin
        $monitor("A = %x, B = %x, C = %x, D = %x, S = %x, X = %x", a,b,c,d,s,y);
		for (i = 0; i < 4; i +=1 ) begin
			#1 a=0;b=0;c=0;d=0;s=i;
			#1 a=1;b=0;c=0;d=0;s=i;
			#1 a=0;b=1;c=0;d=0;s=i;
			#1 a=0;b=0;c=1;d=0;s=i;
			#1 a=0;b=0;c=0;d=1;s=i;
		end
        $finish;
    end
endmodule
