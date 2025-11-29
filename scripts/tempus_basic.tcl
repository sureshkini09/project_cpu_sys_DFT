set MEMDIR /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/libraries/memories
set DESDIR /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/design_dir
set date [clock format [clock seconds] -format "%d%b%Y"]

#set report_dir /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/reports

#Setting Top module
set TOP_MODULE cpu_sys_emep_top
 
#source /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/scripts/set_up.tcl

#Reading of libraries
read_lib [list /tech/libraries/RAK_LIBS/lib/max/slow.lib \
          $MEMDIR/sram_sp_32768d_33w_16m_8b.lib \
          $MEMDIR/sram_sp_16384d_36w_16m_8b.lib \
          $MEMDIR/sram_sp_512d_32w_4m_2b.lib \
          $MEMDIR/rf_2p_136d_74w_1m_4b.lib \
          $MEMDIR/rf_2p_512d_76w_2m_4b.lib \
          $MEMDIR/rf_2p_256d_76w_1m_4b.lib] 


#Don't put input delay for all the ports
set_global timing_apply_default_primary_input_assertion false


#Reading of netlist
read_verilog $DESDIR/cpu_sys.v
 
set_top_module $TOP_MODULE 


#Reading constraints
read_sdc $DESDIR/cpu_sys.sdc


#Reporting 
#report_clock_timing -type summary > $run_dir/clock_summary.rpt
#set_global report_timing_format {hpin cell arc slew load delay arrival}
#check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > $run_dir/check_timing_verbose.rpt
#check_timing -check_only {clock_crossing} -verbose > $run_dir/clock_crossings.rpt
#report_clocks -groups > $run_dir/report_clock_groups.rpt
#report_constraint -all_violators > $run_dir/report_allViolators.rpt
