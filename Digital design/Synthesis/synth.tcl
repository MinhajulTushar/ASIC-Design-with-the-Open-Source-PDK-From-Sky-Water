#read_libs lib/sky130_ff_1.98_0_nldm.lib \
#	lib/sky130_ss_1.62_125_nldm.lib \
#	lib/sky130_tt_1.8_25_nldm.lib

read_libs lib/sky130_tt_1.8_25_nldm.lib

# To treat an empty module as a defined module
#set_db init_blackbox_for_undefined false

#read_hdl flat.v
#read_hdl Therm.v
read_hdl ADC.v
elaborate adc
#elaborate therm
flat

#read_sdc Therm.sdc
read_sdc ADC.sdc


set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium


syn_generic
syn_map
syn_opt


#reports
report_timing > reports/report_timing.rpt
report_power  > reports/report_power.rpt
report_area   > reports/report_area.rpt
report_qor    > reports/report_qor.rpt

#Outputs
write_hdl > outputs/post_synth_adc_netlist.v
write_sdc > outputs/post_synth_adc_sdc.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > outputs/delays.sdf
write_design
#exit
