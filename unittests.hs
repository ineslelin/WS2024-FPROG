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

-- testInsertString :: Test
-- testInsertString = TestCase (assertEqual "Insert string"
--                                 (Node Black Empty "String" Empty)
--                                 (insert "String" (Empty :: Tree String)))

-- testInsertInt :: Test
-- testInsertInt = TestCase (assertEqual "Insert integer"
--                                 (Node Black Empty 2 Empty)
--                                 (insert 2 (Empty :: Tree Integer)))

tests :: Test
tests = TestList [TestLabel "Test Tokenize" testTokenize,
                  TestLabel "Test Clean" testClean]
                --   TestLabel "Test Insert String" testInsertString,
                --   TestLabel "Test Insert Integer" testInsertInt]

main :: IO Counts
main = runTestTT tests