#!/bin/bash
# Runs once, during the Codespaces prebuild. Installs everything into the
# workspace (the CFU-Playground checkout) and pre-builds proj/my_first_cfu.
set -eo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
echo "== CFU-Playground setup in $ROOT =="

# Remember where the repo is, for the shell snippet.
echo "$ROOT" > "$HOME/.cfu_root"

# Recent Miniconda wants the Anaconda ToS accepted for the "defaults" channel.
export CONDA_PLUGINS_AUTO_ACCEPT_TOS=yes

echo "== 1/4 conda environment (cfu-common): RISC-V GCC, Verilator, Yosys =="
git submodule update --init third_party/make-env
make env
env/conda/bin/conda clean -afy

echo "== 2/4 submodules + Renode =="
source env/conda/bin/activate cfu-common
./scripts/setup -ci

echo "== 3/4 pre-build proj/my_first_cfu =="
source environment
export PATH="$ROOT/third_party/renode:$PATH"
if [ ! -d proj/my_first_cfu ]; then
    cp -r proj/proj_template proj/my_first_cfu
fi
(
    cd proj/my_first_cfu
    ../../scripts/pyrun cfu.py          # Amaranth unit tests
    make -j4 renode-scripts             # SoC + software + Verilated CFU for Renode
)

echo "== 4/4 shell setup =="
if ! grep -q "CFU-Playground environment" "$HOME/.bashrc"; then
    cat "$ROOT/.devcontainer/bashrc-snippet.sh" >> "$HOME/.bashrc"
fi

echo "== done =="
