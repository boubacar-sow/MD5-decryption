import attaque_dictionnaire
import time

start = time.time()
attaque_dictionnaire.main()
end = time.time()
elapsed = end - start
print(f'Temps d\'exécution : {elapsed:.2}s')