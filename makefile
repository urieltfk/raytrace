CC=g++
CFLAGS=-Wall -Wextra --std=c++20
DEBUG=-g
INC=-I./include
DEP=include/camera.h include/color.h include/hittable_list.h include/hittable.h include/interval.h include/ray.h include/rtweekend.h include/sphere.h include/vec3.h

a.out: main.cpp $(DEP)
	$(CC) $(CFLAGS) $(DEBUG) $(INC) $< -o $@
	
image: a.out
	./a.out > image.ppm
	open image.ppm

clean: 
	rm -f a.out
	rm -rf a.out.dSYM
	rm -f opt.out

opt : opt.out
	./opt.out > image.ppm
	open image.ppm

opt.out: main.cpp $(DEP)
	$(CC) $(CFLAGS) $(INC) -O3 $< -o $@