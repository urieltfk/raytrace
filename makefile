CC=g++
CFLAGS=-Wall -g --std=c++20

a.out: main.cpp ray.h color.h vec3.h
	$(CC) $(CFLAGS) $< -o $@
	
clean: 
	rm a.out
	rm -rf a.out.dSYM