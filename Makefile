.PHONY: clean

all: tri

main.o: main.c
	$(CC) -c main.c -o main.o

%.run: main.o %.o print.o
	$(CC) main.o $*.o print.o -o $@

print.o: print.h print.c
	$(CC) -c print.c -o print.o

%.S: %.rkt
	~/Programs/racket/bin/racket -t compile-file.rkt -m $< > $@

%.o: %.S
	~/Programs/nasm/bin/nasm -f elf64 -o $@ $<

clean:
	rm -rf *.o *.run
