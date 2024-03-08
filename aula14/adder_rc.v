module adder_rc 
  #(parameter N=4)
    (input [N-1:0] a,
    input [N-1:0] b,
    input ci,
    output [N-1:0] s,
    output co);
    wire [N-1:0] cout;
    genvar g;
    fa fa0 (
      .a(a[0]),
      .b(b[0]),
      .ci(ci),
      .s(s[0]),
      .co(cout[0])
    );
    generate
      for(g = 1; g < N; g = g+1) begin
        fa fa (
          .a(a[g]),
          .b(b[g]),
          .ci(cout[g-1]),
          .s(s[g]),
          .co(cout[g])
        );
      end
    endgenerate
    assign co = cout[N-1];
    // Escreva sua solução a partir daqui
endmodule