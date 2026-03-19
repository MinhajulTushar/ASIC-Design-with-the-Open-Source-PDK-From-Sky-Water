//Verilog HDL for "ADC", "preampF_comm_B" "functional"
`timescale 1ns / 1ps
`include "Therm.v"
//`include "/home/cae3/Desktop/ADC/ADC_ASIC/Synthesis/outputs/post_synth_adc_netlist.v"
//`include "/eda/cadence/pdks/sky130/sky130_scl_9T_0_0_5/verilog/sky130_scl_9T.v"
module therm_tb ();
	wire	[3:0] b;
	reg	[14:0] Y;
	reg	clk, rst;

	// instantiate thermometer module
	therm uut(
		.b(b), .Y(Y), .clk(clk), .rst(rst)
	);


	// clock generation
	initial begin 
		clk = 0;
		forever begin  
			#10 clk=~clk; 
		end 
	end

	// test sequences
	initial begin
		// initialize signals
		//clk = 0;
		rst = 1;

		// release reset
		#30 rst = 0;

		// test case0
		Y = 15'b111111111111111;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case1
		Y = 15'b111111111111110;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case2
		Y = 15'b111111111111100;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case3
		Y = 15'b111111111111000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case4
		Y = 15'b111111111110000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case5
		Y = 15'b111111111100000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case6
		Y = 15'b111111111000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case7
		Y = 15'b111111110000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case8
		Y = 15'b111111100000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case9
		Y = 15'b111111000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case10
		Y = 15'b111110000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case11
		Y = 15'b111100000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case12
		Y = 15'b111000000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case13
		Y = 15'b110000000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case14
		Y = 15'b100000000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);

		// test case15
		Y = 15'b000000000000000;
		#30;
		$display("Input: %b, Output: %b, Clock: %b, Reset: %b", Y, b, clk, rst);
		
		$finish;
	end
endmodule
