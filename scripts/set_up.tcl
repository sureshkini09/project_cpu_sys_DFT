
#Creating report directory

if {![file exists $report_dir]} {
    file mkdir $report_dir
    puts "Created directory: $report_dir"
} else {
    puts "Directory already exists: $report_dir"
}

set today_dir "$report_dir/reports_$date"
if {![file exists $today_dir]} {
    file mkdir $today_dir
    puts "Created directory: $today_dir"
} else {
    puts "Directory already exists: $today_dir"
}

set run_index 1
set run_dir "$today_dir/run_$run_index"

while {[file exists $run_dir]} {
    incr run_index
    set run_dir "$today_dir/run_$run_index"
}

file mkdir $run_dir
