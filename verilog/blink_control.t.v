//---------------------------------------------------------------------
// Blink Control test bench
//---------------------------------------------------------------------

`include "blink_control.v"
`timescale 1ms / 1us

module testBlinkControl();

   // Generate 1 Khz clock
   reg clk;
   initial clk=0;
   always #0.5 clk=!clk;

   // Reg's and wires for blinkTimer module
   reg  reset;
   reg  enable;
   wire blink;
   reg 	dutpassed;
	
   blinkTimer blinker(.clk(clk),
		      .enable_wire(enable),
		      .reset_wire(reset),
		      .blink(blink)
		      );

   initial begin

      $dumpfile("blink_control.vcd");
      $dumpvars();

      dutpassed = 1;

      #10;
      if(blink != 0) begin
	 dutpassed = 0;
	 $display("Blink Timer: FAILED TEST 1");
      end

      reset = 1; enable = 0; #10;
      if (blink != 0) begin
	 dutpassed = 0;
	 $display("Blink Timer: FAILED TEST 2");
      end

      reset = 0; enable = 1; #510;
      if (blink != 1) begin
	 dutpassed = 0;
	 $display("Blink Timer: FAILED TEST 3");
      end

      reset = 0; enable = 0; #10;
      if (blink != 1) begin
	 dutpassed = 0;
	 $display("Blink Timer: FAILED TEST 4");
      end

      reset = 1; enable = 1; #10;
      if (blink != 0) begin
	 dutpassed = 0;
	 $display("Blink Timer: FAILED TEST 5");
      end

      reset = 0; enable = 1; #1010;
      if (blink != 0) begin
	 dutpassed = 0;
	 $display("Blink Timer: FAILED TEST 6");
      end

      if (dutpassed) begin
	 $display("Blink Timer: PASSED");
      end

      $finish;
   end
endmodule
