module multiplicador_fd 
    #(parameter WIDTH=8)    
    (
        input clk, rst, a_rst,
              a_en, b_en, q_en, cnt_en,
              a_ld, b_ld, q_ld, cnt_ld,
        output qlsb, zero,
        input  [WIDTH-1:0] B_in, Q_in,
        output [WIDTH*2-1:0] P_out
    );


endmodule