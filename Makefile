CROSS_COMPILE:=
CC:=$(CROSS_COMPILE)gcc
CFLAGS:=-O3

.PHONY: all clean memset memcpy memmove

all : memset memcpy memmove

clean :
	rm -f memset-a memset-b
	rm -f memcpy-a memcpy-b
	rm -f memmove-a memmove-b
	rm -f *.log

memset : memset-a memset-b
	perf stat --log-fd 1 ./memset-b 8 5000000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-a 8 5000000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-b 50 3000000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-a 50 3000000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-b 300 1000000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-a 300 1000000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-b 1200 300000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-a 1200 300000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-b 4000 100000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-a 4000 100000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-b 8000 100000 | tee -a memset.log
	perf stat --log-fd 1 ./memset-a 8000 100000 | tee -a memset.log

memcpy : memcpy-a memcpy-b
	perf stat --log-fd 1 ./memcpy-b 8 5000000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-a 8 5000000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-b 50 3000000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-a 50 3000000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-b 300 1000000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-a 300 1000000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-b 1200 300000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-a 1200 300000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-b 4000 100000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-a 4000 100000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-b 8000 100000 | tee -a memcpy.log
	perf stat --log-fd 1 ./memcpy-a 8000 100000 | tee -a memcpy.log

memmove : memmove-a memmove-b
	perf stat --log-fd 1 ./memmove-b 8 5000000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-a 8 5000000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-b 50 3000000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-a 50 3000000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-b 300 1000000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-a 300 1000000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-b 1200 300000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-a 1200 300000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-b 4000 100000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-a 4000 100000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-b 8000 100000 | tee -a memmove.log
	perf stat --log-fd 1 ./memmove-a 8000 100000 | tee -a memmove.log

memset-a : mem-bench.c memset-a.S
	$(CC) $(CFLAGS) -DMEMSET -o $@ $^

memset-b : mem-bench.c memset-b.S
	$(CC) $(CFLAGS) -DMEMSET -o $@ $^

memcpy-a : mem-bench.c memcpy-a.S
	$(CC) $(CFLAGS) -DMEMCPY -o $@ $^

memcpy-b : mem-bench.c memcpy-b.S
	$(CC) $(CFLAGS) -DMEMCPY -o $@ $^

memmove-a : mem-bench.c memmove-a.S memcpy-a.S
	$(CC) $(CFLAGS) -DMEMMOVE -o $@ $^

memmove-b : mem-bench.c memmove-b.S memcpy-b.S
	$(CC) $(CFLAGS) -DMEMMOVE -o $@ $^
