/*
 * i_data_0[15:0] ──0┐
 * i_data_1[15:0] ──1┤
 * i_data_2[15:0] ──2┤
 * i_data_3[15:0] ──3┴ MUX ──D─ D-FF ─Q── o_data[15:0]
 * i_ctrl[1:0] ────────┘        │
 * i_clk ───────────────────────┘
 */
module problem5(
	input      [15:0] i_data_0,
	input      [15:0] i_data_1,
	input      [15:0] i_data_2,
	input      [15:0] i_data_3,
	input      [ 1:0] i_ctrl,
	input             i_clk,
	output reg [15:0] o_data
);

	reg [15:0] w_p0;

	always @(*) begin
		case (i_ctrl)
			2'b00  : w_p0 <= i_data_0;
			2'b01  : w_p0 <= i_data_1;
			2'b10  : w_p0 <= i_data_2;
			2'b11  : w_p0 <= i_data_3;
			default: w_p0 <= w_p0;
		endcase
	end

	always @(posedge i_clk) begin
		o_data <= i_clk ? w_p0 : o_data;
	end

endmodule
