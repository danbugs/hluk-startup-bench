#!/usr/bin/env bash
#
# hluk-startup-bench — reproduce the startup-time comparison from the
# "Run Linux applications in hypervisor-isolated micro-VMs with Hyperlight"
# CNCF blog post.
#
# For each workload it reports the median end-to-end wall time (process start
# included, as the post states) of:
#   - hluk, from snapshot:  `hluk run --runtime <rt> --warm <script>`
#   - native:               the same program run on the host
# plus the on-disk warm-snapshot size, and a parallel-density figure.
#
# Usage:  ./run.sh            # all workloads
#         SAMPLES=30 ./run.sh # more samples (default 20)
#
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HLUK="$HERE/bin/hluk"
export HLUK_CACHE_DIR="$HERE/.cache"
SAMPLES="${SAMPLES:-20}"
VENV_PY="$HERE/.venv/bin/python"
OUT="$HERE/results/results.md"

median() { sort -n | awk '{a[NR]=$1} END{if(NR%2)print a[(NR+1)/2]; else printf "%.1f\n",(a[NR/2]+a[NR/2+1])/2}'; }

# median wall time in ms over $SAMPLES runs, after one discarded warmup
bench() {
  "$@" >/dev/null 2>&1 || true
  for _ in $(seq 1 "$SAMPLES"); do
    local s e; s=$(date +%s.%N); "$@" >/dev/null 2>&1 || true; e=$(date +%s.%N)
    awk -v s="$s" -v e="$e" 'BEGIN{printf "%.1f\n",(e-s)*1000}'
  done | median
}

hluk_warm() { "$HLUK" run --runtime "$1" --warm "$2"; }
snap_mib()  { du -sm "$HERE/.snap/$1" 2>/dev/null | cut -f1; }

row() { # label  runtime  script  native-cmd...
  local label="$1" rt="$2" script="$3"; shift 3
  local h n s
  h=$(bench hluk_warm "$rt" "$script")
  n=$(bench "$@")
  s=$(snap_mib "$rt")
  printf '| %s | %s ms | %s ms | %s MiB |\n' "$label" "$h" "$n" "${s:-n/a}" | tee -a "$OUT"
}

mkdir -p "$HERE/results"
{
  echo "# Results"
  echo
  echo "Machine: $(nproc)-vCPU $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs), nested KVM; hluk $("$HLUK" --version | awk '{print $2}'); $(date +%Y-%m-%d). Samples: $SAMPLES (median)."
  echo
  echo "| Workload | hluk, from snapshot | Native | Warm snapshot |"
  echo "| --- | --- | --- | --- |"
} > "$OUT"

row "Python hello world"                              python     "$HERE/workloads/py-hello.py"  python3 "$HERE/workloads/py-hello.py"
row "Node.js hello world"                             node       "$HERE/workloads/node-hello.js" node   "$HERE/workloads/node-hello.js"
row "C# compiled in the guest by Roslyn"              dotnet-jit "$HERE/workloads/cs-hello.cs"   bash -c "cd '$HERE/native/csharp' && dotnet run -c Release"
row "Python importing numpy, pandas, scikit-learn"    agent      "$HERE/workloads/ds.py"         "$VENV_PY" "$HERE/workloads/ds.py"

echo >> "$OUT"
echo "## Parallel density (same snapshot, concurrent VMs)" >> "$OUT"
echo >> "$OUT"
for rt in python agent; do
  echo "### $rt" >> "$OUT"
  "$HLUK" bench parallel "$HERE/.snap/$rt" "$HERE/workloads/$([ "$rt" = agent ] && echo ds.py || echo py-hello.py)" --vms 8 --iterations 10 2>&1 \
    | grep -E 'BENCH parallel' | tee -a "$OUT" || true
  echo >> "$OUT"
done

echo
echo "Wrote $OUT"
cat "$OUT"
