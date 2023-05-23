//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

// MARK: Trigonmetric
public func cos<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.cos(buffer)
}

public func cos<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.cos(buffer, result: &result)
}

public func cosPi<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.cosPi(buffer)
}

public func cosPi<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.cosPi(buffer, result: &result)
}
public func sin<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.sin(buffer)
}

public func sin<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.sin(buffer, result: &result)
}
public func sinPi<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.sinPi(buffer)
}

public func sinPi<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.sinPi(buffer, result: &result)
}
public func tan<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.tan(buffer)
}

public func tan<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.tan(buffer, result: &result)
}
public func tanPi<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.tanPi(buffer)
}

public func tanPi<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.tanPi(buffer, result: &result)
}
public func acos<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.acos(buffer)
}

public func acos<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.acos(buffer, result: &result)
}
public func asin<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.asin(buffer)
}

public func asin<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.asin(buffer, result: &result)
}
public func atan<T>(_ buffer: T) -> T where T: MEQTBufferTrigonometric {
    T.atan(buffer)
}

public func atan<T>(_ buffer: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.atan(buffer, result: &result)
}

public func atan2<T>(_ x: T, _ y: T) -> T where T: MEQTBufferTrigonometric {
    T.atan2(x, y)
}

public func atan2<T>(_ x: T, y: T, result: inout T) where T: MEQTBufferTrigonometric {
    T.atan2(x, y, result: &result)
}

public func sincos<T>(_ buffer: T, sinResult: inout T, cosResult: inout T) where T: MEQTBufferTrigonometric {
    T.sincos(buffer, sinResult: &sinResult, cosResult: &cosResult)
}

// MARK: Evaluate Polynomial
public func evaluatePolynomial<T>(
    usingCoefficients coefficients: T,
    withVariable variables: T
) -> T where T: MEQTBufferPolynomial {
    T.evaluatePolynomial(usingCoefficients: coefficients, withVariable: variables)
}

public func evaluatePolynomial<T>(
    usingCoefficients coefficients: T,
    withVariable variables: T,
    result: inout T
) where T: MEQTBufferPolynomial {
    T.evaluatePolynomial(usingCoefficients: coefficients, withVariable: variables, result: &result)
}

// MARK: Naturalize
public func ceil<T>(_ buffer: T) -> T where T: MEQTBufferNaturalize {
    T.ceil(buffer)
}
public func ceil<T>(_ buffer: T, result: inout T) where T: MEQTBufferNaturalize {
    T.ceil(buffer, result: &result)
}

public func copysign<T>(
    magnitudes: T,
    signs: T,
    result: inout T
) where T: MEQTBufferNaturalize {
    T.copysign(magnitudes: magnitudes, signs: signs, result: &result)
}

public func copysign<T>(
    magnitudes: T,
    signs: T
) -> T where T: MEQTBufferNaturalize {
    T.copysign(magnitudes: magnitudes, signs: signs)
}

public func floor<T>(_ buffer: T) -> T where T: MEQTBufferNaturalize {
    T.floor(buffer)
}

public func floor<T>(_ buffer: T, result: inout T) where T: MEQTBufferNaturalize {
    T.floor(buffer, result: &result)
}

public func nearestInteger<T>(_ buffer: T) -> T where T: MEQTBufferNaturalize {
    T.nearestInteger(buffer)
}

public func nearestInteger<T>(_ buffer: T, result: inout T) where T: MEQTBufferNaturalize {
    T.nearestInteger(buffer, result: &result)
}
public func reciprocal<T>(_ buffer: T) -> T where T: MEQTBufferNaturalize {
    T.reciprocal(buffer)
}

public func reciprocal<T>(_ buffer: T, result: inout T) where T: MEQTBufferNaturalize {
    T.reciprocal(buffer, result: &result)
}

public func remainder<T>( dividents: T, divisors: T ) -> T where T: MEQTBufferNaturalize {
    T.remainder(dividents: dividents, divisors: divisors)
}

public func remainder<T>( dividents: T, divisors: T, result: inout T) where T: MEQTBufferNaturalize {
    T.remainder(dividents: dividents, divisors: divisors, result: &result)
}

public func trunc<T>(_ buffer: T) -> T where T: MEQTBufferNaturalize {
    T.trunc(buffer)
}

public func trunc<T>(_ buffer: T, result: inout T) where T: MEQTBufferNaturalize {
    T.trunc(buffer, result: &result)
}

public func truncatingRemainder<T>( dividents: T, divisors: T ) -> T where T: MEQTBufferNaturalize {
    T.truncatingRemainder(dividents: dividents, divisors: divisors)
}

public func truncatingRemainder<T>( dividents: T, divisors: T, result: inout T) where T: MEQTBufferNaturalize {
    T.truncatingRemainder(dividents: dividents, divisors: divisors, result: &result)
}

// MARK: ExtendedMap
public func j0<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.j0(buffer)
}

public func j0<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.j0(buffer, result: &result)
}
public func j1<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.j1(buffer)
}

public func j1<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.j1(buffer, result: &result)
}
public func y0<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.y0(buffer)
}

public func y0<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.y0(buffer, result: &result)
}
public func y1<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.y1(buffer)
}

public func y1<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.y1(buffer, result: &result)
}
public func erf<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.erf(buffer)
}

public func erf<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.erf(buffer, result: &result)
}
public func erfc<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.erfc(buffer)
}

public func erfc<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.erfc(buffer, result: &result)
}
public func tgamma<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.tgamma(buffer)
}

public func tgamma<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.tgamma(buffer, result: &result)
}
public func lgamma<T>(_ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.lgamma(buffer)
}

public func lgamma<T>(_ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.lgamma(buffer, result: &result)
}
public func jn<T>(n: Int, _ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.jn(n: n, buffer)
}

public func jn<T>(n: Int, _ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.jn(n: n, buffer, result: &result)
}
public func yn<T>(n: Int, _ buffer: T) -> T where T: MEQTBufferExtendedMap{
    T.yn(n: n, buffer)
}

public func yn<T>(n: Int, _ buffer: T, result: inout T) where T: MEQTBufferExtendedMap{
    T.yn(n: n, buffer, result: &result)
}

// MARK: Hyperbolic
public func cosh<T>(_ buffer: T) -> T where T: MEQTBufferHyperbolic{
    T.cosh(buffer)
}

public func cosh<T>(_ buffer: T, result: inout T) where T: MEQTBufferHyperbolic{
    T.cosh(buffer, result: &result)
}
public func acosh<T>(_ buffer: T) -> T where T: MEQTBufferHyperbolic{
    T.acosh(buffer)
}

public func acosh<T>(_ buffer: T, result: inout T) where T: MEQTBufferHyperbolic{
    T.acosh(buffer, result: &result)
}
public func sinh<T>(_ buffer: T) -> T where T: MEQTBufferHyperbolic{
    T.sinh(buffer)
}

public func sinh<T>(_ buffer: T, result: inout T) where T: MEQTBufferHyperbolic{
    T.sinh(buffer, result: &result)
}
public func asinh<T>(_ buffer: T) -> T where T: MEQTBufferHyperbolic{
    T.asinh(buffer)
}

public func asinh<T>(_ buffer: T, result: inout T) where T: MEQTBufferHyperbolic{
    T.asinh(buffer, result: &result)
}
public func tanh<T>(_ buffer: T) -> T where T: MEQTBufferHyperbolic{
    T.tanh(buffer)
}

public func tanh<T>(_ buffer: T, result: inout T) where T: MEQTBufferHyperbolic{
    T.tanh(buffer, result: &result)
}
public func atanh<T>(_ buffer: T) -> T where T: MEQTBufferHyperbolic{
    T.atanh(buffer)
}

public func atanh<T>(_ buffer: T, result: inout T) where T: MEQTBufferHyperbolic{
    T.atanh(buffer, result: &result)
}

// MARK: ExpLogPow
public func exp<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.exp(buffer)
}

public func exp<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.exp(buffer, result: &result)
}
public func exp2<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.exp2(buffer)
}

public func exp2<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.exp2(buffer, result: &result)
}
public func expm1<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.expm1(buffer)
}

public func expm1<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.expm1(buffer, result: &result)
}
public func log<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.log(buffer)
}

public func log<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.log(buffer, result: &result)
}
public func log10<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.log10(buffer)
}

public func log10<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.log10(buffer, result: &result)
}
public func log2<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.log2(buffer)
}

public func log2<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.log2(buffer, result: &result)
}
public func log1p<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.log1p(buffer)
}

public func log1p<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.log1p(buffer, result: &result)
}
public func square<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.square(buffer)
}

public func square<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.square(buffer, result: &result)
}
public func sqrt<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.sqrt(buffer)
}

public func sqrt<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.sqrt(buffer, result: &result)
}
public func rsqrt<T>(_ buffer: T) -> T where T: MEQTBufferExpLogPow{
    T.rsqrt(buffer)
}

public func rsqrt<T>(_ buffer: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.rsqrt(buffer, result: &result)
}
public func pw<T>(base: T, exponent: T) -> T where T: MEQTBufferExpLogPow{
    T.pow(base: base, exponent: exponent)
}

public func pow<T>(base: T, exponent: T, result: inout T) where T: MEQTBufferExpLogPow{
    T.pow(base: base, exponent: exponent,  result: &result)
}

// MARK: Absolute
public func absolute<T>(_ buffer: T) -> T where T: MEQTBufferAbsolute{
    T.absolute(buffer)
}

public func absolute<T>(_ buffer: T, result: inout T) where T: MEQTBufferAbsolute{
    T.absolute(buffer, result: &result)
}
public func negative<T>(_ buffer: T) -> T where T: MEQTBufferAbsolute{
    T.negative(buffer)
}

public func negative<T>(_ buffer: T, result: inout T) where T: MEQTBufferAbsolute{
    T.negative(buffer, result: &result)
}
public func negativeAbsolute<T>(_ buffer: T) -> T where T: MEQTBufferAbsolute{
    T.negativeAbsolute(buffer)
}

//: Clip, limit and threshold
public func negativeAbsolute<T>(_ buffer: T, result: inout T) where T: MEQTBufferAbsolute{
    T.negativeAbsolute(buffer, result: &result)
}

public func clip<T>(_ buffer: T, to: ClosedRange<T.Element>) -> T where T: MEQTBufferClipping {
    T.clip(buffer, to: to)
}

public func clip<T>(_ buffer: T, to: ClosedRange<T.Element>, result: inout T) where T: MEQTBufferClipping {
    T.clip(buffer, to: to, result: &result)
}
public func invertedClip<T>(_ buffer: T, to: ClosedRange<T.Element>) -> T where T: MEQTBufferClipping {
    T.invertedClip(buffer, to: to)
}

public func invertedClip<T>(_ buffer: T, to: ClosedRange<T.Element>, result: inout T) where T: MEQTBufferClipping {
    T.invertedClip(buffer, to: to, result: &result)
}

public func limit<T>(_ buffer: T, limit: T.Element, withOutputConstant: T.Element) -> T where T: MEQTBufferClipping {
    T.limit(buffer, limit: limit, withOutputConstant: withOutputConstant)
}


public func limit<T>(_ buffer: T, limit: T.Element, withOutputConstant: T.Element, result: inout T) where T: MEQTBufferClipping {
    T.limit(buffer, limit: limit, withOutputConstant: withOutputConstant, result: &result)
}


public func threshold<T>(
    _ buffer: T,
    to lowerBound: T.Element,
    with rule: ThresholdRule<T.Element>,
    result: inout T
) where T: MEQTBufferClipping {
    T.threshold(buffer, to: lowerBound, with: rule, result: &result)
}

public func threshold<T>(
    _ buffer: T,
    to lowerBound: T.Element,
    with rule: ThresholdRule<T.Element>
) -> T where T: MEQTBufferClipping {
    T.threshold(buffer, to: lowerBound, with: rule)
}



