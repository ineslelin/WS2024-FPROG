module Unittests where

import Test.HUnit
import Main

testTokenize :: Test
testTokenize = TestCase (assertEqual ["this", "should", "be", "tokenized"] (tokenizeText "This should be tokenized"))

main :: IO Counts
main = runTestTT tests