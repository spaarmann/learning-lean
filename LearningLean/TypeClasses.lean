structure Pos where
  succ ::
  pred : Nat
deriving Repr

def Pos.plus (a : Pos) (b : Pos) : Pos :=
  Pos.succ (pred a + pred b + 1)

instance : Add Pos where
  add := Pos.plus

#eval (Pos.succ 2).plus (Pos.succ 3)
#eval (Pos.succ 2) + (Pos.succ 3)

instance : ToString Pos where
  toString a := toString (Pos.pred a + 1)

#eval s!"{(Pos.succ 2)}"
#eval s!"{(Pos.succ 2) + (Pos.succ 3)}"

instance foo : OfNat Pos (n + 1) where
  ofNat := Pos.succ n

#check foo

#eval toString (8 : Pos)
#eval toString (0 : Pos)


structure Even where
  double ::
  half : Nat

instance : Add Even where
  add a b := Even.double (a.half + b.half)

instance : ToString Even where
  toString n := toString (2 * n.half)

#eval (Even.double 2) + (Even.double 3)

instance : OfNat Even Nat.zero where
  ofNat := Even.double 0

instance [OfNat Even n] : OfNat Even (n + 2) where
  ofNat := Even.double ((OfNat.ofNat n : Even).half + 1)

#check ToString
#check Functor
#check OfNat
#check OfNat.ofNat

#eval (0 : Even)
#eval (2 : Even)
#eval (8 : Even)
#eval (1 : Even)
#eval (3 : Even)
#eval (254 : Even)
#eval (256 : Even)
