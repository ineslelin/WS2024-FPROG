module Main where

import RBT
import System.IO
import System.Environment

inputFile :: FilePath -> IO String
inputFile path = readFile path

outputFile :: FilePath -> [String] -> IO ()
outputFile path contents = writeFile path (unlines contents)

printToConsole :: String -> IO ()
printToConsole msg = 
  putStrLn msg

main = do
  args <- getArgs

  case args of 
    [path] -> do
      contents <- inputFile path
      let cleanedInput = cleanText contents
      let wordsList = tokenizeText cleanedInput

      let tree = treeFromList wordsList Empty

      let sortedWords = inOrderTraversal tree

      outputFile "./txt/output.txt" sortedWords

      printToConsole "Words have been processed and saved to output.txt!"
    [] -> printToConsole "No file path provided. Usage: ./out/project /path/to/file"
    _ -> printToConsole "Too many arguments provided. Usage: ./out/project /path/to/file"