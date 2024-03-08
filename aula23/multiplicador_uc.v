module multiplicador_uc(
     input  clk, rst, start, qlsb, zero,
     output reg a_rst, a_en, b_en, q_en, cnt_en,
            a_ld, b_ld, q_ld, cnt_ld, done
);
	reg [2:0] state;
	reg [2:0] next_state;	
	reg [9:0] out;
	always @(posedge clk) begin
		a_rst = 0;
		if (rst) state = 0;
		state <= next_state;
	end
	always @(state) begin
		case(state)
			0:	if (start) next_state = 1;
				else next_state = 0;
			1:	next_state = 2;
			2:	if (qlsb) next_state = 3;
				else next_state = 4;	
			3:	next_state = 4;
			4:	if (zero) next_state = 5;
				else next_state = 2;
			5: 	if (!start) next_state = 5;
				else next_state = 0;
		endcase
	end
	always @(state)
		case(state)
			0:	begin 
					a_rst  = 0;
					a_en   = 0;
					b_en   = 0;
					q_en   = 0;
					cnt_en = 0;
					a_ld   = 0;
					b_ld   = 0;
					q_ld   = 0;
					cnt_ld = 0;
					done   = 0;
				end
			1:	begin 
					a_rst  = 1;
					a_en   = 0;
					b_en   = 1;
					q_en   = 1;
					cnt_en = 1;
					a_ld   = 0;
					b_ld   = 1;
					q_ld   = 1;
					cnt_ld = 1;
					done   = 0;
				end
			2:	begin 
					a_rst  = 0;
					a_en   = 0;
					b_en   = 0;
					q_en   = 0;
					cnt_en = 0;
					a_ld   = 0;
					b_ld   = 0;
					q_ld   = 0;
					cnt_ld = 0;
					done   = 0;
				end
			3:	begin 
					a_rst  = 0;
					a_en   = 1;
					b_en   = 0;
					q_en   = 0;
					cnt_en = 0;
					a_ld   = 1;
					b_ld   = 0;
					q_ld   = 0;
					cnt_ld = 0;
					done   = 0;
				end
			4:	begin 
					a_rst  = 0;
					a_en   = 1;
					b_en   = 0;
					q_en   = 1;
					cnt_en = 1;
					a_ld   = 0;
					b_ld   = 0;
					q_ld   = 0;
					cnt_ld = 0;
					done   = 0;
				end
			5:	begin 
					a_rst  = 0;
					a_en   = 0;
					b_en   = 0;
					q_en   = 0;
					cnt_en = 0;
					a_ld   = 0;
					b_ld   = 0;
					q_ld   = 0;
					cnt_ld = 0;
					done   = 1;
				end
			default begin 
					a_rst  = 0;
					a_en   = 0;
					b_en   = 0;
					q_en   = 0;
					cnt_en = 0;
					a_ld   = 0;
					b_ld   = 0;
					q_ld   = 0;
					cnt_ld = 0;
					done   = 0;
				end
		endcase
endmodule
