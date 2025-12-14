
/*
 *  i_p0[7:0] ─┐
 *             AND ─┐
 *  i_p1[7:0] ─┘    OR ── o_p[7:0]
 *  i_p2[7:0] ──────┘
 */
module problem1(
	input  [7:0] i_p0,
	input  [7:0] i_p1,
	input  [7:0] i_p2,
	output [7:0] o_p
);

	wire [7:0] w_p0;

	assign w_p0 = i_p0 & i_p1;
	assign o_p  = i_p2 | w_p0;

endmodule
