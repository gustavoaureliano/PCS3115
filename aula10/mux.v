module mux (
	input a, 
	input b, 
	input c, 
	input d, 
	input [1:0] s, 
	output y
);
    assign y = (a & ~s[1] & ~s[0]) + (b & ~s[1] & s[0]) + (c & s[1] & ~s[0]) + (d & s[1] & s[0]);
endmodule
