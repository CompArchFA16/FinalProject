// Mux modules

// 2 wire input
module mux2to1(a,b,sel,out);
	input a,b,sel;
	output out;
	tri out;
	bufif1 (out,a,sel);
	bufif0 (out,b,sel);
endmodule


// 4 wire input
module mux4to1(a,sel,out);
	input [3:0] a;
	input [1:0] sel;
	output out;

	wire mux[2:0];

	mux2to1 m1 (a[3],a[2],sel[0],mux_1),
	        m2 (a[1],a[4],sel[0],mux_2),
	        m3 (mux_1,mux_2,sel[1],out);
endmodule