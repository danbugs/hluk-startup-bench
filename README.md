# hluk-startup-bench

A small, reproducible harness for the startup-time comparison in the blog post
**"Run Linux applications in hypervisor-isolated micro-VMs with Hyperlight."**

It answers one question: for a given program, how long does it take to get a
result from a warm [hyperlight-unikraft](https://github.com/hyperlight-dev/hyperlight-unikraft)
(`hluk`) snapshot versus running the same program natively on the host — with
process start included on both sides, which is what the post reports.

This is deliberately simpler than the full
[hyperlight-bench](https://github.com/hyperlight-dev/hyperlight-bench) HTTP
suite: it measures exactly the handful of startup numbers the post shows, and
nothing else, so the table is easy to re-run and audit.

## What it measures

For each workload, the median wall time over 20 runs (one warmup discarded) of:

- **hluk, from snapshot** — `hluk run --runtime <rt> --warm <script>`, a fresh
  `hluk` process each time, restoring the runtime's warm snapshot from the cache.
- **native** — the same program run on the host.

It also records each runtime's on-disk warm-snapshot size, and a parallel-density
figure: N micro-VMs restored concurrently from one snapshot.

| Workload | runtime | native baseline |
| --- | --- | --- |
| Python hello world | `python` | `python3` |
| Node.js hello world | `node` | `node` |
| C# compiled in the guest by Roslyn | `dotnet-jit` | `dotnet run -c Release` |
| Python importing numpy, pandas, scikit-learn | `agent` | venv `python` with the same libs |

## Prerequisites

- Linux with KVM (`/dev/kvm`), Docker not required for these workloads.
- `hluk` **v0.20.1** in `./bin/hluk` (not committed — it is a release binary):

  ```sh
  mkdir -p bin && cd bin
  gh release download v0.20.1 --repo hyperlight-dev/hyperlight-unikraft \
    --pattern 'hluk-v0.20.1-x86_64-unknown-linux-musl.tar.gz'
  tar xzf hluk-v0.20.1-*.tar.gz
  ```

- A Python venv with the native data-science baselines:

  ```sh
  python3 -m venv .venv && .venv/bin/pip install numpy pandas scikit-learn
  ```

- The C# native baseline project (`native/csharp/`): `dotnet new console` with a
  one-line `Program.cs`.

## Run

```sh
# save the warm snapshots the harness restores from
for rt in python node dotnet-jit agent; do
  ./bin/hluk snapshot save --runtime "$rt" --output ".snap/$rt"
done

./run.sh            # all workloads, 20 samples
SAMPLES=30 ./run.sh # more samples
```

Results are written to `results/results.md`, with the machine, hluk version and
date in the header. Absolute numbers are machine-dependent; re-run on your own
host to compare.

## Layout

```
bin/            hluk binary (download, gitignored)
workloads/      the scripts measured (py-hello.py, node-hello.js, cs-hello.cs, ds.py)
native/csharp/  the dotnet project for the native C# baseline
run.sh          the harness
results/        output
```
