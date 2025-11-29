# -------------------------------------------------------------
# Script: sweep_unconnected_cells.tcl
# Tool:   Cadence Genus
# Purpose: Remove instances whose outputs drive no loads
# -------------------------------------------------------------

puts "==> Starting sweep of unconnected (load-less) driver cells..."

set removed_count 0

# Loop over all instances in the design
foreach inst [get_db insts] {
    set remove_flag 1

    # Check every output pin of this instance
    foreach op [get_db $inst .pins] {
        set dir [get_db $op .direction]
        if {$dir eq "out"} {
            set net [get_db $op .net]
            if {$net ne ""} {
                set loads [get_db $net .loads]
                if {[llength $loads] > 0} {
                    # If any output drives a load, keep the instance
                    set remove_flag 0
                    break
                }
            }
        }
    }

    # If no outputs drive anything, remove the instance
    if {$remove_flag} {
        puts "Removing unconnected instance: $inst"
        delete_obj $inst
        incr removed_count
    }
}

puts "==> Sweep complete: Removed $removed_count unconnected instances."

