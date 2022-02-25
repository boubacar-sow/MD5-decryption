
all: module html test

module: attaque_par_enumeration_2.cpython-39-x86_64-linux-gnu.so

test: 	module
		python3 test.py

html:	attaque_par_enumeration_2.cpython-39-x86_64-linux-gnu.pyx.html

attaque_par_enumeration_2.cpython-39-x86_64-linux-gnu.so: attaque_par_enumeration_2.c
		python3 setup.py build_ext --inplace

attaque_par_enumeration_2.cpython-39-x86_64-linux-gnu.pyx.html: attaque_par_enumeration_2.pyx
		cython3 -a attaque_par_enumeration_2.pyx
		@echo "Annotated HTML of the C code generated in attaque_par_enumeration_2.cpython-39-x86_64-linux-gnu.html"

attaque_par_enumeration_2.c :
		cython3 attaque_par_enumeration_2.pyx --embed

clean:
	@echo Cleaning Source
	rm -fr build
	rm -f *.so
	rm -f *.pyd
	rm -f *.c