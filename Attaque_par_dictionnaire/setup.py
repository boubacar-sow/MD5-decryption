from setuptools import setup, Extension

module = Extension('attaque_dictionnaire', sources=['attaque_dictionnaire.pyx'])

setup(
    name='attaque_dictionnaire',
    version='1.0',
    author='jetbrains',
    ext_modules=[module]
)