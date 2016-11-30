// Pedestrian traffic light module

`import "blink_control.v"
`import "mux.v"

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

mux2Wire mux2to1(1, 0, fsmPersonControl, personLED);
mux3Wire mux4to1(handMuxInput, fsmHandControl, handLED);

always @(posedge clk)

	// Set person LED

	// Set up hand control mux input

	// Set hand LED

endmodule