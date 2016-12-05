//--------------------------------------------------------------------
// Intersection Controller test bench
//--------------------------------------------------------------------

`include "intersection_controller.v"

module testIntersectionController();

   // Reg's and wires for intersectionController module

   intersectionController intersectControl();

   //Generate clock
   initial clk=0;
   always #10 clk=!clk;

   // Reg's and wires for intersectionController test bench

   initial begin

      $dumpfile("intersection_controller.vcd");
      $dumpvars();

   end

endmodule; // testIntersectionController
