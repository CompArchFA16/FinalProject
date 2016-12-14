//---------------------------------------------------------------------
// Blink Control test bench
//---------------------------------------------------------------------

`include "blink_control.v"

module testBlinkControl();

   // Generate 10 Mhz clock
   reg clk;
   initial clk=0;
   always #50 clk=!clk;

   // Reg's and wires for blinkTimer module
   reg reset;
   reg enable;
   wire blink;

   blinkTimer blinker(.clk(clk),
		      .enable_wire(enable),
		      .reset_wire(reset),
		      .blink(blink)
		      );

   initial begin

      $dumpfile("blink_control.vcd");
      $dumpvars();

      reset = 1; enable = 0; #2500
      reset = 0; enable = 1; #2500
      reset = 0; enable = 0; #2500
      reset = 1; enable = 1; #2500

      $finish;
   end
endmodule
