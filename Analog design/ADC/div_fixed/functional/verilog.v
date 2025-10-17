//Verilog HDL for "ADC", "div_fixed" "functional"


module div_fixed ( Y, VSS, A );

  input A;
  output Y;
  inout VSS;
  assign Y = A;
endmodule
