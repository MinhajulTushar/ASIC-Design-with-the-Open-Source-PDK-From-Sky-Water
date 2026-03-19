# Project Name

ASIC Design with SkyWater 130nm Open-Source PDK

This repository contains the design, implementation, and verification of a mixed-signal ASIC using the SkyWater 130nm Process Design Kit (PDK) integrated with commercial Cadence EDA tools. The project demonstrates a complete end-to-end design flow, from transistor-level analog design to digital logic synthesis and physical implementation (GDSII).

## Project Overview

The primary goal of this research was to develop a 4-bit Analog-to-Digital Converter (ADC) system by integrating analog preconditioning circuits with a digital thermometer-to-binary decoder.

### Key Features: 

#### Mixed-Signal Integration: 
Seamlessly combined analog and digital domains using industry-standard workflows.

#### Open-Source PDK: 
Utilized the SkyWater 130nm technology, the first open-source PDK for ASIC design.

#### Iterative Optimization: 
Optimized transistor dimensions to address specific challenges like bulk connection requirements and parasitic effects.

## Tools & Flow
The project utilizes a comprehensive suite of Cadence tools to manage the design flow:

### Analog Flow (Pre-Therm)

#### Virtuoso Schematic Editor: 
Transistor-level design for 15 inverters and preconditioning circuits (amplifiers and voltage dividers).

#### Spectre Simulator: 
High-precision DC sweep and parametric analysis for threshold tuning.

#### Virtuoso Layout XL: 
Physical layout design ensuring DRC/LVS compliance.

#### Abstract: 
Generation of Library Exchange Format (LEF) files for digital integration.

### Digital Flow (Therm)

#### Genus: 
Logic synthesis of Verilog thermometer code into a gate-level netlist.

#### Xcelium: 
Functional verification using behavioral and gate-level testbenches.

#### Innovus: 
Physical design including floorplanning, Clock Tree Synthesis (CTS), and routing.

#### Pegasus: 
Final Design Rule Check (DRC) and Layout Versus Schematic (LVS) verification.

## Methodology
The design is divided into two primary stages: 

### 1. Analog Design (Pre-Therm):
Designed 15 unique inverters with specific switching thresholds.
Implemented preconditioning circuits (preamplifiers preampF, preamp1F, and voltage divider div-fixed) to fine-tune input signals for accurate quantization.
Validated layouts via DRC/LVS and exported them as macros (LEF).

### 2. Digital Design (Therm):
Developed a Verilog module (therm) to convert a 15-bit thermometer code into a 4-bit binary output.
Applied Synopsys Design Constraints (SDC) to optimize for a 1 GHz clock frequency.
Performed Place-and-Route (PnR) to generate the final routed GDSII file.

## Key Results

### Threshold Accuracy: 
Successfully achieved targeted threshold levels (ranging from ~0.11V to ~1.76V) through precise transistor sizing and preconditioning .

### Timing Closure: 
Met performance specifications by managing setup/hold uncertainties and clock transitions during synthesis and PnR.

### Physical Integrity: 
The final layout passed all SkyWater 130nm design rules (DRC) and maintained complete connectivity (LVS).

## Repository Structure
/Analog: Virtuoso schematics and layouts for inverters and pre-processing blocks.
/Digital: Verilog source code (therm.v, ADC.v), SDC constraints, and TCL scripts for synthesis.
/Implementation: Generated LEF files, gate-level netlists, and final GDSII.
/Reports: DRC/LVS logs and timing analysis reports.

## Author
Md Minhajul Islam Master of Electrical and Microsystems Engineering
Ostbayerische Technische Hochschule Regensburg
