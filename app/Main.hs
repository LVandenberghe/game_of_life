-- EPITECH PROJECT, 2024
-- B-FUN-400-REN-4-1-wolfram-ludwig.vandenberghe
-- File description:
-- Main

import System.Environment (getArgs)
import System.Exit (exitSuccess, exitWith, ExitCode(ExitFailure))
import System.IO (hPutStrLn, stderr)
import Data.Maybe
import Data.Maybe (fromJust)

import Rule
import Print


data Conf = ConfC {
    rule :: Int,
    start :: Maybe Int,
    line :: Maybe Int,
    window :: Maybe Int,
    move :: Maybe Int
} deriving Show

defaultConf :: Conf
defaultConf = ConfC {
    rule = 0,
    start = Just 0,
    line = Just (-1),
    window = Just 80,
    move = Just 0
}

printHelp :: IO ()
printHelp = putStrLn "USAGE:\n\t./wolfram --rule value [--start value]\
                    \ [--lines value] [--window value] [--move value]\n\
                    \\n--rule\t:\tselect the rule to apply\n--start\t:\t\
                    \the first line of the generation to display\n--lines\
                    \\t:\tthe number of lines to display\n--window:\tthe \
                    \size of the display window\n--move\t:\ttranslation \
                    \to apply to the window (right if positive, \
                    \left if negative)"

getOpts :: Conf -> [String] -> Maybe Conf
getOpts conf [] = Just conf
getOpts conf (x:xs) = case x of
    "--rule" -> getOpts (conf {rule = read (head xs)}) (tail xs)
    "--start" -> getOpts (conf {start = Just (read (head xs))}) (tail xs)
    "--lines" -> getOpts (conf {line = Just (read (head xs))}) (tail xs)
    "--window" -> getOpts (conf {window = Just (read (head xs))}) (tail xs)
    "--move" -> getOpts (conf {move = Just (read (head xs))}) (tail xs)
    _ -> Nothing

errorMsg :: String -> IO a
errorMsg error = do
    hPutStrLn stderr ("Error: " ++ error)
    exitWith (ExitFailure 84)

checkRule :: Int -> IO ()
checkRule rule
    | rule `elem` [30, 90, 110] = return ()
    | rule > 255 || rule < 0 = errorMsg "This rule does not exist"
    | otherwise = errorMsg "Not supported."

checkOptions :: Conf -> IO ()
checkOptions (ConfC r s l w m)
    | isNothing s || isNothing l || isNothing w || isNothing m = errorMsg "Invalid value"
    | otherwise = return ()

main :: IO ()
main = do
    args <- getArgs
    if "--help" `elem` args
        then printHelp >> exitSuccess
        else do
            let conf = getOpts defaultConf args
            case conf of
                Just configRule -> do
                    checkOptions configRule
                    checkRule (rule configRule)
                    let outputRule = setRule (rule configRule) (fromJust (start configRule)) "  *  "
                    printRule [rule configRule, fromJust (start configRule), fromJust (line configRule), fromJust (window configRule), fromJust (move configRule)] (rule configRule) (fromJust (line configRule)) outputRule

                    exitSuccess
                Nothing -> errorMsg "Failed to parse options."

