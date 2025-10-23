#######################################################
#                                                     
#  Tempus Timing Solution Command Logging File                     
#  Created on Sat Oct 18 14:42:21 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Solution v22.11-s001_1 (64bit) 09/16/2022 15:45 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.11-s001_1 NR220910-1931/22_11-UB (database version 18.20.592) {superthreading v2.19}
#@(#)CDS: AAE 22.11-e006 (64bit) 09/16/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.11-e010_1 () Sep  5 2022 07:16:46 ( )
#@(#)CDS: SYNTECH 22.11-e002_1 () Aug  2 2022 07:54:00 ( )
#@(#)CDS: CPE v22.11-e028

read_lib {/tech/libraries/RAK_LIBS/lib/max/slow.lib /home/01fe21bec255/DFT_LAB/project_cpu_sys/libraries/memories/sram_sp_32768d_33w_16m_8b.lib /home/01fe21bec255/DFT_LAB/project_cpu_sys/libraries/memories/sram_sp_16384d_36w_16m_8b.lib /home/01fe21bec255/DFT_LAB/project_cpu_sys/libraries/memories/sram_sp_512d_32w_4m_2b.lib /home/01fe21bec255/DFT_LAB/project_cpu_sys/libraries/memories/rf_2p_136d_74w_1m_4b.lib /home/01fe21bec255/DFT_LAB/project_cpu_sys/libraries/memories/rf_2p_512d_76w_2m_4b.lib /home/01fe21bec255/DFT_LAB/project_cpu_sys/libraries/memories/rf_2p_256d_76w_1m_4b.lib}
set_global timing_apply_default_primary_input_assertion false
read_verilog /home/01fe21bec255/DFT_LAB/project_cpu_sys/design_dir/cpu_sys.v
set_top_module cpu_sys_emep_top
read_sdc /home/01fe21bec255/DFT_LAB/project_cpu_sys/design_dir/cpu_sys.sdc
report_clock_timing -type summary > $report_dir/clock_summary.rpt
set_global report_timing_format {hpin cell arc slew load delay arrival}
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > $report_dir/check_timing_verbose.rpt
check_timing -check_only {clock_crossing} -verbose > $report_dir/clock_crossings.rpt
report_clocks -groups > $report_dir/report_clock_groups.rpt
report_constraint -all_violators > /home/01fe21bec255/DFT_LAB/project_cpu_sys/reports/reports_18oct2025/report_allViolators.rpt
stop_gui
exit
