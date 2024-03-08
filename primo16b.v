module primo (N, F);
input [15:0] N;
output reg F;
integer i;
	always @ (*) begin
		F = 1;
		if (N == 1)
			F = 0;
		else if (N == 2)
			F = 1;
		else if ((N % 2 == 0))
			F = 0;
		else for (i = 3; i <= 255; i = i + 2)
			if (((N % i) == 0) && (N != i))
				F = 0;
	end
endmodule
