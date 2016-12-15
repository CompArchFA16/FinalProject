// Variable up counter capable of counting up to 80 seconds
// with a 1kHz clock

module upCounter
(
 input 	      clk,
 input 	      enable_wire,
 input 	      reset_wire,
 input [16:0] count_target_wire,
 output reg   count_result
 );

   reg [16:0] counter;
   reg        enable;
   reg        reset;
   reg [16:0] count_target; 	      

   initial begin
      count_result = 1'b0;
   end

   always @(posedge clk) begin
      enable       <= enable_wire;
      reset        <= reset_wire;
      count_target <= count_target_wire;

      if (reset) begin
	 counter <= 17'b0;
	 count_result <= 1'b0;
      end
      else if (enable) begin
	 counter <= counter + 1;
      end

      if (counter == count_target) begin
	 count_result=!count_result;
	 counter <= 23'b0;
      end

   end // always @ (posedge clk)
endmodule // upCounter
