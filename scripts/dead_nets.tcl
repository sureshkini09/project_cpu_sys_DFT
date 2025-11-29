set dead_nets {}

# Iterate over all nets
foreach n [get_db nets] {
    # Get all driver pins of this net
    set drv_pins [get_db $n .drivers]

    # If no drivers, then it's undriven
    if {![llength $drv_pins]} {
        lappend dead_nets $n
    }
}

# Append dead nets to a file
set outfile "dead_nets.txt"
set f [open $outfile a]  ;# 'a' for append mode
foreach dn $dead_nets {
    puts $f $dn
}
close $f
