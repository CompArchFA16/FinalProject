// Car traffic light module

`include "mux_new.v"

module carSignal
(
 input  [1:0] fsmCarControl,
 output [3:0] leds
);

	dmux1to4_new carMux(1'b1, fsmCarControl, leds);

endmodule
