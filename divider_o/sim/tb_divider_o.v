`timescale 1ns/1ns
module tb_divider_o();
	reg        sys_clock;
	reg        sys_rst_n;

	wire       clk_out      ;

initial
	begin
		sys_clock <= 1'b1;
		sys_rst_n <= 1'b0;

		#20
		sys_rst_n <= 1'b1;
	end

always #10 sys_clock = ~sys_clock;


divider_o
#(
	.CNT_MAX(3'd5)
)
divider_o_inst
(
	. sys_clock(sys_clock),
	. sys_rst_n(sys_rst_n),
	
	.clk_out       (clk_out)
);
endmodule
