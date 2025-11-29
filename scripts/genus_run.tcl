set MEMDIR /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/libraries/memories
set DESDIR /home/01fe21bec255/DFT_LAB/project_cpu_sys_DFT/design_dir

#Reading of libraries
read_libs [list /tech/libraries/RAK_LIBS/lib/max/slow.lib \
          $MEMDIR/sram_sp_32768d_33w_16m_8b.lib \
          $MEMDIR/sram_sp_16384d_36w_16m_8b.lib \
          $MEMDIR/sram_sp_512d_32w_4m_2b.lib \
          $MEMDIR/rf_2p_136d_74w_1m_4b.lib \
          $MEMDIR/rf_2p_512d_76w_2m_4b.lib \
          $MEMDIR/rf_2p_256d_76w_1m_4b.lib]

read_hdl $DESDIR/cpu_sys_1.v

elaborate

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

