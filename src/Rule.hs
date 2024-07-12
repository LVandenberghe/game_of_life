--
-- EPITECH PROJECT, 2024
-- B-FUN-400-REN-4-1-wolfram-ludwig.vandenberghe
-- File description:
-- Rule
--

module Rule where

setRule :: Int -> Int -> String -> String
setRule rule start line
    | start <= 0 = line
    | otherwise = setRule rule (start - 1) (chooseRule rule line)


chooseRule :: Int -> String -> String
chooseRule 30 line = pattern30 line "  "
chooseRule 90 line = pattern90 line "  "
chooseRule 110 line = pattern110 line "  "

pattern30 :: String -> String -> String
pattern30 ('*':'*':'*':rest) line = pattern30 ('*':'*':rest) (line ++ " ")
pattern30 ('*':'*':' ':rest) line = pattern30 ('*':' ':rest) (line ++ " ")
pattern30 ('*':' ':'*':rest) line = pattern30 (' ':'*':rest) (line ++ " ")
pattern30 ('*':' ':' ':rest) line = pattern30 (' ':' ':rest) (line ++ "*")
pattern30 (' ':'*':'*':rest) line = pattern30 ('*':'*':rest) (line ++ "*")
pattern30 (' ':'*':' ':rest) line = pattern30 ('*':' ':rest) (line ++ "*")
pattern30 (' ':' ':'*':rest) line = pattern30 (' ':'*':rest) (line ++ "*")
pattern30 (' ':' ':' ':rest) line = pattern30 (' ':' ':rest) (line ++ " ")
pattern30 _ line = line ++ "  "

pattern90 :: String -> String -> String
pattern90 ('*':'*':'*':rest) line = pattern90 ('*':'*':rest) (line ++ " ")
pattern90 ('*':'*':' ':rest) line = pattern90 ('*':' ':rest) (line ++ "*")
pattern90 ('*':' ':'*':rest) line = pattern90 (' ':'*':rest) (line ++ " ")
pattern90 ('*':' ':' ':rest) line = pattern90 (' ':' ':rest) (line ++ "*")
pattern90 (' ':'*':'*':rest) line = pattern90 ('*':'*':rest) (line ++ "*")
pattern90 (' ':'*':' ':rest) line = pattern90 ('*':' ':rest) (line ++ " ")
pattern90 (' ':' ':'*':rest) line = pattern90 (' ':'*':rest) (line ++ "*")
pattern90 (' ':' ':' ':rest) line = pattern90 (' ':' ':rest) (line ++ " ")
pattern90 _ line = line ++ "  "

pattern110 :: String -> String -> String
pattern110 ('*':'*':'*':rest) line = pattern110 ('*':'*':rest) (line ++ " ")
pattern110 ('*':'*':' ':rest) line = pattern110 ('*':' ':rest) (line ++ "*")
pattern110 ('*':' ':'*':rest) line = pattern110 (' ':'*':rest) (line ++ "*")
pattern110 ('*':' ':' ':rest) line = pattern110 (' ':' ':rest) (line ++ " ")
pattern110 (' ':'*':'*':rest) line = pattern110 ('*':'*':rest) (line ++ "*")
pattern110 (' ':'*':' ':rest) line = pattern110 ('*':' ':rest) (line ++ "*")
pattern110 (' ':' ':'*':rest) line = pattern110 (' ':'*':rest) (line ++ "*")
pattern110 (' ':' ':' ':rest) line = pattern110 (' ':' ':rest) (line ++ " ")
pattern110 _ line = line ++ "  "
