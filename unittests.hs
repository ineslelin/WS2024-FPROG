module Main where

import Test.HUnit
import RBT

testTokenize :: Test
testTokenize = TestCase (assertEqual "Should tokenize correctly" 
                            ["This", "should", "be", "tokenized"] 
                            (tokenizeText "This should be tokenized"))

testClean :: Test
testClean = TestCase (assertEqual "Should clean text" 
                        "allcaps" 
                        (cleanText "ALLCAPS"))

testInsertString :: Test
testInsertString = TestCase (assertEqual "Insert string"
                                (Node Black Empty "String" Empty)
                                (insert "String" (Empty :: Tree String)))

testInsertInt :: Test
testInsertInt = TestCase (assertEqual "Insert integer"
                              (Node Black Empty 2 Empty)
                              (insert 2 (Empty :: Tree Int)))

testTreeFromListInt :: Test
testTreeFromListInt = TestCase (assertEqual "Tree from int list"
                                      (Node Black (Node Red Empty 1 Empty) 2 (Node Red Empty 3 Empty))
                                      (treeFromList [2, 1, 3] (Empty :: Tree Int)))

testTreeFromListString :: Test
testTreeFromListString = TestCase (assertEqual "Tree from string list"
                                    (Node Black (Node Black Empty "list" Empty) "my" (Node Black Empty "treeify" Empty))
                                    (treeFromList ["treeify", "my", "list"] (Empty :: Tree String)))

testInOrderTraversalInt :: Test
testInOrderTraversalInt = TestCase (assertEqual "In order traversal int"
                                    [1, 2, 3]
                                    (inOrderTraversal (treeFromList [2, 1, 3] (Empty :: Tree Int))))

testInOrderTraversalString :: Test
testInOrderTraversalString = TestCase (assertEqual "In order traversal string"
                                    ["my","traverse","tree"]
                                    (inOrderTraversal (treeFromList ["traverse","my","tree"] (Empty :: Tree String))))

testBalanceInt :: Test
testBalanceInt = TestCase (assertEqual "Balance tree"
    (Node Red (Node Black Empty 1 Empty) 2 (Node Black Empty 3 Empty))
    (balance Black (Node Red (Node Red Empty 1 Empty) 2 Empty) 3 Empty))

testBalanceString :: Test
testBalanceString = TestCase (assertEqual "Balance tree"
    (Node Red (Node Black Empty "balance" Empty) "unbalanced" (Node Black Empty "tree" Empty))
    (balance Black (Node Red (Node Red Empty "balance" Empty) "unbalanced" Empty) "tree" Empty))

tests :: Test
tests = TestList [TestLabel "Test Tokenize" testTokenize,
                  TestLabel "Test Clean" testClean,
                  TestLabel "Test Insert String" testInsertString,
                  TestLabel "Test Insert Integer" testInsertInt,
                  TestLabel "Test Tree from int list" testTreeFromListInt,
                  TestLabel "Test Tree from string list" testTreeFromListString,
                  TestLabel "Test traversal" testInOrderTraversalInt,
                  TestLabel "Test traversal" testInOrderTraversalString,
                  TestLabel "Test balance" testBalanceInt,
                  TestLabel "Test balance" testBalanceString]

main :: IO Counts
main = runTestTT tests