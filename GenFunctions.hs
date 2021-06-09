module GenFunctions
(logisticMap, calcAngle, calcLineEndPoint, genLinesInOrigin) where

type Point = (Float,Float)
type Line = (Point,Point) 

-- Funcao do mapa logistico
-- Xn+1 = R * Xn * (1 - Xn)
-- Funcao chave para o funcionamento do programa
-- Gera os angulos das retas com o eixo X em radianos
-- Video que inspirou minha ideia e q precisa ser assistido para que a sociedade prospere
-- https://www.youtube.com/watch?v=ovJcsL7vyrk&ab_channel=Veritasium
logisticMap :: Float -> Float -> Int -> [Float]
logisticMap x r n = take n $ iterate (\result -> r * result * (1 - result)) x


-- Funcao do Calculo dos pontos finais de uma linha com comprimento = 1
--  Essa funcao utiliza alguns conceitos basicos de trigonometria para
-- descobrir as coordenadas de um ponto que parte da origem e tem comprimento = 1
--  Ela prepara os valores de x e y das linhas para que elas possam ser multiplicadas
-- por seus comprimentos na proxima funcao
calcAngle :: [Float] -> [Point]
calcAngle lista = [(cos (pi*(x*2)), sin (pi*(x*2))) | x <- lista]  


-- Funcao que calculo o ponto final da linha
--  Essa funcao tem como entrada as coordenadas calculadas pela funcao anterior
-- e o comprimento de cada linha
--  Entao, eh multiplicado o comprimento da linha por sua coordenada correspondente
calcLineEndPoint :: [Float] -> [Point] -> [Point]
calcLineEndPoint sizes points = zipWith (\size (x, y) -> (x*size, y*size)) sizes points

-- Funcao que monta a linha
--  Essa funcao recebe como parametro o ponto de origem comum de todas as linhas e
-- os pontos finais de cada linha
--  Ela o ponto de origem com o ponto final para criar definitivamente a linha 
--  A variavel size determina exatamente a metade da altura do canvas gerado
--  Ao fazer size - y, valores positivos de y ficarao acima da metade do canvas e 
-- valores negativos ficarao abaixo, da mesma forma que funcionaria um grafico
genLinesInOrigin :: Point -> [Point] -> Float -> [Line]
genLinesInOrigin origin points size = map (\(x,y) -> (origin, (size-x,size-y))) points


