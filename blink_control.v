// 2Hz blink timer module

module blinkTimer
(
	input clk,
	inpupt reset,
	output blink
);

wire [14:0] upCounter;

always @(posedge clk)

	// Up counter
	if (reset) begin
		upCounter <= 8'b0;
		reset <= 1'b1;
	end else if (enable) begin
		upCounter <= upCounter + 1;
	end

	// Blink and reset when upcounter is full
	blink <= &upCounter;
	reset <= 1'b1;

endmodule