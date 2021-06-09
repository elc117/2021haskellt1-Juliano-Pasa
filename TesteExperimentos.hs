-- Documento especialmente para testes

logisticMap :: Float -> Float -> Int -> [Float]
logisticMap x r n = take n $ iterate (\result -> r*result*(1 - result)) x

calcAngle :: [Float] -> [(Float, Float)]
calcAngle lista = [(cos (pi*x - (pi/2)), sin (pi*x - (pi/2))) | x <- lista]  

calcLineEndPoint :: [Float] -> [(Float, Float)] -> [(Float, Float)]
calcLineEndPoint sizes points = zipWith (\size (x, y) -> (x*size, y*size)) sizes points

