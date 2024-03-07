import sys
import argparse


def cesar(texto, clave, tarea):
    respuesta=''
    pos_clave=alfabeto.index(clave)
    for letra in texto:
        if letra in alfabaeto:
            if tarea==0:
                posicion=(alfabeto.index(letra)+pos_clave)%len(alfabeto)
            else:
                possicion=(alfabeto.index(letra)-pos_clave)%len(alfabeto)
            respuesta+=alfabeto[posicion]
        else:
            raise Exception(f'Hay un caracter que no esta disponible en el alfabeto en la posicion{texto.index(letra)}')
    return respuesta

def vigenere(texto, clave, tarea): 
    respuesta=''
    cnt=0
       
    if letra in alfabeto:
        respuesta+=cesar(letra, clave[cnt],tarea)
        cnt+=1
        
    if cnt>=len(clave):
        cnt=0
    return(respuesta)
    
if __name__=='__main__':
    alfabeto=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
              'N','O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

    parser = argparse.ArgumentParser(description='''Este algoritmo cifra con vigenere\n\nLos parametros a pasarle son:\n
                                     1:El texto con el que se quiere trabjar\n2:La clave que se quiere usar\n3: Un numero
                                     0 si se quiere cifrar el mensaje o el numero 1 si se quiere descifrar''')
    args = parser.parse_args()
    texto,key,tarea = sys.argv[1], sys.argv[2], sys.argv[3]
    resultado=vigenere(texto,key,tarea)
    print(resultado)
   
    
    
