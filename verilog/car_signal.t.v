//---------------------------------------------------------------------
// Car signal test bench
//---------------------------------------------------------------------

`include "car_signal.v"
`timescale 1ms / 1us

module testCarSignal();

   reg  [1:0] rygChoice;
   wire [3:0] signalOutput;
   reg 	      dutpassed;

   carSignal signalOne(.fsmCarControl(rygChoice),
		       .leds(signalOutput)
		       );

   initial begin

      $dumpfile("car_signal.vcd");
      $dumpvars();

      dutpassed = 1;

      #10;
      if(signalOutput[0] == 1'b1 &&
	 signalOutput[1] == 0 &&
	 signalOutput[2] == 0 &&
	 signalOutput[3] == 0) begin
	 dutpassed = 0;
	 $display("Car Signal: FAILED TEST 1");
      end

      rygChoice = 2'd1; #10;
      if(signalOutput[0] == 0 &&
	 signalOutput[1] == 1'b1 &&
	 signalOutput[2] == 0 &&
	 signalOutput[3] == 0) begin
	 dutpassed = 0;
	 $display("Car Signal: FAILED TEST 2");
      end

      rygChoice = 2'd2; #10;
      if(signalOutput[0] == 0 &&
	 signalOutput[1] == 0 &&
	 signalOutput[2] == 1'b1 &&
	 signalOutput[3] == 0) begin
	 dutpassed = 0;
	 $display("Car Signal: FAILED TEST 3");
      end

      rygChoice = 2'd3; #10;
      if(signalOutput[0] == 0 &&
	 signalOutput[1] == 0 &&
	 signalOutput[2] == 0 &&
	 signalOutput[3] == 1'b1) begin
	 dutpassed = 0;
	 $display("Car Signal: FAILED TEST 4");
      end

      rygChoice = 2'd0; #10;
      if(signalOutput[0] == 1'b1 &&
	 signalOutput[1] == 0 &&
	 signalOutput[2] == 0 &&
	 signalOutput[3] == 0) begin
	 dutpassed = 0;
	 $display("Car Signal: FAILED TEST 5");
      end

      if(dutpassed) begin
	 $display("Car Signal: PASSED");
      end

      $finish;

   end // initial begin
endmodule // testCarSignal
