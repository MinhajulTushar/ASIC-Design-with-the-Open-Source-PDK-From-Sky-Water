//Verilog HDL for "ADC" "functional"

`include "Therm.v"
module pre_therm(IN, Y01, Y02, Y03, Y04, Y05, Y06, Y07, Y08, Y09, Y10, Y11, Y12, Y13, Y14, Y15);
	input	IN;
	output Y01, Y02, Y03, Y04, Y05, Y06, Y07, Y08, Y09, Y10, Y11, Y12, Y13, Y14, Y15;
	wire IN;
	wire Y01, Y02, Y03, Y04, Y05, Y06, Y07, Y08, Y09, Y10, Y11, Y12, Y13, Y14, Y15;
endmodule

module adc(IN, b, clk, rst);
	input	IN;
	input	clk, rst;
	output	[3:0] b;
	wire	IN;
	wire	clk, rst;
	wire	[3:0] b;
	wire [14:0] int;

	therm therm1(.b(b), .Y(int), .clk(clk), .rst(rst));

	pre_therm pretherm(.IN(IN), .Y01(int[0]), .Y02(int[1]),
			.Y03(int[2]), .Y04(int[3]), .Y05(int[4]),
			.Y06(int[5]), .Y07(int[6]), .Y08(int[7]),
			.Y09(int[8]), .Y10(int[9]), .Y11(int[10]),
			.Y12(int[11]), .Y13(int[12]), .Y14(int[13]),
			.Y15(int[14]));
endmodule
