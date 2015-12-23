module Verdict
    (

    -- * Essentials
      Validated
    , Verdict(..)
    , VPred
    , VPred'
    , validate
    , getVal
    {-, coerceVal-}
    {-, unsafeCoerceVal-}
    {-, unsafeValidated-}
    {-, validateEmpty-}
    , check
    {-, checkWith-}
    {-, isValid-}
    , safeCoerce
    , HaskVerdict(..)
    , Implies
    , Implies'
    , KnownVal(..)
    , (|.)

    -- * Verdict Terms
    , (:&&)
    , (:||)
    , Not
    , Minimum
    , Maximum
    , MaxLength
    , MinLength
    , Length
    , MultipleOf
    , HasElem

    -- * Errors
    , ErrorTree
    , ErrorTree'(..)
    , Failure(..)
    , ApplicativeError(..)
    ) where

import           Verdict.Class
import           Verdict.Failure
import           Verdict.Logic
import           Verdict.Types
import           Verdict.Val
