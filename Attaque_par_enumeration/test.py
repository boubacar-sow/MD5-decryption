import attaque_par_enumeration_2
import sys


if len(sys.argv) <= 1:
    print("Usage: <Longeur du mot> <Mot hashé à décoder>")
else:
    attaque_par_enumeration_2.main(int(sys.argv[1].encode()), sys.argv[2].encode())