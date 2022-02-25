from setuptools import setup, Extension

module = Extension('attaque_par_enumeration_2', sources=['attaque_par_enumeration_2.pyx'])

setup(
    name='cythonAttaqueParEnumeration',
    version='1.0',
    author='jetbrains',
    ext_modules=[module]
)