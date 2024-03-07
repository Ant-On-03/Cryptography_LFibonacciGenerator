




## A SOLUCIONAR PREGUNTAR PROFE: POR QUÉ AÚN HACIENDO EL MOD EN OPERATION EL RESULTADO SE SALE DEL RANGO.




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
    # Definimos la operación acorde con la recomendada por MMMMM en MMMMM
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

function ALFG(NumRange::Vector{Int64}, key::Int64, iterations=9999, mod=2^31-1::Int64)
    # s TIENE que ser mayor que r
    r = 128
    s = 159

    sucesion = inicialize(key, s)
    for iteration in 1:iterations
        fibon_next( sucesion, r, s) 
    end

    return abs(sucesion[end])
end


# ----------------------------------------------------------------------------------------
# ----------------------------------HISTOGRAMA FRECUENCIAS RESULTADOS---------------------
# ----------------------------------------------------------------------------------------
# Se busca la mayor uniformidad posible.

function FreqAnalizer( n_muestras)
    frecuencias = Int[]
    for number in 1:n_muestras
        push!(frecuencias, ALFG([1,2],number))
    end

    FREQS = Int[]
    for number in minimum(frecuencias):maximum(frecuencias)
        push!(FREQS, count(x -> x == number, frecuencias) )
    end

    println("FREQS", FREQS)
    return FREQS
end


FreqAnalizer(1000)




# ----------------------------------------------------------------------------------------
# ------------------------------------------- CÉSAR --------------------------------------
# ----------------------------------------------------------------------------------------

function monoalfabeto(key)
    


end







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








