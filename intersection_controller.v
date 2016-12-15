// Intersection controller module

`include "car_signal.v"
`include "pedestrian_signal.v"
`include "up_counter.v"

module intersectionController
(
	input clk,

	input [5:0] perTime, 
	input [5:0] handTime, 
	input [5:0] redTime, 
	input [5:0] yellowTime, 
	input [5:0] greenTime,

	output [3:0] leds1,
	output [3:0] leds2,
	output [3:0] leds3,
	output [3:0] leds4
);


//// Wires ////

// States
reg state = 3'b001;

// Counters
reg enableRedGreen;
reg resetRedGreen;
wire [16:0] timeRedGreen = redTime * 13'b1001110001000;

reg enableYellow;
reg resetYellow;
wire [16:0] timeYellow = yellowTime * 13'b1001110001000;

// Lights
reg [1:0] lane1Control;
reg [1:0] lane2Control;
reg [1:0] lane3Control;
reg [1:0] lane4Control;


//// Modules ////

// Counters
upCounter countRedGreen(clk, enableRedGreen, resetRedGreen, timeRedGreen, resultRedGreen);
upCounter countYellow(clk, enableYellow, resetYellow, timeYellow, resultYellow);

// upCounter countHand(clk, enableHand, resetHand, timeHand, resultHand);
// upCounter countPerson(clk, enablePerson, resetPerson, timePerson, resultPerson);

// Lights
carSignal lane1(lane1Control, leds1);
carSignal lane2(lane2Control, leds2);
carSignal lane3(lane3Control, leds3);
carSignal lane4(lane4Control, leds4);


//// FSM ////
always@(*)
	begin
		// STATE 1
		if (state == 3'd1) begin
			// Set L 1,2 Green
			lane1Control <= 2'd2;
			lane2Control <= 2'd2;

			// Set L 3,4 Red
			lane3Control = 2'b00;
			lane4Control = 2'b00;

			// Reset and enable the counter
			resetRedGreen = 1'b1;
			resetRedGreen = 1'b0;

			// Wait for the counter to finish
			while (resultRedGreen == 0) begin
				enableRedGreen = 1'b1;
			end

			// Disable the counter and move to the next state
			enableRedGreen = 1'b0;
			state = state + 1;
		end

		// STATE 2
		else if (state == 3'd2) begin
			// Set L 1,2 Yellow
			lane1Control = 2'b01;
			lane2Control = 2'b01;

			// Set L 3,4 Red
			lane3Control = 2'b00;
			lane4Control = 2'b00;

			// Reset and enable the counter
			resetYellow = 1'b1;
			resetYellow = 1'b0;

			// Wait for the counter to finish
			while (resultYellow == 0) begin
				enableYellow = 1'b1;
			end

			// Disable the counter and move to the next state
			enableYellow = 1'b0;
			state = state + 1;
		end

		// STATE 3
		else if (state == 3'd3) begin
			// Set L 1,2 Red
			lane1Control = 2'b00;
			lane2Control = 2'b00;

			// Set L 3,4 Green
			lane3Control = 2'b10;
			lane4Control = 2'b10;

			// Reset and enable the counter
			resetRedGreen = 1'b1;
			resetRedGreen = 1'b0;

			// Wait for the counter to finish
			while (resultRedGreen == 0) begin
				enableRedGreen = 1'b1;
			end

			// Disable the counter and move to the next state
			enableRedGreen = 1'b0;
			state = state + 1;
		end

		// STATE 4
		else if (state == 3'd4) begin
			// Set L 1,2 Red
			lane1Control = 2'b00;
			lane2Control = 2'b00;

			// Set L 3,4 Yellow
			lane3Control = 2'b01;
			lane4Control = 2'b01;

			// Reset and enable the counter
			resetYellow = 1'b1;
			resetYellow = 1'b0;

			// Wait for the counter to finish
			while (resultYellow == 0) begin
				enableYellow = 1'b1;
			end

			// Disable the counter and move to the next state
			enableYellow = 1'b0;
			state = state + 1;
		end

		// STATE 5
		else begin
			// Error: Turn all the lights to red
			lane1Control = 2'b00;
			lane2Control = 2'b00;
			lane3Control = 2'b00;
			lane4Control = 2'b00;
		end
	end

endmodule