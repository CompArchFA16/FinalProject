//---------------------------------------------------------------------
// Up counter test bench
//---------------------------------------------------------------------

`include "up_counter.v"
`timescale 1ms / 1us

module testUpCounter();

   // Generate 1Khz clock
   reg clk;
   initial clk=0;
   always #0.5 clk=!clk;

   reg        enable;
   reg 	      reset;
   reg [16:0] count_target;
   wire       count_result;
   reg 	      dutpassed;

   upCounter counter(.clk(clk),
		     .enable_wire(enable),
		     .reset_wire(reset),
		     .count_target_wire(count_target),
		     .count_result(count_result)
		     );

   initial begin

      $dumpfile("up_counter.vcd");
      $dumpvars();

      dutpassed = 1;

      #10;
      if(count_result != 0) begin
	 dutpassed = 0;
	 $display("Up Counter: FAILED TEST 1");
      end

      reset = 1; enable = 0; count_target = 17'd10000; #10;
      if (count_result != 0) begin
	 dutpassed = 0;
	 $display("Up Counter: FAILED TEST 2");
      end

      reset = 0; enable = 1; count_target = 17'd10000; #10010;
      if (count_result != 1) begin
	 dutpassed = 0;
	 $display("Up Counter: FAILED TEST 3");
      end

      reset = 0; enable = 0; count_target = 17'd10000; #10;
      if (count_result != 1) begin
	 dutpassed = 0;
	 $display("Up Counter: FAILED TEST 4");
      end

      reset = 1; enable = 1; count_target = 17'd10000; #10;
      if (count_result != 0) begin
	 dutpassed = 0;
	 $display("Up Counter: FAILED TEST 5");
      end

      reset = 0; enable = 1; count_target = 17'd10000; #20010;
      if (count_result != 0) begin
	 dutpassed = 0;
	 $display("Up Counter: FAILED TEST 6");
      end

      if (dutpassed) begin
	 $display("Up Counter: PASSED");
      end

      $finish;
      
   end // initial begin
endmodule // testUpCounter
