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
        svgfigs = svgElements svgLine completeLines (map (svgStyle alpha width) palette)
        completeLines = genLinesInOrigin origin allLines (h/2)
        allLines = calcLineEndPoint (replicate nLinhas (w/2)) (calcAngle results)
        palette = simpleColorWheel results
        results = logisticMap vInicial taxa nLinhas
        origin = (w/2, h/2)
        (w, h) = (500, 500)
        alpha = 0.3
        width = 3
    writeFile "figs.svg" $ svgstrs
        