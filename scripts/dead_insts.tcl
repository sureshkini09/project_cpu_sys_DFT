set dead_insts {}
foreach inst [get_db insts] {
  # all output pins of this instance
  set out_pins [get_db $inst .pins -if {.direction == "out"}]
  if {![llength $out_pins]} { continue }

  # does ANY output net have a real load?
  set has_load 0
  foreach p $out_pins {
    foreach n [get_db $p .net] {
      if {[llength [get_db $n .loads]] > 0} { set has_load 1; break }
    }
    if {$has_load} break
  }

  # keep only those with NO loads on ALL outputs
  if {!$has_load} { lappend dead_insts $inst }
}

puts "[llength $dead_insts] instances have unconnected outputs"
# foreach i $dead_insts { puts "  [get_db $i .name]" }  ;# (optional listing)

# --- ACTUAL SWEEP: delete them ---
if {[llength $dead_insts]} {
  delete_obj $dead_insts
}
