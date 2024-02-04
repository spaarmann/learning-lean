#eval 1 + 2
#eval (1 + 2 : Nat)
#eval (1 - 2 : Int)
#check (1 - 2 : Int)

def hello : String := "Hello"

def add1 (n : Nat) : Nat := n + 1
#check add1
#check (add1)

def Str : Type := String

def Natural : Type := Nat
def twoNatural : Natural := 2
def twoNatural2 : Natural := (2 : Nat)
abbrev AbbrNat : Type := Nat
def twoAbbrNat : AbbrNat := 2

structure Point where
  x : Float
  y : Float
deriving Repr -- Repr is sort of like Show in Haskell

def origin : Point := { x:= 0.0, y := 0.0 }
#eval origin

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

#check ({ x := 0.0, y := 0.0 } : Point)
#check { x := 0.0, y := 0.0 : Point}

def zeroX (p : Point) : Point := { p with x := 0 }
