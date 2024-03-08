module karatusuba8_uc(
    input  clk, rst, start,
    output x_ld, y_ld, a_ld, b_ld, c_ld, d_ld, e_ld, sub, a_sel, c_sel, done,
    output [1:0] mul_sel, 
    output [2:0] ss_sel
);
// Sua solucao a partir daqui
    reg [3:0] state, next_state;
    localparam [3:0] INIT = 4'b0000;
    localparam [3:0] LOAD_X_Y = 4'b0001;
    localparam [3:0] LOAD_A = 4'b0010;
    localparam [3:0] LOAD_B = 4'b0011;
    localparam [3:0] LOAD_C = 4'b0100;
    localparam [3:0] LOAD_D = 4'b0101;
    localparam [3:0] SUM_AB_MUL_CD = 4'b0110;
    localparam [3:0] SUB = 4'b0111;
    localparam [3:0] SUM_AB_SHIFT = 4'b1000;
    localparam [3:0] SUM_FINAL = 4'b1001;
    localparam [3:0] DONE = 4'b1010;
    reg [15:0] out;
    always @(posedge clk, rst) begin
        if (rst) state = INIT;
        state <= next_state;
    end
    always @(start, state) begin
        case (state)
            INIT:   begin
                        if (start)  next_state = LOAD_X_Y;
                        else        next_state = INIT;
            end
            LOAD_X_Y:           next_state = LOAD_A;
            LOAD_A:             next_state = LOAD_B;
            LOAD_B:             next_state = LOAD_C;
            LOAD_C:             next_state = LOAD_D;
            LOAD_D:             next_state = SUM_AB_MUL_CD;
            SUM_AB_MUL_CD:      next_state = SUB;
            SUB:                next_state = SUM_AB_SHIFT;
            SUM_AB_SHIFT:       next_state = SUM_FINAL;
            SUM_FINAL:          next_state = DONE;
            DONE:   if (start) next_state = DONE;
                    else        next_state = INIT;
            default next_state = INIT;
        endcase
    end
    always @(state) begin
        case (state)
            INIT: out =             16'b00_00000_0_00_0_00_000;
            LOAD_X_Y: out =         16'b11_00000_0_00_0_00_000;
            LOAD_A: out =           16'b00_10000_0_00_0_00_000;
            LOAD_B: out =           16'b00_01000_0_00_0_01_000;
            LOAD_C: out =           16'b00_00100_0_01_0_00_000;
            LOAD_D: out =           16'b00_00010_0_00_0_00_001;
            SUM_AB_MUL_CD: out =    16'b00_00101_0_00_0_11_111;
            SUB: out =              16'b00_00100_1_01_0_00_011;
            SUM_AB_SHIFT: out =     16'b00_10000_0_10_0_00_100;
            SUM_FINAL: out =        16'b00_10000_0_10_1_00_101;
            DONE: out =             16'b00_00000_0_00_1_00_000;
        endcase
    end
    assign {x_ld, y_ld, a_ld, b_ld, c_ld, d_ld, e_ld, sub, a_sel, c_sel, done, mul_sel, ss_sel} = out;
endmodule
