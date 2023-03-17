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
	./memset-b 8 20000000 | tee -a memset.log
	./memset-a 8 20000000 | tee -a memset.log
	./memset-b 50 14000000 | tee -a memset.log
	./memset-a 50 14000000 | tee -a memset.log
	./memset-b 300 4000000 | tee -a memset.log
	./memset-a 300 4000000 | tee -a memset.log
	./memset-b 1200 600000 | tee -a memset.log
	./memset-a 1200 600000 | tee -a memset.log
	./memset-b 4000 400000 | tee -a memset.log
	./memset-a 4000 400000 | tee -a memset.log
	./memset-b 8000 400000 | tee -a memset.log
	./memset-a 8000 400000 | tee -a memset.log

memcpy : memcpy-a memcpy-b
	./memcpy-b 8 20000000 | tee -a memcpy.log
	./memcpy-a 8 20000000 | tee -a memcpy.log
	./memcpy-b 50 14000000 | tee -a memcpy.log
	./memcpy-a 50 14000000 | tee -a memcpy.log
	./memcpy-b 300 4000000 | tee -a memcpy.log
	./memcpy-a 300 4000000 | tee -a memcpy.log
	./memcpy-b 1200 600000 | tee -a memcpy.log
	./memcpy-a 1200 600000 | tee -a memcpy.log
	./memcpy-b 4000 400000 | tee -a memcpy.log
	./memcpy-a 4000 400000 | tee -a memcpy.log
	./memcpy-b 8000 400000 | tee -a memcpy.log
	./memcpy-a 8000 400000 | tee -a memcpy.log

memmove : memmove-a memmove-b
	./memmove-b 8 20000000 | tee -a memmove.log
	./memmove-a 8 20000000 | tee -a memmove.log
	./memmove-b 50 14000000 | tee -a memmove.log
	./memmove-a 50 14000000 | tee -a memmove.log
	./memmove-b 300 4000000 | tee -a memmove.log
	./memmove-a 300 4000000 | tee -a memmove.log
	./memmove-b 1200 600000 | tee -a memmove.log
	./memmove-a 1200 600000 | tee -a memmove.log
	./memmove-b 4000 400000 | tee -a memmove.log
	./memmove-a 4000 400000 | tee -a memmove.log
	./memmove-b 8000 400000 | tee -a memmove.log
	./memmove-a 8000 400000 | tee -a memmove.log

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
