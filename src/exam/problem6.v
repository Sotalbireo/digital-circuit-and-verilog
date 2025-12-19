/*
 * i_data[15:0] ─┬─[4:2]───b00┐
 *               ├─[7:5]───b01┤
 *               ├─[10:8]──b10┤
 *               ├─[13:11]─b11┴─ MUX ──b0┬ MUX ─D─ D-FF ─Q── o_data[2:0]
 *               └─[1:0]─────────┘       │ │       │
 *                           3b'000 ───b1┘ │       │
 * i_rst ──────────────────────────────────┘       │
 * i_clk ──────────────────────────────────────────┘
 */
module problem6(
	input      [15:0] i_data,
	input             i_rst,
	input             i_clk,
	output reg [ 2:0] o_data
);

	reg        [2:0] r_p0;
	wire       [2:0] w_p0;
	localparam [2:0] p_p0 = 3'b000;

	always @(*) begin
		case (i_data[1:0])
			2'b00  : r_p0 <= i_data[4:2];
			2'b01  : r_p0 <= i_data[7:5];
			2'b10  : r_p0 <= i_data[10:8];
			2'b11  : r_p0 <= i_data[13:11];
			default: r_p0 <= r_p0;
		endcase
	end

	assign w_p0 = i_rst ? p_p0 : r_p0;

	always @(posedge i_clk) begin
		o_data <= i_clk ? w_p0 : o_data;
	end

endmodule
