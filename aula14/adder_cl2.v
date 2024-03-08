module adder_cl 
    #(parameter N=4)
     (input [N-1:0] a,
      input [N-1:0] b,
      input ci,
      output [N-1:0] s,
      output co);
      wire [N-1:0] C;
      wire [N-1:0] g,p;
      ha ha0 (
        .a(a[0]),
        .b(b[0]),
        .s(p[0]),
        .co(g[0])
      );
      assign C[0] = ci;
      ha hha0 (
        .a(p[0]),
        .b(C[0]),
        .s(s[0])
      );
      genvar gen;
      generate
        for(gen=1; gen < N ; gen = gen+1) begin
            ha ha (
              .a(a[gen]),
              .b(b[gen]),
              .s(p[gen]),
              .co(g[gen])
            );
            assign C[gen]= g[gen-1] | (C[gen-1] & p[gen-1]);
            ha hha (
              .a(p[gen]),
              .b(C[gen]),
              .s(s[gen])
            );
        end
      endgenerate
      assign co = C[N-1];
endmodule