/*
 * 「ディジタル回路の構造化：MUXによるD-FFの改良」の発展版
 *            ┌────────────────┐
 *            + ─0┐            │
 *  16'h0001 ─┘   MUX ─D┐      │
 *  16'h0000 ────1┘│    D-FF ─Q┴── o_p[15:0]
 * i_rst ──────────┘    │
 * i_clk ───────────────┘
 */
module problem4(
	input             i_rst,
	input             i_clk,
	output reg [15:0] o_p
);

	reg  [15:0] r_p0 = 16'h0001;
	reg  [15:0] r_p1 = 16'h0000;
	wire [15:0] w_p0;

	assign w_p0 = o_p + r_p0;

	always @(posedge i_clk) begin
		o_p <= i_rst ? r_p1 : w_p0;
	end

endmodule
