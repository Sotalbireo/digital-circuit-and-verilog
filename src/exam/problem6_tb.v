module problem6_tb;
	reg  [15:0] i_data = 16'b00_111_110_010_101_00;
	reg         i_rst  = 0;
	reg         i_clk  = 0;
	wire [ 2:0] o_data;

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, DUT);
	end

	problem6 DUT(
		.i_data   (i_data  ),
		.i_rst    (i_rst   ),
		.i_clk    (i_clk   ),
		.o_data   (o_data  )
	);

	always #1 begin
		i_clk <= ~i_clk;
	end

	always #3 begin
		i_rst = ~i_rst;
	end

	initial begin
		i_data[1:0] = 2'b00;
		#6
		i_data[1:0] = 2'b01;
		#6
		i_data[1:0] = 2'b10;
		#6
		i_data[1:0] = 2'b11;
		#6
		$finish();
	end

endmodule
