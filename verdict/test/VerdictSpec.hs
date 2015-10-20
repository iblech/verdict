module VerdictSpec (spec) where

import Data.Either
import Test.Hspec
import Verdict

spec :: Spec
spec = describe "Verdict" $ do
    maximumSpec
    minimumSpec
    maxLengthSpec
    minLengthSpec
    lengthSpec
    multipleOfSpec

maximumSpec :: Spec
maximumSpec = describe "Maximum" $ do

  it "rejects larger values" $ do
    (val 5 :: Either ErrorTree (Validated (Maximum 3) Integer))
        `shouldSatisfy` isLeft

  it "accepts smaller values" $ do
    (val 3 :: Either ErrorTree (Validated (Maximum 5) Integer))
        `shouldSatisfy` isRight

  it "accepts equal sized values" $ do
    (val 3 :: Either ErrorTree (Validated (Maximum 3) Integer))
        `shouldSatisfy` isRight

minimumSpec :: Spec
minimumSpec = describe "Minimum" $ do

  it "rejects smaller values" $ do
    (val 3 :: Either ErrorTree (Validated (Minimum 5) Integer))
        `shouldSatisfy` isLeft

  it "accepts larger values" $ do
    (val 5 :: Either ErrorTree (Validated (Minimum 3) Integer))
        `shouldSatisfy` isRight

  it "accepts equal sized values" $ do
    (val 3 :: Either ErrorTree (Validated (Minimum 3) Integer))
        `shouldSatisfy` isRight

maxLengthSpec :: Spec
maxLengthSpec = describe "MaxLength" $ do

  it "rejects longer values" $ do
    (val [(),()] :: Either ErrorTree (Validated (MaxLength 1) [()]))
        `shouldSatisfy` isLeft

  it "accepts shorter values" $ do
    (val [()] :: Either ErrorTree (Validated (MaxLength 3) [()]))
        `shouldSatisfy` isRight

  it "accepts equal sized values" $ do
    (val [()] :: Either ErrorTree (Validated (MaxLength 1) [()]))
        `shouldSatisfy` isRight

minLengthSpec :: Spec
minLengthSpec = describe "MinLength" $ do

  it "rejects shorter values" $ do
    (val [()] :: Either ErrorTree (Validated (MinLength 2) [()]))
        `shouldSatisfy` isLeft

  it "accepts shorter values" $ do
    (val [(), ()] :: Either ErrorTree (Validated (MinLength 1) [()]))
        `shouldSatisfy` isRight

  it "accepts equal sized values" $ do
    (val [()] :: Either ErrorTree (Validated (MinLength 1) [()]))
        `shouldSatisfy` isRight

lengthSpec :: Spec
lengthSpec = describe "Length" $ do

  it "rejects differing lengths" $ do
    (val [()] :: Either ErrorTree (Validated (Length 2) [()]))
        `shouldSatisfy` isLeft

  it "accepts matching lengths" $ do
    (val [()] :: Either ErrorTree (Validated (Length 1) [()]))
        `shouldSatisfy` isRight

multipleOfSpec :: Spec
multipleOfSpec = describe "MultipleOf" $ do

  it "rejects non-multiples" $ do
    (val 5 :: Either ErrorTree (Validated (MultipleOf 2) Integer))
        `shouldSatisfy` isLeft

  it "accepts multiples" $ do
    (val 4 :: Either ErrorTree (Validated (MultipleOf 2) Integer))
        `shouldSatisfy` isRight