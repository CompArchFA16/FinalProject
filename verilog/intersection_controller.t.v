`include "intersection_controller.v"
`timescale 1ms / 1us

module testIntersectionController();

   // Generate 1Khz clock
   reg clk;
   initial clk=0;
   always #0.5 clk=!clk;

   reg [5:0] perTime;
   reg [5:0] handTime;
   reg [5:0] redTime;
   reg [5:0] yellowTime;
   reg [5:0] greenTime;

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

      $dumpfile("intersection_controller.vcd");
      $dumpvars();

      dutpassed = 1;

      perTime    <= 6'd1;
      handTime   <= 6'd1;
      redTime    <= 6'd1;
      yellowTime <= 6'd1;
      greenTime  <= 6'd1;

      #1
      if(leds1 != 4'b0010) begin
	 dutpassed <= 0;
	 $display("Intersection Controller: FAILED TEST 1");
      end

      if(dutpassed) begin
	 $display("Intersection Controller: PASSED");
      end

      $finish;
   end // initial begin
endmodule // testIntersectionController
