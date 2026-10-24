
# ---- CFU-Playground environment (added by on-create.sh) ----
if [ -f "$HOME/.cfu_root" ]; then
    export CFU_ROOT="$(cat "$HOME/.cfu_root")"
    if [ -f "$CFU_ROOT/env/conda/bin/activate" ]; then
        source "$CFU_ROOT/env/conda/bin/activate" cfu-common
        source "$CFU_ROOT/environment"
        export PATH="$CFU_ROOT/third_party/renode:$PATH"
    fi
    if [ -z "$CFU_WELCOMED" ] && [ -t 1 ]; then
        export CFU_WELCOMED=1
        echo
        echo "CFU-Playground (Renode simulation, no FPGA board needed)"
        echo "  Your project is already created and built: proj/my_first_cfu"
        echo "  Run it:  cd proj/my_first_cfu && make renode-headless   (then press Enter for the menu)"
        echo "  Notes:   see START-HERE.md"
        echo
    fi
fi
