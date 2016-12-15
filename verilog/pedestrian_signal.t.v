//---------------------------------------------------------------------
// Pedestrian Controller test bench
//---------------------------------------------------------------------

`include "pedestrian_signal.v"
`include "blink_control.v"
`timescale 1ms / 1us

module testPedestrianSignal();

   // Generate 1Khz clock
   reg clk;
   initial clk=0;
   always #0.5 clk=!clk;
   
   // Reg's and wires for the blinkTimer module
   reg  reset;
   reg 	enable;
   wire blink;

   blinkTimer blinker(.clk(clk),
		      .enable_wire(enable),
		      .reset_wire(reset),
		      .blink(blink)
		      );

   // Reg's and wires for the pedestrianSignal module
   reg [1:0] handControl;
   reg 	     personControl;
   wire	     handLED;
   wire	     personLED;
   
   pedestrianSignal pedSignal(.blink(blink),
			      .fsmHandControl(handControl),
			      .fsmPersonControl(personControl),
			      .handLED(handLED),
			      .personLED(personLED)
			      );

   reg dutpassed;

   initial begin

      $dumpfile("pedestrian_signal.vcd");
      $dumpvars();

      dutpassed = 1;
      
      enable = 1; reset = 0;

      handControl = 2'd0; personControl = 1'd0; #10;
      if(personLED != 1'd0 &&
	 handLED != 1'd0) begin
	 dutpassed = 0;
	 $display("Pedestrian Signal: FAILED TEST 1");
      end

      handControl = 2'd0; personControl = 1'd1; #10;
      if(personLED != 1'd1 &&
	 handLED != 1'd0) begin
	 dutpassed = 0;
	 $display("Pedestrian Signal: FAILED TEST 2");
      end

      handControl = 2'd1; personControl = 1'd0; #10;
      if(personLED != 1'd0 &&
	 handLED != 1'd1) begin
	 dutpassed = 0;
	 $display("Pedestrian Signal: FAILED TEST 3");
      end

      handControl = 2'd2; personControl = 1'd0; #10;
      if(personLED != 1'd0 &&
	 handLED != 1'd0) begin
	 dutpassed = 0;
	 $display("Pedestrian Signal: FAILED TEST 4");
      end

      #500;
      if(personLED != 1'd0 &&
	 handLED != 1'd1) begin
	 dutpassed = 0;
	 $display("Pedestrian Signal: FAILED TEST 5");
      end

      handControl = 2'd3; personControl = 1'd0; #10;
      if(personLED != 1'd0 &&
	 handLED != 1'd0) begin
	 dutpassed = 0;
	 $display("Pedestrian Signal: FAILED TEST 6");
      end

      if(dutpassed) begin
	 $display("Pedestrian Signal: PASSED");
      end

      $finish;      
   end // initial begin     
endmodule // testPedestrianSignal
