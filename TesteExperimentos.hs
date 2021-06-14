-- Documento especialmente para testes

import GenFunctions
import SvgFunctions

main :: IO ()
main = do
    putStr "Informe o numero de repeticoes: "
    n <- getLine
    putStr "Informe o valor inicial de 0 a 1: "
    x <- getLine
    putStr "Informe a taxa R: "
    r <- getLine
    
    let nLinhas = (read n :: Int)
    let vInicial = (read x :: Float)
    let taxa = (read r :: Float)

    let svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgLine completeLines (map svgStyle palette)
        completeLines = genLinesInOrigin origin allLines (h/2)
        allLines = calcLineEndPoint (replicate nLinhas (w/2)) (calcAngle results)
        palette = simpleColorWheel results
        results = logisticMap vInicial taxa nLinhas
        origin = (250, 250)
        (w, h) = (500, 500)
    writeFile "testess.svg" $ svgstrs

