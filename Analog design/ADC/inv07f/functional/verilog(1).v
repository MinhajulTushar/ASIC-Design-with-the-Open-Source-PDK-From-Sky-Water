//Verilog HDL for "ADC", "inv07f" "functional"


module inv07f ( Y, VSS, VDD, A );

  input A;
  output Y;
  inout VDD;
  inout VSS;
  assign Y = ~A;
endmodule
