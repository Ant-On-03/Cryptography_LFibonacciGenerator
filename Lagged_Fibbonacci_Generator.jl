

## A SOLUCIONAR PREGUNTAR PROFE: POR QUÉ AÚN HACIENDO EL MOD EN OPERATION EL RESULTADO SE SALE DEL RANGO.

## EL GENERADOR A CONTINUACIÓN SE DIVIDE EN DOS DISTINTOS:
# uno primero que inicializa un vector a partir de Key (este es Lineal Congruential Generator)
# el segundo cuya llave es el vector determinado por el anterior. Este emplea Lagged Fibbonacci 
# con una tupla de valores r y s conocidos por su robustez. Este obtiene el resultado final.
#
# Idealmente el primero sería más potente que el segundo, ya que al tener que generar tan solo 
# unos pocos valores (tantos como el valor de s).
# Y debería de cumplir ciertas condiciones para asegurar que el vector inicializador sea adecuado
# para fibbonacci. 
#
#
#

# ----------------------------------------------------------------------------------------
# ---------------------------INICIALIZAR EL VECTOR PARA FIBONACCI-------------------------
# ------------------------------LINEAL CONGRUENTIAL GENERATOR ----------------------------
# ----------------------------------------------------------------------------------------

function LinealCongruentialGenerator( key, a=48271, c=0, m=2^31-1)
    firstseed = key
    return (a*firstseed + c) % m
end

function inicialize(key::Int64, len::Int64)

    inicialized = Int64[]
    seed = key
    for element in 1:len
        new = LinealCongruentialGenerator(seed)
        push!(inicialized, new)
        seed = new
    end

    return inicialized
end

# ----------------------------------------------------------------------------------------
# ---------------------------REALIZAR UNA ITERACIÓN DE -----------------------------------
# ----------------------------------LAGGED FIBBONACCI-------------------------------------
# ----------------------------------------------------------------------------------------

function operation(x::Int64,y::Int64, mod=2^31-1)
    # Definimos la operación acorde con la recomendada por  George Marsaglia en "TOWARD A UNIVERSAL RANDOM NUMBER OPERATOR"
    if x >= y
        return x-y % mod
    else
        return x-y+1 % mod
    end
end

function fibon_next(sucesion::Vector{Int64}, r=7, s=10, mod=2^31-1)
    # obtiene el siguiente elemento de la l
    new = operation( sucesion[length(sucesion)+1-r], sucesion[length(sucesion)+1-s], mod)
    push!(sucesion, new)
    deleteat!(sucesion,1)
end

# ----------------------------------------------------------------------------------------
# ----------------------------------LAGGED FIBBONACCI-------------------------------------
# ----------------------------------------------------------------------------------------
"""
    Fibonacci Random Number Generator
    ALFG(NumRange::Vector{Int64}, key::Int64, iterations=9999, mod=2^31-1::Int64)
        
    TBW
"""
function ALFG(sucesion::Vector{Int64}, key::Int64, iterations=9999::Int64, r=128::Int64, s=159::Int64, mod=2^31-1::Int64)
    
    for iteration in 1:iterations
        fibon_next( sucesion, r, s) 
    end
    return abs(sucesion[end])
end



function pseudoaleatorio(key::Int64, len::Int64)
    # s TIENE que ser mayor que r
    iterations = 90384#5
    r = 128
    s = 159

    sucesion = inicialize(key^len, s)
    # println(ALFG(sucesion, key, iterations) % len +1)
    return ALFG(sucesion, key, iterations) % len +1
end


# ----------------------------------------------------------------------------------------
# ----------------------------------HISTOGRAMA FRECUENCIAS RESULTADOS---------------------
# ----------------------------------------------------------------------------------------
# Se busca la mayor uniformidad posible.

"""
    FreqAnalizer( n_muestras::Int64, range=10::Int64)

    # Arguments

    'n_muestras' : Input the number of samples 
    'range' : range of the output value of the pseudorandom function.

    # Returns

    This will return the total number of times each number is picked, and its porcentage.

    TBW
"""
function FreqAnalizer( n_muestras::Int64, range=10::Int64)
    
    frecuencias = Int[]
    FREQS = Int[]
    PERCENT_FREQ = Float64[]

    for number in 1:n_muestras
        push!(frecuencias, pseudoaleatorio(number, range))
    end

    for number in minimum(frecuencias):maximum(frecuencias)
        push!(FREQS, count(x -> x == number, frecuencias) )
    end

    total = sum(FREQS) 
    for FREQ in FREQS
        push!( PERCENT_FREQ, FREQ/total )
    end

    return FREQS, PERCENT_FREQ
end


 # println(FreqAnalizer( 10000, 7))


# Este generador no es típicamente usado ya que es muy susceptible a los vectores iniciales
# para ser robusto. Depende en gran medida de un buen generador pseudoaleatorio para este
# vector inicial, que ha de tener s elementos. Por ello george marsaglia recomendaba usar un
# algoritmo más potente aunque lento para generar estos primeros s elementos, que son llave
# del de Fibonacci, ya que este con unas buenas condiciones sí rinde muy bien y bastante rápido.
# Nosotros no implementamos un algoritmo fuerte ni mucho menos para generar estos primeros
# s elementos, ya que nuestro esfuerzo fue puesto en realizar el algoritmo de Fibonacci de forma
# correcta. El que empleamos para esto es un simple Lineal Congruential Generator con un ciclo
# grande (ya que copiamos los valores de MMMMMMM).


# if addition

# powers of 2 creates a sequence equal to 1.5 the modul. for modul 16 the pisano 
# sequence loops after 24 steps.



# modulo n-1 fletcher checksum
# 


# El período de este tipo de algoritmos empleando adición es (2**k-1) * 2**(M-1)
# es decir para un módulo de 26,  2**(M-1) = 26
# como m = 2**M, tenemos que log(base2)26 = M, con lo cual M = 4.7
# 4.7-1 = 3.7, y 



# PARA m 26 2**(M-2) = 2**(4.7-1) = 13

# para una k de 10, el ciclo es 6 656





# con lo cual el ciclo real es alguna permutación de todos los ciclos que encontramos.
# difícil de calcular pero podemos inferir que bastante grande.