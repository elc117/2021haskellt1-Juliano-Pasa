module SvgFunctions
(svgLine, svgBegin, svgEnd, svgElements, svgStyle, redPalette, rgbPalette) where

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
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
-- Atributo mix-blend-mode permite misturar cores
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "stroke:rgb(%d,%d,%d);stroke-width:3" r g b

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma função geradora de strings SVG, uma lista de linhas e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

redPalette :: Int -> [(Int,Int,Int)]
redPalette n = [(x, 0, 0) | x <- take n [div 255 n,2*(div 255 n)..]]

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255)]