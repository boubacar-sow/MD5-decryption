#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# =============================================================================
# Created By  : Boubacar Sow
# Created Date: Fri February 11 02:59:00  2022
# Copyright: Copyright 2022, Cryptographie-Attaque par dictionnaire
# =============================================================================
"""The Module Has Been Build for decrypting MD5 keys"""
# =============================================================================

import cython
from libc.stdio cimport *
import hashlib

def read_and_hash_from_file(filename):
    """
    Cette fonction lit un fichier et retourne sous forme dictionnnaire
    les hashs correspondant aux différents mots lus ligne par ligne
    :param filename: Nom du fichier à lire
    :return: words_hash: Dictionnaire de mots avec leurs hashs
    """
    filename_byte_string = filename.encode('UTF-8')
    cdef char* fname = filename_byte_string
    cdef FILE * fic
    words_hash = {};
    fic = fopen(fname, 'rb')
    if fic == NULL:
        raise FileNotFoundError
    cdef char * line = NULL
    cdef size_t l = 0
    cdef ssize_t read

    while True:
        read = getline(&line, &l, fic)
        if read == -1:
            break
        words_hash[line.decode()[:-2]] = hashlib.md5(line.decode()[:-2].encode()).hexdigest()

    fclose(fic)

    return words_hash

def read_file_hash(filename):
    """

    :param filename:
    :return: list_hash
    """
    filename_byte_string = filename.encode('UTF-8')
    cdef char* fname = filename_byte_string
    cdef FILE * fic
    fic = fopen(fname, 'rb')
    if fic == NULL:
        raise FileNotFoundError
    cdef char * line = NULL
    cdef size_t l = 0
    cdef ssize_t read
    list_hash = []
    while True:
        read = getline(&line, &l, fic)
        if read == -1:
            break
        list_hash.append(line.decode()[:-1])

    return list_hash

def get_key(dictionnary, value):
    """
    Cette fonction retrouve la clé dans un dictionnaire
    correspondant à une valeur donnée en paramètre
    :param dictionnary:
    :param value:
    :return: clé: #
    """
    list_of_key = list(dictionnary.keys())
    list_of_values = list(dictionnary.values())
    try:
        ind = list_of_values.index(value)
    except ValueError:
        return "Échec du décryptage de " + value

    return list_of_key[ind]

def main():
    words_hash = read_and_hash_from_file("../ressources/mots-8-et-moins.txt")
    list_hash = read_file_hash("../ressources/list_hash.txt")

    for hash in list_hash:
        print(get_key(words_hash, hash))




