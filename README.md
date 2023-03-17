# Memory set/cpy/move benchmarks

## Hardware

Loongson-3c5000 16-core machine (2.2GHz)

## Software

Patch: https://github.com/heiher/linux/releases/tag/memops-v2

## Results

### Memset

* memset-b: before patch
* memset-a:  after patch

```
 Performance counter stats for './memset-b 8 5000000':

            773.43 msec task-clock                #    1.000 CPUs utilized
                 7      context-switches          #    0.009 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.039 K/sec
        1701530939      cycles                    #    2.200 GHz
        3676704461      instructions              #    2.16  insn per cycle
        1065285770      branches                  # 1377.347 M/sec
           5005645      branch-misses             #    0.47% of all branches

       0.773794646 seconds time elapsed

       0.773706000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-a 8 5000000':

            418.70 msec task-clock                #    0.999 CPUs utilized
                 2      context-switches          #    0.005 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                33      page-faults               #    0.079 K/sec
         921131728      cycles                    #    2.200 GHz
        1516145426      instructions              #    1.65  insn per cycle
         425195988      branches                  # 1015.512 M/sec
              4631      branch-misses             #    0.00% of all branches

       0.418976907 seconds time elapsed

       0.418964000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-b 50 3000000':

           1530.34 msec task-clock                #    1.000 CPUs utilized
                 8      context-switches          #    0.005 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                34      page-faults               #    0.022 K/sec
        3366724499      cycles                    #    2.200 GHz
       10271876606      instructions              #    3.05  insn per cycle
        2662966669      branches                  # 1740.117 M/sec
          20996297      branch-misses             #    0.79% of all branches

       1.530735502 seconds time elapsed

       1.530570000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-a 50 3000000':

            278.48 msec task-clock                #    0.999 CPUs utilized
                 2      context-switches          #    0.007 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                34      page-faults               #    0.122 K/sec
         612645447      cycles                    #    2.200 GHz
        1629943035      instructions              #    2.66  insn per cycle
         399162449      branches                  # 1433.362 M/sec
           4023066      branch-misses             #    1.01% of all branches

       0.278714291 seconds time elapsed

       0.278714000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-b 300 1000000':

            886.79 msec task-clock                #    1.000 CPUs utilized
                 7      context-switches          #    0.008 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.034 K/sec
        1950920196      cycles                    #    2.200 GHz
        3808880096      instructions              #    1.95  insn per cycle
         869312351      branches                  #  980.291 M/sec
          17003351      branch-misses             #    1.96% of all branches

       0.887134224 seconds time elapsed

       0.887041000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-a 300 1000000':

            276.78 msec task-clock                #    0.999 CPUs utilized
                 0      context-switches          #    0.000 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.108 K/sec
         608911268      cycles                    #    2.200 GHz
        1167909634      instructions              #    1.92  insn per cycle
         197157053      branches                  #  712.321 M/sec
           1003706      branch-misses             #    0.51% of all branches

       0.276999046 seconds time elapsed

       0.277022000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-b 1200 300000':

            842.95 msec task-clock                #    1.000 CPUs utilized
                 5      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                31      page-faults               #    0.037 K/sec
        1854470352      cycles                    #    2.200 GHz
        1959895543      instructions              #    1.06  insn per cycle
         347397775      branches                  #  412.123 M/sec
           2703420      branch-misses             #    0.78% of all branches

       0.843261121 seconds time elapsed

       0.843186000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-a 1200 300000':

            329.36 msec task-clock                #    0.999 CPUs utilized
                 1      context-switches          #    0.003 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.091 K/sec
         724594051      cycles                    #    2.200 GHz
        1026704908      instructions              #    1.42  insn per cycle
         126472648      branches                  #  383.989 M/sec
            303279      branch-misses             #    0.24% of all branches

       0.329600645 seconds time elapsed

       0.329600000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-b 4000 100000':

            861.92 msec task-clock                #    1.000 CPUs utilized
                 6      context-switches          #    0.007 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                33      page-faults               #    0.038 K/sec
        1896201656      cycles                    #    2.200 GHz
        1326532138      instructions              #    0.70  insn per cycle
         160804149      branches                  #  186.566 M/sec
            503256      branch-misses             #    0.31% of all branches

       0.862233480 seconds time elapsed

       0.862149000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-a 4000 100000':

            365.24 msec task-clock                #    0.999 CPUs utilized
                 1      context-switches          #    0.003 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.082 K/sec
         803528658      cycles                    #    2.200 GHz
        1043765794      instructions              #    1.30  insn per cycle
         113081017      branches                  #  309.604 M/sec
            902788      branch-misses             #    0.80% of all branches

       0.365482535 seconds time elapsed

       0.365481000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-b 8000 100000':

           1700.54 msec task-clock                #    1.000 CPUs utilized
                12      context-switches          #    0.007 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.018 K/sec
        3741159423      cycles                    #    2.200 GHz
        2231824243      instructions              #    0.60  insn per cycle
         210609176      branches                  #  123.849 M/sec
           2103135      branch-misses             #    1.00% of all branches

       1.700973394 seconds time elapsed

       1.700771000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memset-a 8000 100000':

            731.47 msec task-clock                #    1.000 CPUs utilized
                 4      context-switches          #    0.005 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                29      page-faults               #    0.040 K/sec
        1609217324      cycles                    #    2.200 GHz
        2044328637      instructions              #    1.27  insn per cycle
         212170753      branches                  #  290.061 M/sec
           2502589      branch-misses             #    1.18% of all branches

       0.731760044 seconds time elapsed

       0.731702000 seconds user
       0.000000000 seconds sys
```

### Memcpy

* memcpy-b: before patch
* memcpy-a:  after patch

```
 Performance counter stats for './memcpy-b 8 5000000':

            741.60 msec task-clock                #    1.000 CPUs utilized
                 7      context-switches          #    0.009 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.040 K/sec
        1631501488      cycles                    #    2.200 GHz
        5011657053      instructions              #    3.07  insn per cycle
        1083001397      branches                  # 1460.359 M/sec
           5005099      branch-misses             #    0.46% of all branches

       0.741941940 seconds time elapsed

       0.741869000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-a 8 5000000':

            384.60 msec task-clock                #    0.999 CPUs utilized
                 3      context-switches          #    0.008 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                33      page-faults               #    0.086 K/sec
         846097376      cycles                    #    2.200 GHz
        1411097291      instructions              #    1.67  insn per cycle
         440188964      branches                  # 1144.552 M/sec
              4582      branch-misses             #    0.00% of all branches

       0.384865449 seconds time elapsed

       0.384853000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-b 50 3000000':

           2336.76 msec task-clock                #    1.000 CPUs utilized
                14      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                31      page-faults               #    0.013 K/sec
        5140841085      cycles                    #    2.200 GHz
       15106109924      instructions              #    2.94  insn per cycle
        2751769755      branches                  # 1177.602 M/sec
          47943508      branch-misses             #    1.74% of all branches

       2.337270312 seconds time elapsed

       2.336990000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-a 50 3000000':

            300.30 msec task-clock                #    0.999 CPUs utilized
                 2      context-switches          #    0.007 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                31      page-faults               #    0.103 K/sec
         660651569      cycles                    #    2.200 GHz
        2046981850      instructions              #    3.10  insn per cycle
         408168275      branches                  # 1359.200 M/sec
           4045163      branch-misses             #    0.99% of all branches

       0.300537305 seconds time elapsed

       0.300540000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-b 300 1000000':

           1015.22 msec task-clock                #    1.000 CPUs utilized
                 6      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                33      page-faults               #    0.033 K/sec
        2233474774      cycles                    #    2.200 GHz
        5756069842      instructions              #    2.58  insn per cycle
         873342998      branches                  #  860.248 M/sec
           5004516      branch-misses             #    0.57% of all branches

       1.015553114 seconds time elapsed

       1.011471000 seconds user
       0.003997000 seconds sys



 Performance counter stats for './memcpy-a 300 1000000':

            371.16 msec task-clock                #    0.999 CPUs utilized
                 2      context-switches          #    0.005 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.081 K/sec
         816543600      cycles                    #    2.200 GHz
        1867056907      instructions              #    2.29  insn per cycle
         200180947      branches                  #  539.338 M/sec
           1003145      branch-misses             #    0.50% of all branches

       0.371421598 seconds time elapsed

       0.367425000 seconds user
       0.003993000 seconds sys



 Performance counter stats for './memcpy-b 1200 300000':

            974.44 msec task-clock                #    1.000 CPUs utilized
                 6      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                29      page-faults               #    0.030 K/sec
        2143760844      cycles                    #    2.200 GHz
        3187400459      instructions              #    1.49  insn per cycle
         348630363      branches                  #  357.774 M/sec
           1503388      branch-misses             #    0.43% of all branches

       0.974769955 seconds time elapsed

       0.974677000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-a 1200 300000':

            395.93 msec task-clock                #    0.999 CPUs utilized
                 2      context-switches          #    0.005 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                29      page-faults               #    0.073 K/sec
         871027681      cycles                    #    2.200 GHz
        1844901330      instructions              #    2.12  insn per cycle
         127389549      branches                  #  321.751 M/sec
            304750      branch-misses             #    0.24% of all branches

       0.396176366 seconds time elapsed

       0.396167000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-b 4000 100000':

            978.89 msec task-clock                #    1.000 CPUs utilized
                 6      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.031 K/sec
        2153548295      cycles                    #    2.200 GHz
        2318208395      instructions              #    1.08  insn per cycle
         161231629      branches                  #  164.708 M/sec
           1803136      branch-misses             #    1.12% of all branches

       0.979217680 seconds time elapsed

       0.979131000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-a 4000 100000':

            414.17 msec task-clock                #    0.999 CPUs utilized
                 7      context-switches          #    0.017 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.072 K/sec
         911164975      cycles                    #    2.200 GHz
        1946968885      instructions              #    2.14  insn per cycle
         113100648      branches                  #  273.076 M/sec
            903813      branch-misses             #    0.80% of all branches

       0.414439585 seconds time elapsed

       0.414408000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-b 8000 100000':

           1899.48 msec task-clock                #    1.000 CPUs utilized
                11      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                30      page-faults               #    0.016 K/sec
        4178824005      cycles                    #    2.200 GHz
        4028421948      instructions              #    0.96  insn per cycle
         211056528      branches                  #  111.113 M/sec
           2103130      branch-misses             #    1.00% of all branches

       1.899916593 seconds time elapsed

       1.899703000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memcpy-a 8000 100000':

            815.06 msec task-clock                #    1.000 CPUs utilized
                 5      context-switches          #    0.006 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                29      page-faults               #    0.036 K/sec
        1793111200      cycles                    #    2.200 GHz
        3848357187      instructions              #    2.15  insn per cycle
         212391534      branches                  #  260.585 M/sec
           2502583      branch-misses             #    1.18% of all branches

       0.815351882 seconds time elapsed

       0.815287000 seconds user
       0.000000000 seconds sys
```

### Memmove

* memmove-b: before patch
* memmove-a:  after patch

```
 Performance counter stats for './memmove-b 8 5000000':

            923.48 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                27      page-faults:u             #    0.029 K/sec
        2030175265      cycles:u                  #    2.198 GHz
        5010224764      instructions:u            #    2.47  insn per cycle
        1085042097      branches:u                # 1174.947 M/sec
           5001995      branch-misses:u           #    0.46% of all branches

       0.923733213 seconds time elapsed

       0.923763000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-a 8 5000000':

            384.61 msec task-clock:u              #    0.999 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                30      page-faults:u             #    0.078 K/sec
         845170872      cycles:u                  #    2.197 GHz
        1410225032      instructions:u            #    1.67  insn per cycle
         440042037      branches:u                # 1144.113 M/sec
              1982      branch-misses:u           #    0.00% of all branches

       0.384842612 seconds time elapsed

       0.384893000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-b 50 3000000':

           2442.39 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                26      page-faults:u             #    0.011 K/sec
        5370200340      cycles:u                  #    2.199 GHz
       15102224029      instructions:u            #    2.81  insn per cycle
        2667041948      branches:u                # 1091.979 M/sec
          15002413      branch-misses:u           #    0.56% of all branches

       2.442662065 seconds time elapsed

       2.442636000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-a 50 3000000':

            306.40 msec task-clock:u              #    0.999 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                30      page-faults:u             #    0.098 K/sec
         673279467      cycles:u                  #    2.197 GHz
        2046225115      instructions:u            #    3.04  insn per cycle
         408041411      branches:u                # 1331.716 M/sec
           3787031      branch-misses:u           #    0.93% of all branches

       0.306603117 seconds time elapsed

       0.306650000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-b 300 1000000':

           1030.82 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                27      page-faults:u             #    0.026 K/sec
        2266208403      cycles:u                  #    2.198 GHz
        5754224786      instructions:u            #    2.54  insn per cycle
         873041549      branches:u                #  846.941 M/sec
           5001643      branch-misses:u           #    0.57% of all branches

       1.031036993 seconds time elapsed

       1.031054000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-a 300 1000000':

            371.17 msec task-clock:u              #    0.999 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                27      page-faults:u             #    0.073 K/sec
         815663217      cycles:u                  #    2.198 GHz
        1866225045      instructions:u            #    2.29  insn per cycle
         200041602      branches:u                #  538.949 M/sec
           1001422      branch-misses:u           #    0.50% of all branches

       0.371381181 seconds time elapsed

       0.371408000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-b 1200 300000':

            988.37 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                30      page-faults:u             #    0.030 K/sec
        2172861462      cycles:u                  #    2.198 GHz
        3185624845      instructions:u            #    1.47  insn per cycle
         348341341      branches:u                #  352.439 M/sec
           1501353      branch-misses:u           #    0.43% of all branches

       0.988595322 seconds time elapsed

       0.988610000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-a 1200 300000':

            395.92 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                28      page-faults:u             #    0.071 K/sec
         870033072      cycles:u                  #    2.198 GHz
        1844025058      instructions:u            #    2.12  insn per cycle
         127241226      branches:u                #  321.382 M/sec
            301170      branch-misses:u           #    0.24% of all branches

       0.396114806 seconds time elapsed

       0.396160000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-b 4000 100000':

           1017.34 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                28      page-faults:u             #    0.028 K/sec
        2236588020      cycles:u                  #    2.198 GHz
        2316424887      instructions:u            #    1.04  insn per cycle
         160941356      branches:u                #  158.198 M/sec
           2101449      branch-misses:u           #    1.31% of all branches

       1.017561603 seconds time elapsed

       1.017582000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-a 4000 100000':

            414.19 msec task-clock:u              #    0.997 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                28      page-faults:u             #    0.068 K/sec
         910209902      cycles:u                  #    2.198 GHz
        1946025048      instructions:u            #    2.14  insn per cycle
         112941941      branches:u                #  272.684 M/sec
            901741      branch-misses:u           #    0.80% of all branches

       0.415583690 seconds time elapsed

       0.414439000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-b 8000 100000':

           1898.75 msec task-clock:u              #    1.000 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                28      page-faults:u             #    0.015 K/sec
        4174713767      cycles:u                  #    2.199 GHz
        4025223901      instructions:u            #    0.96  insn per cycle
         210541174      branches:u                #  110.884 M/sec
           2100956      branch-misses:u           #    1.00% of all branches

       1.898995127 seconds time elapsed

       1.898980000 seconds user
       0.000000000 seconds sys



 Performance counter stats for './memmove-a 8000 100000':

            815.09 msec task-clock:u              #    0.993 CPUs utilized
                 0      context-switches:u        #    0.000 K/sec
                 0      cpu-migrations:u          #    0.000 K/sec
                27      page-faults:u             #    0.033 K/sec
        1791771361      cycles:u                  #    2.198 GHz
        3846824820      instructions:u            #    2.15  insn per cycle
         212141745      branches:u                #  260.268 M/sec
           2501532      branch-misses:u           #    1.18% of all branches

       0.820479153 seconds time elapsed

       0.815337000 seconds user
       0.000000000 seconds sys
```
