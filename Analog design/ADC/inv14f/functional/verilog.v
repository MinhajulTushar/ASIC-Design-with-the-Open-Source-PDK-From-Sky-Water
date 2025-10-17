//Verilog HDL for "ADC", "inv14f" "functional"


module inv14f ( Y, VSS, VDD, A );
  input A;
  output Y;
  inout VDD;
  inout VSS;
  assign Y = ~A;
endmodule
