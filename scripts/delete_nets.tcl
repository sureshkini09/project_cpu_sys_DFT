# Iterate over all nets in the design
foreach n [get_db nets] {
    # Get all driver pins of this net
    set drv_pins [get_db $n .drivers]

    # If the net has no drivers (undriven), delete it
    if {![llength $drv_pins]} {
        delete_obj $n
    }
}

