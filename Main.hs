import GenFunctions
import SvgFunctions

main :: IO ()
main = do
  writeFile "figs.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgLine completeLines (map svgStyle palette)
        completeLines = genLinesInOrigin origin allLines (h/2)
        allLines = calcLineEndPoint (replicate n (w/2)) (calcAngle (logisticMap x r n))
        palette = onlyRed n
        n = 100
        r = 3.6
        x = 0.5
        origin = (250, 250)
        (w, h) = (500, 500)
        