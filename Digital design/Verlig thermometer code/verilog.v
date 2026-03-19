//Verilog HDL for "ADC", "preampF_comm_B" "functional"


module therm ( Y, b, clk, rst );
	output	[3:0] b;
	input	[14:0] Y;
	input	clk;
	input	rst;
	reg	[3:0] out;

	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			out <= 4'b0000;
		end else begin
			case (Y)
				15'b111111111111111: out <= 4'b0000;
				15'b111111111111110: out <= 4'b0001;
				15'b111111111111100: out <= 4'b0010;
				15'b111111111111000: out <= 4'b0011;
				15'b111111111110000: out <= 4'b0100;
				15'b111111111100000: out <= 4'b0101;
				15'b111111111000000: out <= 4'b0110;
				15'b111111110000000: out <= 4'b0111;
				15'b111111100000000: out <= 4'b1000;
				15'b111111000000000: out <= 4'b1001;
				15'b111110000000000: out <= 4'b1010;
				15'b111100000000000: out <= 4'b1011;
				15'b111000000000000: out <= 4'b1100;
				15'b110000000000000: out <= 4'b1101;
				15'b100000000000000: out <= 4'b1110;
				15'b000000000000000: out <= 4'b1111;
				default: out <= 4'bxxxx;
			endcase
		end
	end
	assign b = out;
endmodule