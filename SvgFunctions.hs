module SvgFunctions
(svgLine, svgBegin, svgEnd, svgElements, svgStyle, simpleColorWheel) where

import Text.Printf

type Point = (Float,Float)
type Line = (Point,Point) 

-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando linha SVG 
-- dadas coordenadas iniciais e finais, e uma string com atributos de estilo
svgLine :: Line -> String -> String 
svgLine ((x1, y1), (x2, y2)) style = 
  printf "<line x1='%.3f' y1='%.3f' x2='%.3f' y2='%.3f' style='%s' />\n" x1 y1 x2 y2 style

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' style='background-color:black' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
-- Atributo mix-blend-mode permite misturar cores
svgStyle :: Float -> Int -> (Int,Int,Int) -> String
svgStyle alpha width (r,g,b) = printf "stroke:rgba(%d,%d,%d, %.3f);stroke-width:%d" r g b alpha width 

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma função geradora de strings SVG, uma lista de linhas e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-- Funcoes geradoras de uma roda de cores
-- O valor 255 corresponde ao valor maximo do formato rgb
-- Os valores subtraidos de ang sao responsaveis por distribuir as cores no circulo
-- Eles dividem o circulo em 3 pontos equidistantes
-- Cada um desses pontos representa o ponto maximo de cada cor

colorAngle :: Float -> (Int, Int, Int)
colorAngle angle = (r, g, b)
          where ang = angle*2*pi
                r = round ((sin ang) * 255)
                g = round ((sin (ang - 4*pi/3)) * 255) 
                b = round ((sin (ang - 5*pi/6)) * 255)

simpleColorWheel :: [Float] -> [(Int, Int, Int)]
simpleColorWheel lista = [colorAngle angle | angle <- lista]
