# Results

Machine: 8-vCPU Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz, nested KVM; hluk 0.20.1; 2026-11-02. Samples: 20 (median).

| Workload | hluk, from snapshot | Native | Warm snapshot |
| --- | --- | --- | --- |
| Python hello world | 22.1 ms | 16.6 ms | 77 MiB |
| Node.js hello world | 39.0 ms | 21.9 ms | 254 MiB |
| C# compiled in the guest by Roslyn | 94.8 ms | 1549.3 ms | 389 MiB |
| Python importing numpy, pandas, scikit-learn | 45.2 ms | 1118.9 ms | 839 MiB |

## Parallel density (same snapshot, concurrent VMs)

### python
BENCH parallel vm=7 iter=0 exec_ms=7.633 restore_ms=1.573
BENCH parallel vm=7 iter=1 exec_ms=2.098 restore_ms=1.523
BENCH parallel vm=6 iter=0 exec_ms=11.424 restore_ms=1.603
BENCH parallel vm=7 iter=2 exec_ms=2.042 restore_ms=1.431
BENCH parallel vm=6 iter=1 exec_ms=1.984 restore_ms=1.556
BENCH parallel vm=1 iter=0 exec_ms=12.621 restore_ms=1.622
BENCH parallel vm=5 iter=0 exec_ms=17.095 restore_ms=2.015
BENCH parallel vm=7 iter=3 exec_ms=2.020 restore_ms=1.391
BENCH parallel vm=6 iter=2 exec_ms=2.202 restore_ms=1.385
BENCH parallel vm=3 iter=0 exec_ms=13.789 restore_ms=6.649
BENCH parallel vm=4 iter=0 exec_ms=16.000 restore_ms=4.694
BENCH parallel vm=2 iter=0 exec_ms=12.049 restore_ms=6.825
BENCH parallel vm=7 iter=4 exec_ms=2.004 restore_ms=1.339
BENCH parallel vm=3 iter=1 exec_ms=1.994 restore_ms=1.848
BENCH parallel vm=5 iter=1 exec_ms=1.991 restore_ms=3.844
BENCH parallel vm=6 iter=3 exec_ms=2.013 restore_ms=1.322
BENCH parallel vm=4 iter=1 exec_ms=3.835 restore_ms=1.465
BENCH parallel vm=1 iter=1 exec_ms=7.092 restore_ms=1.486
BENCH parallel vm=3 iter=2 exec_ms=2.227 restore_ms=1.411
BENCH parallel vm=4 iter=2 exec_ms=2.224 restore_ms=1.396
BENCH parallel vm=2 iter=1 exec_ms=5.654 restore_ms=1.618
BENCH parallel vm=1 iter=2 exec_ms=2.018 restore_ms=1.438
BENCH parallel vm=0 iter=0 exec_ms=13.752 restore_ms=4.547
BENCH parallel vm=3 iter=3 exec_ms=2.065 restore_ms=1.361
BENCH parallel vm=5 iter=2 exec_ms=1.931 restore_ms=4.767
BENCH parallel vm=7 iter=5 exec_ms=6.020 restore_ms=1.374
BENCH parallel vm=6 iter=4 exec_ms=3.382 restore_ms=1.472
BENCH parallel vm=1 iter=3 exec_ms=1.945 restore_ms=1.372
BENCH parallel vm=2 iter=2 exec_ms=3.328 restore_ms=1.370
BENCH parallel vm=3 iter=4 exec_ms=2.073 restore_ms=1.377
BENCH parallel vm=4 iter=3 exec_ms=5.208 restore_ms=1.384
BENCH parallel vm=1 iter=4 exec_ms=1.938 restore_ms=1.321
BENCH parallel vm=0 iter=1 exec_ms=2.117 restore_ms=4.412
BENCH parallel vm=3 iter=5 exec_ms=2.022 restore_ms=1.272
BENCH parallel vm=6 iter=5 exec_ms=5.013 restore_ms=1.896
BENCH parallel vm=5 iter=3 exec_ms=6.087 restore_ms=1.431
BENCH parallel vm=1 iter=5 exec_ms=1.934 restore_ms=1.294
BENCH parallel vm=7 iter=6 exec_ms=4.053 restore_ms=2.693
BENCH parallel vm=3 iter=6 exec_ms=1.987 restore_ms=1.354
BENCH parallel vm=1 iter=6 exec_ms=1.922 restore_ms=1.233
BENCH parallel vm=0 iter=2 exec_ms=1.991 restore_ms=3.940
BENCH parallel vm=2 iter=3 exec_ms=8.111 restore_ms=1.599
BENCH parallel vm=3 iter=7 exec_ms=2.061 restore_ms=1.289
BENCH parallel vm=5 iter=4 exec_ms=1.924 restore_ms=4.187
BENCH parallel vm=7 iter=7 exec_ms=2.067 restore_ms=2.389
BENCH parallel vm=4 iter=4 exec_ms=5.009 restore_ms=4.925
BENCH parallel vm=1 iter=7 exec_ms=1.981 restore_ms=1.271
BENCH parallel vm=6 iter=6 exec_ms=1.952 restore_ms=7.342
BENCH parallel vm=3 iter=8 exec_ms=2.103 restore_ms=1.344
BENCH parallel vm=0 iter=3 exec_ms=2.005 restore_ms=3.496
BENCH parallel vm=1 iter=8 exec_ms=1.928 restore_ms=1.311
BENCH parallel vm=5 iter=5 exec_ms=1.914 restore_ms=2.863
BENCH parallel vm=2 iter=4 exec_ms=5.620 restore_ms=1.545
BENCH parallel vm=7 iter=8 exec_ms=1.965 restore_ms=4.454
BENCH parallel vm=3 iter=9 exec_ms=2.054 restore_ms=1.291
BENCH parallel vm=3 total_ms=56.025 iterations=10 throughput=178.5/s
BENCH parallel vm=1 iter=9 exec_ms=1.974 restore_ms=1.345
BENCH parallel vm=1 total_ms=57.003 iterations=10 throughput=175.4/s
BENCH parallel vm=4 iter=5 exec_ms=5.332 restore_ms=1.421
BENCH parallel vm=2 iter=5 exec_ms=2.006 restore_ms=1.425
BENCH parallel vm=5 iter=6 exec_ms=2.275 restore_ms=2.749
BENCH parallel vm=6 iter=7 exec_ms=2.302 restore_ms=4.458
BENCH parallel vm=0 iter=4 exec_ms=5.914 restore_ms=1.359
BENCH parallel vm=4 iter=6 exec_ms=3.114 restore_ms=1.640
BENCH parallel vm=2 iter=6 exec_ms=2.287 restore_ms=1.417
BENCH parallel vm=7 iter=9 exec_ms=3.081 restore_ms=3.966
BENCH parallel vm=7 total_ms=62.954 iterations=10 throughput=158.8/s
BENCH parallel vm=0 iter=5 exec_ms=2.041 restore_ms=1.371
BENCH parallel vm=6 iter=8 exec_ms=2.159 restore_ms=2.059
BENCH parallel vm=5 iter=7 exec_ms=3.278 restore_ms=1.832
BENCH parallel vm=2 iter=7 exec_ms=2.131 restore_ms=1.347
BENCH parallel vm=4 iter=7 exec_ms=2.953 restore_ms=1.449
BENCH parallel vm=0 iter=6 exec_ms=2.002 restore_ms=1.415
BENCH parallel vm=6 iter=9 exec_ms=2.114 restore_ms=1.394
BENCH parallel vm=6 total_ms=67.684 iterations=10 throughput=147.7/s
BENCH parallel vm=5 iter=8 exec_ms=2.339 restore_ms=1.520
BENCH parallel vm=2 iter=8 exec_ms=2.055 restore_ms=1.098
BENCH parallel vm=0 iter=7 exec_ms=1.940 restore_ms=1.434
BENCH parallel vm=4 iter=8 exec_ms=2.824 restore_ms=1.415
BENCH parallel vm=2 iter=9 exec_ms=1.410 restore_ms=1.002
BENCH parallel vm=2 total_ms=71.760 iterations=10 throughput=139.4/s
BENCH parallel vm=5 iter=9 exec_ms=2.170 restore_ms=1.491
BENCH parallel vm=5 total_ms=71.924 iterations=10 throughput=139.0/s
BENCH parallel vm=0 iter=8 exec_ms=1.954 restore_ms=1.214
BENCH parallel vm=4 iter=9 exec_ms=3.007 restore_ms=1.427
BENCH parallel vm=4 total_ms=75.048 iterations=10 throughput=133.2/s
BENCH parallel vm=0 iter=9 exec_ms=1.565 restore_ms=1.122
BENCH parallel vm=0 total_ms=76.280 iterations=10 throughput=131.1/s
BENCH parallel summary vms=8 iterations=10 total_calls=80 wall_ms=94.504 throughput=846.5/s
BENCH parallel exec_ms median=2.116 p95=12.678 min=1.410 max=17.095 samples=80
BENCH parallel snapshot_mib=76.3
BENCH parallel rss_mb=0

### agent
BENCH parallel vm=3 iter=0 exec_ms=36.918 restore_ms=2.825
BENCH parallel vm=0 iter=0 exec_ms=38.967 restore_ms=2.712
BENCH parallel vm=7 iter=0 exec_ms=37.633 restore_ms=3.279
BENCH parallel vm=1 iter=0 exec_ms=39.799 restore_ms=3.279
BENCH parallel vm=3 iter=1 exec_ms=15.674 restore_ms=3.161
BENCH parallel vm=0 iter=1 exec_ms=16.349 restore_ms=2.604
BENCH parallel vm=7 iter=1 exec_ms=15.543 restore_ms=3.002
BENCH parallel vm=1 iter=1 exec_ms=16.315 restore_ms=3.020
BENCH parallel vm=4 iter=0 exec_ms=70.173 restore_ms=6.358
BENCH parallel vm=5 iter=0 exec_ms=72.919 restore_ms=6.055
BENCH parallel vm=2 iter=0 exec_ms=68.363 restore_ms=8.349
BENCH parallel vm=3 iter=2 exec_ms=15.725 restore_ms=2.671
BENCH parallel vm=6 iter=0 exec_ms=75.273 restore_ms=5.515
BENCH parallel vm=0 iter=2 exec_ms=16.738 restore_ms=2.691
BENCH parallel vm=7 iter=2 exec_ms=16.476 restore_ms=3.045
BENCH parallel vm=1 iter=2 exec_ms=16.855 restore_ms=2.980
BENCH parallel vm=3 iter=3 exec_ms=16.017 restore_ms=2.774
BENCH parallel vm=7 iter=3 exec_ms=16.206 restore_ms=2.997
BENCH parallel vm=0 iter=3 exec_ms=16.673 restore_ms=2.787
BENCH parallel vm=1 iter=3 exec_ms=16.705 restore_ms=2.959
BENCH parallel vm=4 iter=1 exec_ms=32.917 restore_ms=6.241
BENCH parallel vm=5 iter=1 exec_ms=32.097 restore_ms=5.621
BENCH parallel vm=3 iter=4 exec_ms=15.648 restore_ms=2.707
BENCH parallel vm=2 iter=1 exec_ms=32.183 restore_ms=6.990
BENCH parallel vm=0 iter=4 exec_ms=16.506 restore_ms=3.219
BENCH parallel vm=6 iter=1 exec_ms=31.816 restore_ms=7.137
BENCH parallel vm=7 iter=4 exec_ms=16.530 restore_ms=3.599
BENCH parallel vm=1 iter=4 exec_ms=16.557 restore_ms=3.043
BENCH parallel vm=3 iter=5 exec_ms=15.235 restore_ms=2.878
BENCH parallel vm=0 iter=5 exec_ms=15.914 restore_ms=3.623
BENCH parallel vm=7 iter=5 exec_ms=16.160 restore_ms=3.307
BENCH parallel vm=1 iter=5 exec_ms=15.347 restore_ms=3.340
BENCH parallel vm=5 iter=2 exec_ms=31.295 restore_ms=2.929
BENCH parallel vm=3 iter=6 exec_ms=15.435 restore_ms=2.699
BENCH parallel vm=6 iter=2 exec_ms=32.727 restore_ms=3.208
BENCH parallel vm=4 iter=2 exec_ms=29.301 restore_ms=11.331
BENCH parallel vm=0 iter=6 exec_ms=15.678 restore_ms=2.741
BENCH parallel vm=7 iter=6 exec_ms=15.098 restore_ms=3.246
BENCH parallel vm=2 iter=2 exec_ms=30.871 restore_ms=6.524
BENCH parallel vm=1 iter=6 exec_ms=15.231 restore_ms=3.223
BENCH parallel vm=3 iter=7 exec_ms=15.340 restore_ms=2.985
BENCH parallel vm=0 iter=7 exec_ms=15.753 restore_ms=2.833
BENCH parallel vm=7 iter=7 exec_ms=15.483 restore_ms=3.305
BENCH parallel vm=1 iter=7 exec_ms=15.823 restore_ms=3.370
BENCH parallel vm=5 iter=3 exec_ms=33.861 restore_ms=5.045
BENCH parallel vm=3 iter=8 exec_ms=15.676 restore_ms=2.792
BENCH parallel vm=4 iter=3 exec_ms=28.298 restore_ms=5.546
BENCH parallel vm=6 iter=3 exec_ms=31.166 restore_ms=5.242
BENCH parallel vm=2 iter=3 exec_ms=29.562 restore_ms=6.956
BENCH parallel vm=7 iter=8 exec_ms=16.352 restore_ms=2.949
BENCH parallel vm=0 iter=8 exec_ms=17.154 restore_ms=2.722
BENCH parallel vm=1 iter=8 exec_ms=17.361 restore_ms=2.842
BENCH parallel vm=3 iter=9 exec_ms=16.861 restore_ms=2.974
BENCH parallel vm=3 total_ms=220.230 iterations=10 throughput=45.4/s
BENCH parallel vm=7 iter=9 exec_ms=15.720 restore_ms=2.734
BENCH parallel vm=7 total_ms=223.903 iterations=10 throughput=44.7/s
BENCH parallel vm=0 iter=9 exec_ms=16.066 restore_ms=2.610
BENCH parallel vm=0 total_ms=224.341 iterations=10 throughput=44.6/s
BENCH parallel vm=1 iter=9 exec_ms=21.791 restore_ms=3.074
BENCH parallel vm=1 total_ms=232.707 iterations=10 throughput=43.0/s
BENCH parallel vm=5 iter=4 exec_ms=32.598 restore_ms=3.204
BENCH parallel vm=4 iter=4 exec_ms=31.221 restore_ms=4.720
BENCH parallel vm=6 iter=4 exec_ms=33.615 restore_ms=2.714
BENCH parallel vm=2 iter=4 exec_ms=35.923 restore_ms=4.837
BENCH parallel vm=4 iter=5 exec_ms=12.737 restore_ms=2.151
BENCH parallel vm=5 iter=5 exec_ms=17.728 restore_ms=2.830
BENCH parallel vm=6 iter=5 exec_ms=20.002 restore_ms=2.838
BENCH parallel vm=2 iter=5 exec_ms=15.509 restore_ms=2.610
BENCH parallel vm=4 iter=6 exec_ms=11.217 restore_ms=2.243
BENCH parallel vm=5 iter=6 exec_ms=16.162 restore_ms=2.872
BENCH parallel vm=4 iter=7 exec_ms=11.233 restore_ms=2.334
BENCH parallel vm=6 iter=6 exec_ms=15.977 restore_ms=2.739
BENCH parallel vm=2 iter=6 exec_ms=15.269 restore_ms=2.527
BENCH parallel vm=4 iter=8 exec_ms=11.547 restore_ms=2.086
BENCH parallel vm=5 iter=7 exec_ms=16.012 restore_ms=2.952
BENCH parallel vm=2 iter=7 exec_ms=15.210 restore_ms=2.552
BENCH parallel vm=6 iter=7 exec_ms=15.727 restore_ms=2.907
BENCH parallel vm=4 iter=9 exec_ms=13.123 restore_ms=2.146
BENCH parallel vm=4 total_ms=308.190 iterations=10 throughput=32.4/s
BENCH parallel vm=5 iter=8 exec_ms=17.220 restore_ms=2.687
BENCH parallel vm=2 iter=8 exec_ms=15.863 restore_ms=2.556
BENCH parallel vm=6 iter=8 exec_ms=15.920 restore_ms=2.642
BENCH parallel vm=5 iter=9 exec_ms=17.797 restore_ms=2.820
BENCH parallel vm=5 total_ms=335.242 iterations=10 throughput=29.8/s
BENCH parallel vm=2 iter=9 exec_ms=16.606 restore_ms=2.575
BENCH parallel vm=2 total_ms=336.015 iterations=10 throughput=29.8/s
BENCH parallel vm=6 iter=9 exec_ms=17.101 restore_ms=2.659
BENCH parallel vm=6 total_ms=337.473 iterations=10 throughput=29.6/s
BENCH parallel summary vms=8 iterations=10 total_calls=80 wall_ms=352.958 throughput=226.7/s
BENCH parallel exec_ms median=16.518 p95=41.227 min=11.217 max=75.273 samples=80
BENCH parallel snapshot_mib=838.9
BENCH parallel rss_mb=0

