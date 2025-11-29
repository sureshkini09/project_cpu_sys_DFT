# Auto-create and enter run_genus dir before launching Genus
genus() {
    local RUN_DIR="run_genus"
    mkdir -p "$RUN_DIR"
    cd "$RUN_DIR" || return
    echo "Running Genus from $(pwd)"
    command genus "$@"
}

# Auto-create and enter run_tempus dir before launching Tempus
tempus() {
    local RUN_DIR="run_tempus"
    mkdir -p "$RUN_DIR"
    cd "$RUN_DIR" || return
    echo "Running Tempus from $(pwd)"
    command tempus "$@"
}
