#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# =============================================================================
# Created By  : Boubacar Sow
# Created Date: Fri February 17 22:00:00  2022
# Copyright: Copyright 2022, Cryptographie-Attaque par dictionnaire
# =============================================================================
"""The Module Has Been Build for decrypting MD5 keys"""
# =============================================================================

import hashlib
import os
import time
from itertools import product
from functools import partial
from multiprocessing import Pool
import cython
from libc.stdio cimport *

#def product(*args, repeat=1):
#   # product('ABCD', 'xy') --> Ax Ay Bx By Cx Cy Dx Dy
#  # product(range(2), repeat=3) --> 000 001 010 011 100 101 110 111
#    pools = [tuple(pool) for pool in args] * repeat
#   result = [[]]
#    for pool in pools:
#        result = [x+[y] for x in result for y in pool]
#    for prod in result:
#        yield tuple(prod)


def decrypt(alphabet, char* hash_to_decrypt, n):
    for t in product(alphabet, repeat=n):
        a_word = ''.join(t)
        if hash_to_decrypt.decode() == hashlib.md5(a_word.encode()).hexdigest():
            print("Hash Trouvé: "+ a_word)
            return a_word
    return ""


def main(int n, char* hash_to_decrypt):
    start = time.time()
    alphabet = list("abcdefghijklmnopqrstuvwxyz0123456789!@#$%&*")
    nb_cpu = os.cpu_count()
    p = Pool(nb_cpu)
    print("Nombre de CPUs: "+ str(nb_cpu))
    result = p.map(partial(decrypt, alphabet, hash_to_decrypt), range(n+1))

    p.close()
    p.join()
    if "".join(result) == "":
        print("Non trouvé dans l'ensemble des mots de", str(n), " lettres et moins")
    end = time.time()
    elapsed = end - start

    print(f'Temps d\'exécution : {elapsed:.2}s')
