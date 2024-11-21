import Data.Char (isAlpha, toLower)
import Data.List (nub, sort)
import Control.Parallel.Strategies (parList, rdeepseq, using)
import System.IO

data Color = Red | Black deriving (Show, Eq)
data Tree a = Empty
            | Node Color (Tree a) a (Tree a)
            deriving (Show)

-- Red-Black Tree Functions
makeRed :: a -> Tree a -> Tree a -> Tree a
makeRed val left right = Node Red left val right

makeBlack :: a -> Tree a -> Tree a -> Tree a
makeBlack val left right = Node Black left val right

insert :: Ord a => a -> Tree a -> Tree a
insert val tree = makeBlack rootVal leftTree rightTree
  where
    Node _ leftTree rootVal rightTree = insertHelper val tree

insertHelper :: Ord a => a -> Tree a -> Tree a
insertHelper val Empty = makeRed val Empty Empty
insertHelper val (Node color left x right)
  | val < x   = balance color (insertHelper val left) x right
  | val > x   = balance color left x (insertHelper val right)
  | otherwise = Node color left x right

balance :: Color -> Tree a -> a -> Tree a -> Tree a
balance Black (Node Red (Node Red a x b) y c) z d = Node Red (Node Black a x b) y (Node Black c z d)
balance Black (Node Red a x (Node Red b y c)) z d = Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red (Node Red b y c) z d) = Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red b y (Node Red c z d)) = Node Red (Node Black a x b) y (Node Black c z d)
balance color left x right = Node color left x right

inOrderTraversal :: Tree a -> [a]
inOrderTraversal Empty = []
inOrderTraversal (Node _ left x right) = inOrderTraversal left ++ [x] ++ inOrderTraversal right

-- Tokenize and clean text in parallel
tokenizeText :: String -> [String]
tokenizeText content = (nub . sort $ words content) `using` parList rdeepseq

cleanText :: String -> String
cleanText = map (\c -> if isAlpha c then toLower c else ' ')

-- Main program
main :: IO ()
main = do
  -- Step 1: Read the input file
  input <- readFile "input.txt"

  -- Step 2: Tokenize and clean text in parallel
  let cleanedInput = cleanText input
  let wordsList = tokenizeText cleanedInput

  -- Step 3: Insert words into the Red-Black Tree
  let tree = foldr insert Empty wordsList

  -- Step 4: Perform an in-order traversal to get sorted words
  let sortedWords = inOrderTraversal tree

  -- Step 5: Write the sorted words to a new file
  writeFile "output.txt" (unlines sortedWords)

  putStrLn "Words have been processed and saved to output.txt!"
