--
-- EPITECH PROJECT, 2024
-- B-FUN-400-REN-4-1-wolfram-ludwig.vandenberghe
-- File description:
-- Print
--

module Print where

import Rule

resizeLine :: String -> Int -> String
resizeLine line off
    | off < 0   = drop (-off) line
    | otherwise = replicate off ' ' ++ line

cutBegin :: String -> Int -> String
cutBegin line move = drop move line

addMove :: String -> Int -> String
addMove line move = line ++ replicate move ' '

resizeMove :: String -> Int -> String
resizeMove line move
    | move < 0  = reverse $ cutBegin (reverse line) (-move)
    | move > 0  = reverse $ addMove (reverse line) move
    | otherwise = line

printLine :: String -> Int -> Int -> IO ()
printLine line window move = do
    let offset = window `div` 2 - length line `div` 2
        resizedLine = resizeLine (reverse (resizeLine (reverse line) offset)) offset
        resizedMove = resizeMove resizedLine move
    putStrLn (init resizedMove)

printRule :: [Int] -> Int -> Int -> String -> IO ()
printRule _ _ 0 _ = return ()
printRule config rule count line
    | count < 1 = do
        printLine line window move
        printRule config rule count' (chooseRule rule line)
    | otherwise = do
        printLine line window move
        printRule config rule count' (chooseRule rule line)
  where
    window = config !! 3
    move = config !! 4
    count' = count - 1
