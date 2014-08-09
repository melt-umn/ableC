
all: example1

example1: example1.xc ableC.jar
	java -jar ableC.jar example1.xc
	gcc -std=gnu1x -pthread example1.pp_out.c threadpool.c -o example1

ableC.jar:
	./build

clean:
	rm -f ableC.jar a.out build.xml *.gen_cpp *.pp_out.c example1

