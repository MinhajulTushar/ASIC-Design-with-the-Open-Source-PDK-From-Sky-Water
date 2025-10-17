//Verilog HDL for "ADC", "inv12f" "functional"


module inv12f ( Y, VSS, VDD, A );

  input A;
  output Y;
  inout VDD;
  inout VSS;
  assign Y = ~A;
endmodule
