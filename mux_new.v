// Mux modules

// 2 wire input
module mux2to1_new(a,b,sel,out);
	input a,b,sel;
	output out;
	tri out;
	bufif1 (out,a,sel);
	bufif0 (out,b,sel);
endmodule


// 4 wire input
module mux4to1_new(a,sel,out);
	input [3:0] a;
	input [1:0] sel;
	output out;

	wire mux[2:0];

	mux2to1_new m1 (a[3],a[2],sel[0],mux_1),
	        m2 (a[1],a[4],sel[0],mux_2),
	        m3 (mux_1,mux_2,sel[1],out);
endmodule

// 4 wire output - default to first
module dmux1to4_new(in, sel, out);
	input in;
	input [1:0] sel;
	output reg [3:0] out;

	always@(*)
	begin
		if ( sel == 2'd0) 
			out[0] = in;
		else if (sel == 2'd1)
			out[1] = in;
		else if (sel == 2'd2)
			out[2] = in;
		else if (sel == 2'd3)
			out[3] = in;
		else
			out[0] = in;		 
	end
endmodule