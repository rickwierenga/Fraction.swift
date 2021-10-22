fileprivate func gcd(a: Int, b: Int) -> Int {
  if b == 0 { return a }
  return gcd(a: b, b: a % b)
}

public struct Fraction {
  private(set) public var num: Int
  private(set) public var den: Int

  /// Convert fraction to string of decimal, with arbitrary precision.
  /// - Parameter accuracy: Number of decimals
  public func toDecimalString(withAccuracy accuracy: Int) -> String {
    var s = "\(num / den)."

    var remainder = (num % den) * 10
    for _ in 0..<accuracy {
      s.append(String(remainder / den))
      remainder = (remainder % den) * 10
    }

    return s
  }

  mutating public func simplify() {
    let g = gcd(a: num, b: den)
    self.num = num / g
    self.den = den / g
  }

  public func simplified() -> Fraction {
    let g = gcd(a: num, b: den)
    return Fraction(num: num / g, den: den / g)
  }
}

extension Fraction: CustomStringConvertible {
  public var description: String {
    return "\(num)/\(den)"
  }
}

extension Fraction: Comparable {
  static public func < (lhs: Fraction, rhs: Fraction) -> Bool {
    return lhs.num * rhs.den < rhs.num * lhs.den
  }

  static public func == (lhs: Fraction, rhs: Fraction) -> Bool {
    return lhs.num * rhs.den == rhs.num * lhs.den
  }
}

extension Fraction {
  static public func + (lhs: Fraction, rhs: Fraction) -> Fraction {
    return Fraction(
      num: lhs.num * rhs.den + rhs.num * lhs.den,
      den: lhs.den * rhs.den
    ).simplified()
  }

  static public func - (lhs: Fraction, rhs: Fraction) -> Fraction {
    return Fraction(
      num: lhs.num * rhs.den - rhs.num * lhs.den,
      den: lhs.den * rhs.den
    ).simplified()
  }

  static public func * (lhs: Fraction, rhs: Fraction) -> Fraction {
    return Fraction(
      num: lhs.num * rhs.num,
      den: lhs.den * rhs.den
    ).simplified()
  }

  static public func / (lhs: Fraction, rhs: Fraction) -> Fraction {
    return Fraction(
      num: lhs.num * rhs.den,
      den: lhs.den * rhs.num
    ).simplified()
  }
}
