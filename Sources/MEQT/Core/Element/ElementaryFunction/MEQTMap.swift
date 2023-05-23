//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

public protocol MEQTElementMap:
    MEQTExpLogPow,
    MEQTTrigonometric,
    MEQTHyperbolic,
    MEQTPolynomial,
    MEQTNaturalize,
    MEQTExtendedMap {}

public protocol MEQTExpLogPow {
    static func pow(
        _ scalar: Self,
        result: inout Self
    )
    static func exp(
        _ scalar: Self,
        result: inout Self
    )
    static func exp2(
        _ scalar: Self,
        result: inout Self
    )
    static func exmp1(
        _ scalar: Self,
        result: inout Self
    )
    static func log(
        _ scalar: Self,
        result: inout Self
    )
    static func log10(
        _ scalar: Self,
        result: inout Self
    )
    static func log2(
        _ scalar: Self,
        result: inout Self
    )
    static func log1p(
        _ scalar: Self,
        result: inout Self
    )
    static func square(
        _ scalar: Self,
        result: inout Self
    )
    static func sqrt(
        _ scalar: Self,
        result: inout Self
    )
}
public protocol MEQTTrigonometric {
    static func cos(
        _ scalar: Self,
        result: inout Self
    )
    static func sin(
        _ scalar: Self,
        result: inout Self
    )
    static func tan(
        _ scalar: Self,
        result: inout Self
    )
    static func acos(
        _ scalar: Self,
        result: inout Self
    )
    static func asin(
        _ scalar: Self,
        result: inout Self
    )
    static func atan(
        _ scalar: Self,
        result: inout Self
    )
}
public protocol MEQTHyperbolic {
    static func cosh(
        _ scalar: Self,
        result: inout Self
    )
    static func acosh(
        _ scalar: Self,
        result: inout Self
    )
    static func sinh(
        _ scalar: Self,
        result: inout Self
    )
    static func asinh(
        _ scalar: Self,
        result: inout Self
    )
    static func tanh(
        _ scalar: Self,
        result: inout Self
    )
    static func atanh(
        _ scalar: Self,
        result: inout Self
    )
}
public protocol MEQTPolynomial {
    static func evaluatePolynomial(
        usingCoefficients coefficients: UnsafePointer<Self>,
        coeffienceCount: Int
    ) -> Self
}
public protocol MEQTNaturalize {
    static func ceil(
        _ scalar: Self,
        result: inout Self
    )
    static func floor(
        _ scalar: Self,
        result: inout Self
    )
    static func nearestInteger(
        _ scalar: Self,
        result: inout Self
    )
    static func reciprocal(
        _ scalar: Self,
        result: inout Self
    )
    static func trunc(
        _ scalar: Self,
        result: inout Self
    )
}
public protocol MEQTExtendedMap {
    static func j0(
        _ scalar: Self,
        result: inout Self
    )
    static func j1(
        _ scalar: Self,
        result: inout Self
    )
    static func y0(
        _ scalar: Self,
        result: inout Self
    )
    static func y1(
        _ scalar: Self,
        result: inout Self
    )
    static func erf(
        _ scalar: Self,
        result: inout Self
    )
    static func erfc(
        _ scalar: Self,
        result: inout Self
    )
    static func tgamma(
        _ scalar: Self,
        result: inout Self
    )
    static func lgamma(
        _ scalar: Self,
        result: inout Self
    )
    static func jn (
        n: Int,
        _ scalar: Self,
        result: inout Self
    )
    static func yn (
        n: Int,
        _ scalar: Self,
        result: inout Self
    )
}
