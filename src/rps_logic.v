module rps_logic(
    input  [1:0] A,
    input  [1:0] B,
    output a_wins,
    output b_wins,
    output error
);

assign a_wins = ~error & (A[1] | B[0]) & (A[0] | ~B[1] | ~B[0]) & (~A[1] | ~A[0] | B[1]);
assign b_wins = ~error & (A[0] | B[1]) & (A[1] | ~B[1] | ~B[0]) & (~A[1] | ~A[0] | B[0]);
assign error  = (~A[1] & ~A[0]) | (~B[1] & ~B[0]);

endmodule
