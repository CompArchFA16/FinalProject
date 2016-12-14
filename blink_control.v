// 2Hz blink timer module

module blinkTimer
(
 input 	    clk,
	    enable_wire,
	    reset_wire,
 output reg blink
);

   reg [22:0] upCounter;
   reg 	      enable; 	      
   reg 	      reset;

   initial begin
      blink = 0;
   end
   
   always @(posedge clk) begin

      enable = enable_wire;
      reset  = reset_wire; 
      
      // Up counter
      if (reset) begin
	 upCounter <= 23'b0;
      end 
      else if (enable) begin
	 upCounter <= upCounter + 1;	 
      end

      if (upCounter == 23'b10011000100101101000000) begin
	 blink=!blink;
	 upCounter <= 23'b0;
      end
      
   end // always @ (posedge clk)
   
endmodule
