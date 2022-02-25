
all: module html test

module: attaque_dictionnaire.cpython-39-x86_64-linux-gnu.so

test: 	module
		python3 test.py

html:	attaque_dictionnaire.cpython-39-x86_64-linux-gnu.pyx.html

attaque_dictionnaire.cpython-39-x86_64-linux-gnu.so:  attaque_dictionnaire.c
		python3 setup.py build_ext --inplace

attaque_dictionnaire.cpython-39-x86_64-linux-gnu.pyx.html: attaque_dictionnaire.pyx
		cython3 -a attaque_dictionnaire.pyx
		@echo "Annotated HTML of the C code generated in attaque_dictionnaire.cpython-39-x86_64-linux-gnu.html"

attaque_dictionnaire.c :
		cython3 attaque_dictionnaire.pyx --embed

clean:
	@echo Cleaning Source
	rm -fr build
	rm -f *.so
	rm -f *.pyd
	rm -f *.c