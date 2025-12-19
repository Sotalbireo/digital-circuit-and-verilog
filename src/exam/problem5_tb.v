module problem5_tb;
	reg  [15:0] i_data_0 = 16'h0000;
	reg  [15:0] i_data_1 = 16'h00ff;
	reg  [15:0] i_data_2 = 16'hff00;
	reg  [15:0] i_data_3 = 16'hffff;
	reg  [ 1:0] i_ctrl   =  2'b00;
	reg         i_clk    = 0;
	wire [15:0] o_data;

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, DUT);
	end

	problem5 DUT(
		.i_data_0 (i_data_0),
		.i_data_1 (i_data_1),
		.i_data_2 (i_data_2),
		.i_data_3 (i_data_3),
		.i_ctrl   (i_ctrl  ),
		.i_clk    (i_clk   ),
		.o_data   (o_data  )
	);

	always #1 begin
		i_clk <= ~i_clk;
	end

	initial begin
		i_ctrl = 2'b00;
		#5
		i_ctrl = 2'b01;
		#5
		i_ctrl = 2'b10;
		#5
		i_ctrl = 2'b11;
		#5
		$finish();
	end

endmodule
