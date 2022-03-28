set projDir "D:/repos/CHAD-TO-DA-MOON/work/vivado"
set projName "CHAD-TO-DA-MOON"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/repos/CHAD-TO-DA-MOON/work/verilog/au_top_0.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/reset_conditioner_1.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/button_conditioner_2.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/edge_detector_3.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/multiSevenSegment_4.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/manualTester_5.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/autoTester_6.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/pipeline_7.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/counter_8.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/sevenSegment_9.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/decoder_10.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/alu_11.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/aluTester_12.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/adder_13.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/boolean_14.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/shifter_15.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/compare_16.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/multiplier_17.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/minimum_18.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/adderTester_19.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/booleanTester_20.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/multiplierTester_21.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/shifterTester_22.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/compareTester_23.v" "D:/repos/CHAD-TO-DA-MOON/work/verilog/minimumTester_24.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/repos/CHAD-TO-DA-MOON/work/constraint/alchitry.xdc" "D:/repos/CHAD-TO-DA-MOON/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
