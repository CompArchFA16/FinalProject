// 2Hz blink timer module

module blinkTimer
(
 input 	    clk,
	    enable_wire,
	    reset_wire,
 output reg blink
);

   reg [14:0] upCounter;
   reg 	      enable; 	      
   reg 	      reset;
   
   always @(posedge clk) begin

      enable = enable_wire;
      reset  = reset_wire; 
      
      // Up counter
      if (reset) begin
	 upCounter <= 15'b0;
      end 
      else if (enable) begin
	 upCounter <= upCounter + 1;
      end

      assign blink = &upCounter;
      
   end // always @ (posedge clk)
   
endmodule
