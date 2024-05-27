CC=g++
CFLAGS=-Wall -Wextra --std=c++20
DEBUG=-g

a.out: main.cpp camera.h color.h hittable_list.h hittable.h interval.h ray.h rtweekend.h sphere.h vec3.h
	$(CC) $(CFLAGS) $(DEBUG) $< -o $@
	
image: a.out
	./a.out > image.ppm
	open image.ppm

clean: 
	rm -f a.out
	rm -rf a.out.dSYM
	rm -f opt.out

optimized : opt.out
	./opt.out > image.ppm
	open image.ppm

opt.out: main.cpp camera.h color.h hittable_list.h hittable.h interval.h ray.h rtweekend.h sphere.h vec3.h
	$(CC) $(CFLAGS) -O3 $< -o $@