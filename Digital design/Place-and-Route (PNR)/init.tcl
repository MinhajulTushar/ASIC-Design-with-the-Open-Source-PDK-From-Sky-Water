floorPlan -site CoreSite -r 1 0.6 8.28 8.28 8.28 8.28

setDesignMode -process 130

globalNetConnect VDD -type pgpin -pin VDD -override -verbose -netlistOverride
globalNetConnect VSS -type pgpin -pin VSS -override -verbose -netlistOverride

# pin assigment

setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.32 -fixedPin -pinDepth 0.595 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 2 -spreadType center -spacing 10 -pin {{b[0]} {b[1]} {b[2]} {b[3]}}

editPin -pinWidth 0.32 -fixedPin -pinDepth 0.215 -fixOverlap 1 -global_location -unit MICRON -spreadDirection clockwise -side Top -layer 2 -spreadType center -spacing 0.46 -pin clk

editPin -pinWidth 0.32 -fixedPin -fixOverlap 1 -global_location -unit MICRON -spreadDirection clockwise -side Left -layer 2 -spreadType center -spacing 0.46 -pin IN

editPin -pinWidth 0.32 -fixedPin -pinDepth 0.26 -fixOverlap 1 -global_location -unit MICRON -spreadDirection clockwise -side Bottom -layer 2 -spreadType center -spacing 0.46 -pin rst


# Add power ring
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

# Add sroute
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { met1(1) met5(5) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { met1(1) met5(5) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { met1(1) met5(5) }


# Place mode
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -drouteAutoStop 0
setNanoRouteMode -quiet -drouteFixAntenna 0
setNanoRouteMode -quiet -droutePostRouteSwapVia {}
setNanoRouteMode -quiet -droutePostRouteSpreadWire 1
setNanoRouteMode -quiet -drouteUseMultiCutViaEffort {}
setNanoRouteMode -quiet -drouteOnGridOnly 0
setNanoRouteMode -quiet -routeIgnoreAntennaTopCellPin 0
setNanoRouteMode -quiet -timingEngine {}
setUsefulSkewMode -noBoundary false -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 1 -moduleAwareSpare 0 -maxRouteLayer 5 -preserveRouting 1 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0


## Place STD cells
setPlaceMode -fp false
place_design


## Pre-CTS optimization
timeDesign -preCTS
optDesign -preCTS

## Fixed pre-therm status
dbSet [dbGet top.insts.name -p pretherm].pstatus fixed

## Create placement blockage
createPlaceBlockage -box 8.29700 15.07700 23.92500 16.47000 -type hard
createPlaceBlockage -box 8.35400 16.60900 11.49900 20.63100 -type hard
createPlaceBlockage -box 11.66900 29.05100 23.92200 29.78100 -type hard
 

## Clock Tree Synthesis (CTS)
set_ccopt_property buffer_cells "CLKBUFX8 CLKBUFX4 CLKBUFX2"
create_ccopt_clock_tree_spec
# get_ccopt_clock_trees *
clock_opt_design

## Post CTS Optimization
timeDesign -postCTS
optDesign -postCTS
timeDesign -postCTS

## Routing
setNanoRouteMode -quiet -drouteFixAntenna 1
setNanoRouteMode -quiet -routeInsertAntennaDiode 0
setNanoRouteMode -quiet -routeWithTimingDriven 0
setNanoRouteMode -quiet -routeWithEco 0
setNanoRouteMode -quiet -routeWithLithoDriven 0
setNanoRouteMode -quiet -droutePostRouteLithoRepair 0
setNanoRouteMode -quiet -routeWithSiDriven 0
setNanoRouteMode -quiet -drouteAutoStop 1
setNanoRouteMode -quiet -routeSelectedNetOnly 0
setNanoRouteMode -quiet -routeTopRoutingLayer 5
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration 1
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

## post-route timing
setDelayCalMode -SIAware false
setAnalysisMode -analysisType onChipVariation
timeDesign -postRoute
optDesign -postRoute

##Add Filler
getFillerMode -quiet
addFiller -cell FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1 -prefix FILLER

## Power
#report_power

#verifyGeometry -allowSameCellViols -noSameNet -noOverlap -report Geom.rpt

## Export GDS
streamOut adc1.gds -mapFile /eda/cadence/pdks/sky130/sky130_scl_9T_0_0_5/gds/sky130_stream.mapFile -libName DesignLib -units 1000 -mode ALL
