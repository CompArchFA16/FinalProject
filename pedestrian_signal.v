// Pedestrian traffic light module

`include "blink_control.v"
`include "mux.v"

module pedestrianSignal
(
	input blink,
	input fsmHandControl,
	input fsmPersonControl,
	output handLED,
	output personLED
);

	wire handMux;
	wire personMux;
	wire [3:0] handMuxInput;

	assign handMuxInput = {1, 0, blink, 0};

	mux2to1 mux2Wire(1, 0, fsmPersonControl, personLED);
	mux4to1 mux3Wire(handMuxInput, fsmHandControl, handLED);

endmodule