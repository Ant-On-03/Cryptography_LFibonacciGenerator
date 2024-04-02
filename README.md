### LAGGED FIBBONACCI GENERATOR
En este proyecto el objetivo es implementar una serie de algoritmos de encriptación en diferentes lenguajes.
Usé Julia para implementar el generador de números pseudoaleatorios recomendado por George Marsaglia en 1987 siguiendo sus recomendaciones en "TOWARD A UNIVERSAL RANDOM NUMBER OPERATOR".

https://web.archive.org/web/20100610050921/http://stat.fsu.edu/techreports/M766.pdf

El generador en sí puede ser usado con varias operaciones,![image](https://github.com/Ant-On-03/Cryptography_LFibonacciGenerator/assets/132560145/fc695314-ff7b-4f74-9085-29a64e1f31fd)
 desde aditivas, multiplicativas a XOR (two-tap).  
![image](https://github.com/Ant-On-03/Cryptography_LFibonacciGenerator/assets/132560145/ec9e5e66-a074-4978-95d9-6d69812793e2)

Este generador de números pseudoaleatorios parte de tomar un vector inicial de elementos I tal que  
![image](https://github.com/Ant-On-03/Cryptography_LFibonacciGenerator/assets/132560145/7906e9ff-a1c7-4a5b-8e34-83e8c358b41c)

La operación que implementé es la siguiente.  

![image](https://github.com/Ant-On-03/Cryptography_LFibonacciGenerator/assets/132560145/c00c6b34-a8e8-4372-b521-3dbc6d33c02e)

Para emplear este algoritmo desde la terminal, es necesario tener instalado julia y escribir el comando <br>
<br>
*"julia Lagged_Fibbonacci_Generator -k 999 -l 9"* <br>
<br>
Esta empleará de llave 999 y generará un número entre 1 y 9
El resultado es el número generado.


