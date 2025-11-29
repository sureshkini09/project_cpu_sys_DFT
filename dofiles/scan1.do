set_context dft -scan
read_verilog /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/design_dir/cpu_sys_3_post_sweep.v
read_cell_library /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/libraries/slow.atpglib
set_current_design cpu_sys_emep_top
add_black_boxes -auto
analyze_control_signals -auto
check_design_rules
analyze_scan_chains 
insert_test_logic -write_in_tsdb on
