//--------------------------------------------------------------------
// Intersection Controller test bench
//--------------------------------------------------------------------

`include "intersection_controller.v"
`timescale 1ms / 1us

module testIntersectionController();

   // Generate 1 Khz clock
   reg clk;
   initial clk=0;
   always #0.5 clk=!clk;
   
   // Reg's and wires for intersectionController module
   reg  [5:0] perTime;
   reg  [5:0] handTime;
   reg  [5:0] redTime;
   reg  [5:0] yellowTime;
   reg  [5:0] greenTime;
   wire [3:0] leds1;
   wire [3:0] leds2;
   wire [3:0] leds3;
   wire [3:0] leds4;
   reg 	      dutpassed;

   intersectionController intersectControl(.clk(clk),
					   .perTime(perTime),
					   .handTime(handTime),
					   .redTime(redTime),
					   .yellowTime(yellowTime),
					   .greenTime(greenTime),
					   .leds1(leds1),
					   .leds2(leds2),
					   .leds3(leds3),
					   .leds4(leds4)
					   );
   
   initial begin

      $dumpfile("intersection_test.vcd");
      $dumpvars();

      dutpassed = 1;
      
      perTime = 5'd10;
      handTime = 5'd10;
      redTime = 5'd10;
      yellowTime = 5'd10;
      greenTime = 5'd10;
            
      if(leds1 != 4'b0010 &&
	 leds2 != 4'b0010 &&
	 leds3 != 4'b1000 &&
	 leds4 != 4'b1000) begin
	 dutpassed = 0;
	 $display("Intersection Test: FAILED TEST 1");
      end
	 
      if(dutpassed) begin
	 $display("Intersection Test: PASSED");
      end

      $finish;
   end // initial begin
endmodule // testIntersectionController
