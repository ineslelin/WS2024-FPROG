import Data.Char (isAlpha, toLower)
import System.IO
import System.Environment

data Color = Red | Black
data Tree a = Empty | Node Color (Tree a) a (Tree a)

insert :: Ord a => a -> Tree a -> Tree a
insert val tree = Node Black left x right
  where
    Node _ left x right = insertHelper val tree

insertHelper :: Ord a => a -> Tree a -> Tree a
insertHelper val Empty = Node Red Empty val Empty
insertHelper val (Node color left x right)
  | val < x   = balance color (insertHelper val left) x right
  | val > x   = balance color left x (insertHelper val right)
  | val == x  = Node color left x right

balance :: Color -> Tree a -> a -> Tree a -> Tree a
balance Black (Node Red (Node Red a x b) y c) z d = Node Red (Node Black a x b) y (Node Black c z d)
balance Black (Node Red a x (Node Red b y c)) z d = Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red (Node Red b y c) z d) = Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red b y (Node Red c z d)) = Node Red (Node Black a x b) y (Node Black c z d)
balance color left x right = Node color left x right

inOrderTraversal :: Tree a -> [a]
inOrderTraversal Empty = []
inOrderTraversal (Node _ left x right) = (inOrderTraversal left) ++ [x] ++ (inOrderTraversal right)

tokenizeText :: String -> [String]
tokenizeText content = words content

cleanText :: String -> String
cleanText = map (\string -> if isAlpha string then toLower string else ' ')

treeFromList :: Ord a => [a] -> Tree a -> Tree a
treeFromList [] tree = tree
treeFromList (x:xs) tree = treeFromList xs (insert x tree)

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

      outputFile "output.txt" sortedWords

      printToConsole "Words have been processed and saved to output.txt!"
    [] -> printToConsole "No file path provided. Usage: ./out/project /path/to/file"
    _ -> printToConsole "Too many arguments provided. Usage: ./out/project /path/to/file"