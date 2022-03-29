set projDir "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/vivado"
set projName "CHAD-TO-DA-MOON"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/au_top_0.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/reset_conditioner_1.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/button_conditioner_2.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/edge_detector_3.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/multiSevenSegment_4.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/gameBeta_5.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/pipeline_6.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/counter_7.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/sevenSegment_8.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/decoder_9.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/gameAlu_10.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/gameCU_11.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/adder_12.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/boolean_13.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/shifter_14.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/compare_15.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/multiplier_16.v" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/verilog/minimum_17.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/constraint/alchitry.xdc" "C:/Users/sanat/Desktop/istd_4/CHAD-TO-DA-MOON/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
