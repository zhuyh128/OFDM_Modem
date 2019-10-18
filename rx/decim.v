module decim (
 
 input clk_40mhz, rst,
 input signed [13:0] data_in_I, data_in_Q,
 
 output signed [13:0] data_out_I, data_out_Q

);

 reg [1:0] zero_en;
 reg signed [13:0] I, Q;

 always @(posedge clk_40mhz or posedge rst) begin
 	if (rst) 
   	zero_en <= 0;
 	else if (zero_en == 2'b11) zero_en <= 0;
	 else
	 zero_en <= zero_en + 1'b1;
 end

 always @(posedge clk_40mhz or posedge rst) begin
 	if (rst) begin
	 I  <=0;
	 Q  <=0;
	 end
 	else begin
	 I <= (zero_en == 2'b11) ? data_in_I : I;
	 Q <= (zero_en == 2'b11) ? data_in_Q : Q;
 end
end

assign data_out_I = I;
assign data_out_Q = Q;

endmodule
