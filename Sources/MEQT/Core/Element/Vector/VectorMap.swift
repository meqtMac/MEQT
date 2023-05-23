//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//
//MARK: (Vector) -> Vector, iter
public protocol VectorMap :
    VectorTrigonometric,
    VectorPolynomial,
    VectorNaturalize,
    VectorExtendedMap,
    VectorHyperbolic,
    VectorExpLogPow,
    VectorAbsolute,
    VectorClipping {}

public protocol VectorTrigonometric {
    static func cos(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func cosPi(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func sin(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func sinPi(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func tan(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func tanPi(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    
    static func acos(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func asin(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func atan(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func atan2(
        _ x: UnsafePointer<Self>,
        _ y: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func sincos(
        _ vector: UnsafePointer<Self>,
        sinResult: UnsafeMutablePointer<Self>,
        cosResult: UnsafeMutablePointer<Self>,
        count: Int
    )
}
//TODO: Polynomial
public protocol VectorPolynomial {
    static func evaluatePolynomial(
        usingCoefficients coefficients: UnsafePointer<Self>,
        coeffienceCount: Int,
        withVariables variables: UnsafePointer<Self>,
        variableCount: Int,
        result: UnsafeMutablePointer<Self>
    )
}
public protocol VectorNaturalize {
    static func ceil(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func copysign(
        magnitudes: UnsafePointer<Self>,
        signs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func floor(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func nearestInteger(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func reciprocal(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func remainder(
        dividends: UnsafePointer<Self>,
        divisors: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func trunc(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func truncatingRemainder(
        dividends: UnsafePointer<Self>,
        divisors: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorExtendedMap {
    static func j0(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func j1(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func y0(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func y1(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func erf(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func erfc(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func tgamma(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func lgamma(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func jn (
        n: Int,
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func yn (
        n: Int,
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorHyperbolic {
    static func cosh(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func acosh(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func sinh(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func asinh(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func tanh(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func atanh(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorExpLogPow {
    static func pow(
        base: UnsafePointer<Self>,
        exponents: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func exp(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func exp2(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func expm1(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func log(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func log10(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func log2(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func log1p(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func square(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func rsqrt(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func sqrt(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
//TODO: Absolute & negative
public protocol VectorAbsolute {
//    var count: Int { get }
    static func absolute(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func negative(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func negativeAbsolute(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
//TODO: clip, limit and threshold
public protocol VectorClipping: Comparable {
    static func clip(
        _ vector: UnsafePointer<Self>,
        to: ClosedRange<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func invertedClip(
        _ vector: UnsafePointer<Self>,
        to: ClosedRange<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func limit(
        _ vector: UnsafePointer<Self>,
        limit: Self,
        withOutputConstant: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func threshold(
        _ vector: UnsafePointer<Self>,
        to lowerBound: Self,
        with rule: ThresholdRule<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
