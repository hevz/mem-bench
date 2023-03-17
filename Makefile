CROSS_COMPILE:=
CC:=$(CROSS_COMPILE)gcc
CFLAGS:=-O3

.PHONY: all clean memset memcpy memmove

all : lib memset memcpy memmove

lib : libmem-int.so libmem-lsx.so libmem-lasx.so

clean :
	rm -f memset-lib memset-int memset-lsx memset-lasx
	rm -f memcpy-lib memcpy-int memcpy-lsx memcpy-lasx
	rm -f memmove-lib memmove-int memmove-lsx memmove-lasx
	rm -f libmem-int.so libmem-lsx.so libmem-lasx.so
	rm -f *.log

memset : memset-lib memset-int memset-lsx memset-lasx
	./memset-lib 1 20000000 | tee -a memset.log
	./memset-int 1 20000000 | tee -a memset.log
	./memset-lsx 1 20000000 | tee -a memset.log
	./memset-lasx 1 20000000 | tee -a memset.log
	./memset-lib 8 20000000 | tee -a memset.log
	./memset-int 8 20000000 | tee -a memset.log
	./memset-lsx 8 20000000 | tee -a memset.log
	./memset-lasx 8 20000000 | tee -a memset.log
	./memset-lib 16 20000000 | tee -a memset.log
	./memset-int 16 20000000 | tee -a memset.log
	./memset-lsx 16 20000000 | tee -a memset.log
	./memset-lasx 16 20000000 | tee -a memset.log
	./memset-lib 24 14000000 | tee -a memset.log
	./memset-int 24 14000000 | tee -a memset.log
	./memset-lsx 24 14000000 | tee -a memset.log
	./memset-lasx 24 14000000 | tee -a memset.log
	./memset-lib 32 14000000 | tee -a memset.log
	./memset-int 32 14000000 | tee -a memset.log
	./memset-lsx 32 14000000 | tee -a memset.log
	./memset-lasx 32 14000000 | tee -a memset.log
	./memset-lib 64 14000000 | tee -a memset.log
	./memset-int 64 14000000 | tee -a memset.log
	./memset-lsx 64 14000000 | tee -a memset.log
	./memset-lasx 64 14000000 | tee -a memset.log
	./memset-lib 300 4000000 | tee -a memset.log
	./memset-int 300 4000000 | tee -a memset.log
	./memset-lsx 300 4000000 | tee -a memset.log
	./memset-lasx 300 4000000 | tee -a memset.log
	./memset-lib 1200 600000 | tee -a memset.log
	./memset-int 1200 600000 | tee -a memset.log
	./memset-lsx 1200 600000 | tee -a memset.log
	./memset-lasx 1200 600000 | tee -a memset.log
	./memset-lib 4000 400000 | tee -a memset.log
	./memset-int 4000 400000 | tee -a memset.log
	./memset-lsx 4000 400000 | tee -a memset.log
	./memset-lasx 4000 400000 | tee -a memset.log
	./memset-lib 8000 400000 | tee -a memset.log
	./memset-int 8000 400000 | tee -a memset.log
	./memset-lsx 8000 400000 | tee -a memset.log
	./memset-lasx 8000 400000 | tee -a memset.log

memcpy : memcpy-lib memcpy-int memcpy-lsx memcpy-lasx
	./memcpy-lib 1 20000000 | tee -a memcpy.log
	./memcpy-int 1 20000000 | tee -a memcpy.log
	./memcpy-lsx 1 20000000 | tee -a memcpy.log
	./memcpy-lasx 1 20000000 | tee -a memcpy.log
	./memcpy-lib 8 20000000 | tee -a memcpy.log
	./memcpy-int 8 20000000 | tee -a memcpy.log
	./memcpy-lsx 8 20000000 | tee -a memcpy.log
	./memcpy-lasx 8 20000000 | tee -a memcpy.log
	./memcpy-lib 16 20000000 | tee -a memcpy.log
	./memcpy-int 16 20000000 | tee -a memcpy.log
	./memcpy-lsx 16 20000000 | tee -a memcpy.log
	./memcpy-lasx 16 20000000 | tee -a memcpy.log
	./memcpy-lib 24 14000000 | tee -a memcpy.log
	./memcpy-int 24 14000000 | tee -a memcpy.log
	./memcpy-lsx 24 14000000 | tee -a memcpy.log
	./memcpy-lasx 24 14000000 | tee -a memcpy.log
	./memcpy-lib 32 14000000 | tee -a memcpy.log
	./memcpy-int 32 14000000 | tee -a memcpy.log
	./memcpy-lsx 32 14000000 | tee -a memcpy.log
	./memcpy-lasx 32 14000000 | tee -a memcpy.log
	./memcpy-lib 64 14000000 | tee -a memcpy.log
	./memcpy-int 64 14000000 | tee -a memcpy.log
	./memcpy-lsx 64 14000000 | tee -a memcpy.log
	./memcpy-lasx 64 14000000 | tee -a memcpy.log
	./memcpy-lib 300 4000000 | tee -a memcpy.log
	./memcpy-int 300 4000000 | tee -a memcpy.log
	./memcpy-lsx 300 4000000 | tee -a memcpy.log
	./memcpy-lasx 300 4000000 | tee -a memcpy.log
	./memcpy-lib 1200 600000 | tee -a memcpy.log
	./memcpy-int 1200 600000 | tee -a memcpy.log
	./memcpy-lsx 1200 600000 | tee -a memcpy.log
	./memcpy-lasx 1200 600000 | tee -a memcpy.log
	./memcpy-lib 4000 400000 | tee -a memcpy.log
	./memcpy-int 4000 400000 | tee -a memcpy.log
	./memcpy-lsx 4000 400000 | tee -a memcpy.log
	./memcpy-lasx 4000 400000 | tee -a memcpy.log
	./memcpy-lib 8000 400000 | tee -a memcpy.log
	./memcpy-int 8000 400000 | tee -a memcpy.log
	./memcpy-lsx 8000 400000 | tee -a memcpy.log
	./memcpy-lasx 8000 400000 | tee -a memcpy.log

memmove : memmove-lib memmove-int memmove-lsx memmove-lasx
	./memmove-lib 1 20000000 | tee -a memmove.log
	./memmove-int 1 20000000 | tee -a memmove.log
	./memmove-lsx 1 20000000 | tee -a memmove.log
	./memmove-lasx 1 20000000 | tee -a memmove.log
	./memmove-lib 8 20000000 | tee -a memmove.log
	./memmove-int 8 20000000 | tee -a memmove.log
	./memmove-lsx 8 20000000 | tee -a memmove.log
	./memmove-lasx 8 20000000 | tee -a memmove.log
	./memmove-lib 16 20000000 | tee -a memmove.log
	./memmove-int 16 20000000 | tee -a memmove.log
	./memmove-lsx 16 20000000 | tee -a memmove.log
	./memmove-lasx 16 20000000 | tee -a memmove.log
	./memmove-lib 24 14000000 | tee -a memmove.log
	./memmove-int 24 14000000 | tee -a memmove.log
	./memmove-lsx 24 14000000 | tee -a memmove.log
	./memmove-lasx 24 14000000 | tee -a memmove.log
	./memmove-lib 32 14000000 | tee -a memmove.log
	./memmove-int 32 14000000 | tee -a memmove.log
	./memmove-lsx 32 14000000 | tee -a memmove.log
	./memmove-lasx 32 14000000 | tee -a memmove.log
	./memmove-lib 64 14000000 | tee -a memmove.log
	./memmove-int 64 14000000 | tee -a memmove.log
	./memmove-lsx 64 14000000 | tee -a memmove.log
	./memmove-lasx 64 14000000 | tee -a memmove.log
	./memmove-lib 300 4000000 | tee -a memmove.log
	./memmove-int 300 4000000 | tee -a memmove.log
	./memmove-lsx 300 4000000 | tee -a memmove.log
	./memmove-lasx 300 4000000 | tee -a memmove.log
	./memmove-lib 1200 600000 | tee -a memmove.log
	./memmove-int 1200 600000 | tee -a memmove.log
	./memmove-lsx 1200 600000 | tee -a memmove.log
	./memmove-lasx 1200 600000 | tee -a memmove.log
	./memmove-lib 4000 400000 | tee -a memmove.log
	./memmove-int 4000 400000 | tee -a memmove.log
	./memmove-lsx 4000 400000 | tee -a memmove.log
	./memmove-lasx 4000 400000 | tee -a memmove.log
	./memmove-lib 8000 400000 | tee -a memmove.log
	./memmove-int 8000 400000 | tee -a memmove.log
	./memmove-lsx 8000 400000 | tee -a memmove.log
	./memmove-lasx 8000 400000 | tee -a memmove.log

memset-lib : mem-bench.c
	$(CC) $(CFLAGS) -DMEMSET -o $@ $^

memset-int : mem-bench.c memset-int.S
	$(CC) $(CFLAGS) -DMEMSET -o $@ $^

memset-lsx : mem-bench.c memset-lsx.S
	$(CC) $(CFLAGS) -DMEMSET -o $@ $^

memset-lasx : mem-bench.c memset-lasx.S
	$(CC) $(CFLAGS) -DMEMSET -o $@ $^

memcpy-lib : mem-bench.c
	$(CC) $(CFLAGS) -DMEMCPY -o $@ $^

memcpy-int : mem-bench.c memcpy-int.S
	$(CC) $(CFLAGS) -DMEMCPY -o $@ $^

memcpy-lsx : mem-bench.c memcpy-lsx.S
	$(CC) $(CFLAGS) -DMEMCPY -o $@ $^

memcpy-lasx : mem-bench.c memcpy-lasx.S
	$(CC) $(CFLAGS) -DMEMCPY -o $@ $^

memmove-lib : mem-bench.c
	$(CC) $(CFLAGS) -DMEMMOVE -o $@ $^

memmove-int : mem-bench.c memmove-int.S memcpy-int.S
	$(CC) $(CFLAGS) -DMEMMOVE -o $@ $^

memmove-lsx : mem-bench.c memmove-lsx.S memcpy-lsx.S
	$(CC) $(CFLAGS) -DMEMMOVE -o $@ $^

memmove-lasx : mem-bench.c memmove-lasx.S memcpy-lasx.S
	$(CC) $(CFLAGS) -DMEMMOVE -o $@ $^

libmem-int.so : memset-int.S memcpy-int.S memmove-int.S
	$(CC) $(CFLAGS) -shared -o $@ $^

libmem-lsx.so : memset-lsx.S memcpy-lsx.S memmove-lsx.S
	$(CC) $(CFLAGS) -shared -o $@ $^

libmem-lasx.so : memset-lasx.S memcpy-lasx.S memmove-lasx.S
	$(CC) $(CFLAGS) -shared -o $@ $^
