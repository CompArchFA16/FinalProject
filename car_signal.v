// Car traffic light module

`include "mux.v"

module carSignal
(
	input [1:0] fsmCarControl,
	output [3:0] leds
);

	dmux1to4 carMux(1'b1, fsmCarControl, leds);

endmodule