// 2Hz blink timer module

`include "up_counter.v"

module blinkTimer
(
 input 	clk,
 input 	enable_wire,
 input 	reset_wire,
 output blink
);

   upCounter blinkCounter(.clk(clk),
			  .enable_wire(enable_wire),
			  .reset_wire(reset_wire),
			  .count_target_wire(17'd500),
			  .count_result(blink)
			  );
endmodule
