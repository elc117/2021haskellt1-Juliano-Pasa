import GenFunctions
import SvgFunctions

main :: IO ()
main = do
  writeFile "figs.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgLine completeLines (map svgStyle palette)
        completeLines = genLinesInOrigin origin allLines
        allLines = calcLineEndPoint [50, 100, 150, 200, 250] (calcAngle (logisticMap x r n))
        palette = rgbPalette n
        n = 5
        r = 2.8
        x = 0.3
        origin = (1, 250)
        (w, h) = (500, 500)
        