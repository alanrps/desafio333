
vez = "jogador1"
jogador1 = ''
jogador2 = ''
linhas = 3
colunas = 3

--Função que verifica se já há algum caractere no espaço

--Cria as colunas da matriz
function criaMatriz()
    local matriz = {}

    for i = 1,3 do
        matriz[i] = {}
    end

    return matriz
end

function zeraMatriz(matriz)
    --Zera a matriz
    for x = 1,linhas do
        for y = 1, colunas do
            matriz[x][y] = "*"
        end 
    end
end
vez = math.random(1,2)
-- print(vez)
--Função printa matriz
function printaMatriz(matriz)
    for x = 1,linhas do
        for y = 1, colunas do
            io.write(matriz[x][y]," ")

            if(y == colunas) then
                print("\n")
            end
        end
    end
end

function verificaMatriz(matriz)
    for i = 1,linhas do
        if(matriz[i][1] == matriz[i][2] and matriz[i][1] == matriz[i][3] and matriz[i][1] ~= '*') then
                -- print("GANHOU_linha");
                return matriz[i][1];
        end
    end
        
    for j = 1,colunas do
        if(matriz[1][j] == matriz[2][j] and matriz[1][j] == matriz[3][j] and matriz[1][j] ~= '*') then
            -- print("GANHOU_coluna");
            return matriz[1][j];
        end
    end

    if(matriz[1][1] == matriz[2][2] and matriz[1][1] == matriz[3][3] and matriz[1][1] ~= '*') then
        -- print("GANHOU_diagonal_p");
        return matriz[1][1];
    end

    if(matriz[1][3] == matriz[2][2] and matriz[1][3] == matriz[3][1] and matriz[1][3] ~= '*') then
        -- print("GANHOU_diagonal_s");
        return matriz[1][3];
    end

    local velha = 0
    for i = 1, linhas do
        for j = 1, colunas do
            if matriz[i][j] ~= '*' then
                velha = velha + 1;
                if(velha == 9) then
                    return "velha";
                end
            end
        end
    end

    return 0;
end

matrizDef = criaMatriz();
zeraMatriz(matrizDef);

-- vez = math.random(1,2)
-- print(vez)

indicador = ' '
print("Escolha entra X e O");
while(indicador ~= "X" and indicador ~= "O") do
    indicador = io.read()
end

if(indicador == 'X') then
    jogador1 = 'X'
    jogador2 = 'O'
else
    jogador2 = 'X'
    jogador1 = 'O'
end

while(true) do
    io.write("Escolha a posição ",vez,":\n")
    local posicao = io.read()

    if(posicao == '1' and matrizDef[1][1] ~= 'X' and matrizDef[1][1] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[1][1] = jogador1
        else
            matrizDef[1][1] = jogador2 
        end
    elseif(posicao == '2' and matrizDef[1][2] ~= 'X' and matrizDef[1][2] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[1][2] = jogador1
        else
            matrizDef[1][2] = jogador2 
        end
    elseif(posicao == '3' and matrizDef[1][3] ~= 'X' and matrizDef[1][3] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[1][3] = jogador1
        else
            matrizDef[1][3] = jogador2 
        end

    elseif(posicao == '4' and matrizDef[2][1] ~= 'X' and matrizDef[2][1] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[2][1] = jogador1
        else
            matrizDef[2][1] = jogador2 
        end
    elseif(posicao == '5' and matrizDef[2][2] ~= 'X' and matrizDef[2][2] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[2][2] = jogador1
        else
            matrizDef[2][2] = jogador2 
        end
    elseif(posicao == '6' and matrizDef[2][3] ~= 'X' and matrizDef[2][3] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[2][3] = jogador1
        else
            matrizDef[2][3] = jogador2 
        end

    elseif(posicao == '7' and matrizDef[3][1] ~= 'X' and matrizDef[3][1] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[3][1] = jogador1
        else
            matrizDef[3][1] = jogador2 
        end
    elseif(posicao == '8' and matrizDef[3][2] ~= 'X' and matrizDef[3][2] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[3][2] = jogador1
        else
            matrizDef[3][2] = jogador2 
        end
    elseif(posicao == '9' and matrizDef[3][3] ~= 'X' and matrizDef[3][3] ~= 'O') then
        if(vez == 'jogador1') then
            matrizDef[3][3] = jogador1
        else
            matrizDef[3][3] = jogador2 
        end
    else
        posicao = "invalida"
        print("Posição Inválida")
    end

    if posicao ~= 'invalida' then
        if vez == 'jogador1' then
            vez = 'jogador2'
        else 
            vez = 'jogador1'
        end
        
        printaMatriz(matrizDef);
        estado = verificaMatriz(matrizDef);

        if(estado ~= 0) then
            if(estado == jogador1) then
                print("Jogador 1 ganhou o jogo!");
                return;
            elseif(estado == jogador2) then
                print("Jogador 2 ganhou o jogo!");
                return;
            else
                print("O jogo resultou em velha");
                return;
            end
        end
    end
end