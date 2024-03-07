

## ALGORITMO SUSTITUCIÓN MONOALFABETO.

from julia import Main
Main.include("Lagged_Fibbonacci_Generator.jl")


def list_take():
    alfabeto=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
              'N','O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    desordenada = []

    for number in range(len(alfabeto)):

        take = pseudorandom(len(alfabeto))
        desordenada.append(alfabeto.pop(take))

    return desordenada



def pseudorandom(max):

    return max//3


def fib_to(a,b,c):
    fibs = [a,b]
    for i in range(2, c + 1):
        fibs.append(fibs[-1] + fibs[-2])
    return fibs



def mapear(desordenada):
    alfabeto=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
              'N','O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    mapa = {}

    for posicion in range(len(alfabeto)):
        mapa[alfabeto[posicion]] = desordenada[posicion]

    return mapa



if __name__ == "__main__":
    desordenada = list_take()
    print(mapear(desordenada))
    pass















