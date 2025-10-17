//Verilog HDL for "ADC", "inv03f" "functional"


module inv03f ( Y, VSS, VDD, A );

  input A;
  output Y;
  inout VDD;
  inout VSS;
  assign Y = ~A;
endmodule
