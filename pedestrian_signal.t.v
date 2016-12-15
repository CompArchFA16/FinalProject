//---------------------------------------------------------------------
// Pedestrian Controller test bench
//---------------------------------------------------------------------

`include "pedestrian_signal.v"

module testPedestrianSignal();

   // Reg's and wires for pedestrianSignal module
   reg 
   
   pedestrianSignal pedSignal();
   
   // Generate clock
   initial clk=0;
   always #10 clk=!clk;

   // Reg's and wires for pedestrianSignal test bench

   initial begin

      $dumpfile("pedestrian_signal.vcd");
      $dumpvars();

   end
      
endmodule; // testPedestrianSignal
