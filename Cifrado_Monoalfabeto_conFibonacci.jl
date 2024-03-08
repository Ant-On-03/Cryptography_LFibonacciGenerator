
include("Lagged_Fibbonacci_Generator.jl")


# FreqAnalizer(100)
# ----------------------------------------------------------------------------------------
# ------------------------------------------- CÉSAR --------------------------------------
# ----------------------------------------------------------------------------------------

function desordenar_abecedario(key::Int64)
    abecedario = collect("ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")
    ab_desordenado = []

    while length(abecedario) > 0
        pos = pseudoaleatorio(key, length(abecedario))
        push!(ab_desordenado, abecedario[pos])
        deleteat!(abecedario, pos)
    end
    return ab_desordenado
end

# ----------------------------------------------------------------------------------------
# ----------------------------------- MAPEAR EL RESULTADO --------------------------------
# ----------------------------------------------------------------------------------------

function mapaget(ab_desord)
    abc = collect("ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")
    mapa = Dict{Char, Char}()

    for letra in 1:length(ab_desord)
        mapa[abc[letra]] = ab_desord[letra]
    end
    return mapa
end


function mapear(mapa::Dict{Char,Char}, Text::String)
    encriptado = ""
    for char in Text
        encriptado = encriptado * mapa[char]
    end
    return encriptado
end


function mapear(mapa, Text, inverse::Bool)

    if !inverse
        return mapear(mapa,Text)

    else

        # Nested Function para conseguir la llave a partir del valor en un diccionario.
        function mapainverse(dict, value)
            for (k, v) in dict
                if v == value
                    return k
                end
            end
            return "Value not found in dictionary"
        end
    
        desencriptado = ""
        for char in Text
            desencriptado = desencriptado * mapainverse(mapa, char)
        end
        return desencriptado
    end
end



function monoalfabeto(key::Int64;Text = "HOLAMUNDO", inverse=false)

    ab_desord = desordenar_abecedario(key)
    mapa = mapaget(ab_desord)


    encriptado = mapear(mapa, Text, inverse)
    return encriptado
end






println(monoalfabeto(23, Text= ""))

println(monoalfabeto(23, Text = "PCRVDSJNRSSJVRXXBFBEBXJ", inverse=true ))







println(monoalfabeto(12, Text = monoalfabeto(12),inverse=true))






