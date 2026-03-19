## SDC Version
set sdc_version 2

set_units -capacitance pF
set_units -time ns

## Drive strength
#set_driving_cell -lib_cell BUFX2 {therm1/Y*}
#set_driving_cell -lib_cell BUFX2 {rst}

## Set load in picofarads
set_load 0.5 [get_ports b*]

## Design Rule Constraints
# Set maximum fanout:
set_max_fanout 4 [get_pins {therm1/b[*]}]

#  Set maximum transition
#set_max_transition 0.25 [get_pins therm1/Y*]

## Timing Constraints for Thermometer Decoder Module
# Clock definition/Create Clock
create_clock -period 1 -name clk -waveform {0.0 0.5} [get_ports clk]

# Clock transition
set_clock_transition 0.01 [get_clocks clk]

# Clock uncertainty
set_clock_uncertainty -setup 0.05 [get_clocks clk]
set_clock_uncertainty -hold 0.02 [get_clocks clk]

# Input delay constraints
set_input_delay -max 0.01 -clock clk [get_pins therm1/Y*]
set_input_delay -max 0.01 -clock clk [get_ports rst]

# Output delay constraints
set_output_delay -max 0.014 -clock clk [get_ports b*]
set_output_delay -min 0.01 -clock clk [get_ports b*]


# Maximum delay path
#set_max_delay 10.0 -from [get_pins therm1/Y*] -to [get_ports b*]

# False paths (optional)
set_false_path -from [get_ports rst] -to [get_ports b*]

# Multicycle path (if needed)
# set_multicycle_path 2 -setup -from [get_pins therm1/Y*] -to [get_ports b*]

# Technology library setup
# Note: Replace 'typical_lib' with your actual library name
#set_wire_load_model -name "medium"
