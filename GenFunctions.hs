module GenFunctions
(logisticMap, calcAngle, calcLineEndPoint) where

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
calcAngle :: [Float] -> [(Float, Float)]
calcAngle lista = [(cos (pi*x - (pi/2)), sin (pi*x - (pi/2))) | x <- lista]  


-- Funcao que calculo o ponto final da linha
--  Essa funcao tem como entrada as coordenadas calculadas pela funcao anterior
-- e o comprimento de cada linha
--  Entao, eh multiplicado o comprimento da linha por sua coordenada correspondente
calcLineEndPoint :: [Float] -> [(Float, Float)] -> [(Float, Float)]
calcLineEndPoint sizes points = zipWith (\size (x, y) -> (x*size, y*size)) sizes points
