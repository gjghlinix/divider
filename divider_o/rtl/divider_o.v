module divider_o
#
(
	parameter CNT_MAX = 3'd5
)
(
	input wire        sys_clock,
	input wire        sys_rst_n,
		
	output reg        clk_out
);

reg  [2:0]  cnt;
reg         cnt_flag;

//计数器计数
always@(posedge sys_clock or negedge sys_rst_n)
	if(sys_rst_n == 1'b0)
		cnt <= 3'b0;
	else if(cnt == CNT_MAX)
		cnt <= 3'b0;
	else
		cnt <= cnt + 1'b1;
		
//标志位
always@(posedge sys_clock or negedge sys_rst_n)
	if(sys_rst_n == 1'b0)
		cnt_flag <= 1'b0;
	else if(cnt == CNT_MAX - 1)
		cnt_flag <= 1'b1;
	else
		cnt_flag <= 1'b0;
//LED——out
always@(posedge sys_clock or negedge sys_rst_n)
	if(sys_rst_n == 1'b0)
		clk_out <= 1'b0;
	else if(cnt_flag == 1'b1)
		clk_out <= ~clk_out;
			
		
endmodule
