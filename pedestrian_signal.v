// Pedestrian traffic light module

`include "blink_control.v"
`include "mux.v"

module pedestrianSignal
(
	input blink,
	input [1:0] fsmHandControl,
	input fsmPersonControl,
	output handLED,
	output personLED
);

	wire [3:0] handMuxInput;

	assign handMuxInput = {1'b1, 1'b0, blink, 1'b0};

	mux2to1 personMux(1'b1, 1'b0, fsmPersonControl, personLED);
	mux4to1 handMux(handMuxInput, fsmHandControl, handLED);

endmodule