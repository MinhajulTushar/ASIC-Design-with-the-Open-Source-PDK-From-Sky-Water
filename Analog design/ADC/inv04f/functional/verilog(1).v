//Verilog HDL for "ADC", "inv04f" "functional"


module inv04f ( Y, VSS, VDD, A );

  input A;
  output Y;
  inout VDD;
  inout VSS;
  assign Y = ~A;
endmodule
