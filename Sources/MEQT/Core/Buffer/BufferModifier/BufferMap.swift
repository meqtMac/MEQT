//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/20.
//

/// Buffer-Oriented Map Functions
public protocol MEQTBufferMap:
    MEQTBufferTrigonometric,
    MEQTBufferPolynomial,
    MEQTBufferNaturalize,
    MEQTBufferExtendedMap,
    MEQTBufferHyperbolic,
    MEQTBufferExpLogPow,
    MEQTBufferAbsolute,
    MEQTBufferClipping {}

/// Buffer-Oriented Trigonmetric Functions
public protocol MEQTBufferTrigonometric: MEQTUnsafeBuffer {
    static func cos(_ buffer: Self) -> Self
    static func cos(_ buffer: Self, result: inout Self)
    static func cosPi(_ buffer: Self) -> Self
    static func cosPi(_ buffer: Self, result: inout Self)
    static func sin(_ buffer: Self) -> Self
    static func sin(_ buffer: Self, result: inout Self)
    static func sinPi(_ buffer: Self) -> Self
    static func sinPi(_ buffer: Self, result: inout Self)
    static func tan(_ buffer: Self) -> Self
    static func tan(_ buffer: Self, result: inout Self)
    static func tanPi(_ buffer: Self) -> Self
    static func tanPi(_ buffer: Self, result: inout Self)
    static func acos(_ buffer: Self) -> Self
    static func acos(_ buffer: Self, result: inout Self)
    static func asin(_ buffer: Self) -> Self
    static func asin(_ buffer: Self, result: inout Self)
    static func atan(_ buffer: Self) -> Self
    static func atan(_ buffer: Self, result: inout Self)
    ///  arctan of `y / x`
    static func atan2(
        _ x: Self,
        _ y: Self
    ) -> Self
    static func atan2(
        _ x: Self,
        _ y: Self,
        result: inout Self
    )
    static func sincos(
        _ buffer: Self,
        sinResult: inout Self,
        cosResult: inout Self
    )
}

public extension MEQTBufferTrigonometric where Element: VectorTrigonometric {
    static func cos(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.cos(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func cos(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.cos(buffer.data, result: &result.data, count: buffer.count)
    }
    static func cosPi(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.cosPi(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func cosPi(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.cosPi(buffer.data, result: &result.data, count: buffer.count)
    }
    static func sin(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.sin(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func sin(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.sin(buffer.data, result: &result.data, count: buffer.count)
    }
    static func sinPi(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.sinPi(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func sinPi(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.sinPi(buffer.data, result: &result.data, count: buffer.count)
    }
    static func tan(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.tan(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func tan(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.tan(buffer.data, result: &result.data, count: buffer.count)
    }
    static func tanPi(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.tanPi(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func tanPi(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.tanPi(buffer.data, result: &result.data, count: buffer.count)
    }
    static func acos(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.acos(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func acos(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.acos(buffer.data, result: &result.data, count: buffer.count)
    }
    static func asin(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.asin(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func asin(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.asin(buffer.data, result: &result.data, count: buffer.count)
    }
    static func atan(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.atan(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func atan(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.atan(buffer.data, result: &result.data, count: buffer.count)
    }
    
    ///  arctan of `y / x`
    static func atan2(
        _ x: Self,
        _ y: Self
    ) -> Self {
        precondition(x.count == y.count, "x and y must be of same size")
        var result = x.shapeClone()
        Element.atan2(x.data, y.data, result: &result.data, count: x.count)
        return result
    }
    
    static func atan2(
        _ x: Self,
        _ y: Self,
        result: inout Self
    ) {
        precondition(result.count == x.count && result.count == y.count, "three buffer must be of same size")
        Element.atan2(x.data, y.data, result: &result.data, count: x.count)
    }
    static func sincos(
        _ buffer: Self,
        sinResult: inout Self,
        cosResult: inout Self
    ) {
        precondition(buffer.count == sinResult.count && buffer.count == cosResult.count, "three buffer must be of same size")
        Element.sincos(buffer.data, sinResult: &sinResult.data, cosResult: &cosResult.data, count: buffer.count)
    }
}
/// Buffer-Oriented Polynomial Evaluation
public protocol MEQTBufferPolynomial: MEQTUnsafeBuffer {
    static func evaluatePolynomial(
        usingCoefficients coefficients: Self,
        withVariable variables: Self
    ) -> Self
    static func evaluatePolynomial(
        usingCoefficients coefficients: Self,
        withVariable variables: Self,
        result: inout Self
    )
}

public extension MEQTBufferPolynomial where Element: VectorPolynomial {
    static func evaluatePolynomial(
        usingCoefficients coefficients: Self,
        withVariable variables: Self
    ) -> Self {
        var result = variables.shapeClone()
        Element.evaluatePolynomial(
            usingCoefficients: coefficients.data,
            coeffienceCount: coefficients.count,
            withVariables: variables.data,
            variableCount: variables.count,
            result: &result.data)
        return result
    }
    static func evaluatePolynomial(
        usingCoefficients coefficients: Self,
        withVariable variables: Self,
        result: inout Self
    ) {
        precondition(result.count == variables.count, "variable and result must be of same size")
        Element.evaluatePolynomial(
            usingCoefficients: coefficients.data,
            coeffienceCount: coefficients.count,
            withVariables: variables.data,
            variableCount: variables.count,
            result: &result.data)
    }
}

public protocol MEQTBufferNaturalize: MEQTUnsafeBuffer {
    static func ceil(_ buffer: Self) -> Self
    static func ceil(_ buffer: Self, result: inout Self)
    static func copysign(
        magnitudes: Self,
        signs: Self,
        result: inout Self
    )
    static func copysign(
        magnitudes: Self,
        signs: Self
    ) -> Self
    static func floor(_ buffer: Self) -> Self
    static func floor(_ buffer: Self, result: inout Self)
    static func nearestInteger(_ buffer: Self) -> Self
    static func nearestInteger(_ buffer: Self, result: inout Self)
    static func reciprocal(_ buffer: Self) -> Self
    static func reciprocal(_ buffer: Self, result: inout Self)
    static func remainder(dividents: Self, divisors: Self) -> Self
    static func remainder(dividents: Self, divisors: Self, result: inout Self)
    static func trunc(_ buffer: Self) -> Self
    static func trunc(_ buffer: Self, result: inout Self)
    static func truncatingRemainder( dividents: Self, divisors: Self ) -> Self
    static func truncatingRemainder( dividents: Self, divisors: Self, result: inout Self)
}

public extension MEQTBufferNaturalize where Element: VectorNaturalize {
    static func ceil(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.ceil(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func ceil(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.ceil(buffer.data, result: &result.data, count: buffer.count)
    }
    static func copysign(magnitudes: Self, signs: Self, result: inout Self) {
        precondition(result.count == magnitudes.count && result.count == signs.count, "input must be of same size")
        Element.copysign(magnitudes: magnitudes.data, signs: signs.data, result: &result.data, count: magnitudes.count)
    }
    
    static func copysign(magnitudes: Self, signs: Self) -> Self {
        precondition(magnitudes.count == signs.count, "input must be of same size.")
        var result = signs.shapeClone()
        Element.copysign(
            magnitudes: magnitudes.data,
            signs: signs.data,
            result: &result.data,
            count: result.count)
        return result
    }
    
    static func floor(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.floor(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func floor(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.floor(buffer.data, result: &result.data, count: buffer.count)
    }
    static func nearestInteger(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.nearestInteger(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func nearestInteger(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.nearestInteger(buffer.data, result: &result.data, count: buffer.count)
    }
    static func reciprocal(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.reciprocal(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func reciprocal(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.reciprocal(buffer.data, result: &result.data, count: buffer.count)
    }
    static func remainder(dividents: Self, divisors: Self) -> Self {
        precondition(dividents.count == divisors.count, "input must be of same size.")
        var result = dividents.shapeClone()
        Element.remainder(dividends: dividents.data,
                          divisors: divisors.data,
                          result: &result.data,
                          count: dividents.count)
        return result
    }
    
    static func remainder(dividents: Self, divisors: Self, result: inout Self) {
        precondition(dividents.count == result.count && divisors.count == result.count, "buffer and result must be of same size.")
        Element.remainder(dividends: dividents.data,
                          divisors: divisors.data,
                          result: &result.data,
                          count: dividents.count)
    }
    
    
    static func trunc(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.trunc(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func trunc(_ buffer: Self, result: inout Self) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.trunc(buffer.data, result: &result.data, count: buffer.count)
    }
    
    
    static func truncatingRemainder(dividents: Self, divisors: Self, result: inout Self) {
        precondition(dividents.count == result.count && divisors.count == result.count, "buffer and result must be of same size.")
        Element.truncatingRemainder(dividends: dividents.data,
                                    divisors: divisors.data,
                                    result: &result.data,
                                    count: dividents.count)
    }
    
    static func truncatingRemainder( dividents: Self, divisors: Self) -> Self {
        precondition(dividents.count == divisors.count, "input must be of same size.")
        var result = dividents.shapeClone()
        Element.truncatingRemainder(dividends: dividents.data,
                                    divisors: divisors.data,
                                    result: &result.data,
                                    count: dividents.count)
        return result
    }
    
}

/// Buffer-Oriented special functions
public protocol MEQTBufferExtendedMap: MEQTUnsafeBuffer {
    static func j0(
        _ buffer: Self
    ) -> Self
    static func j0(
        _ buffer: Self,
        result: inout Self
    )
    static func j1(
        _ buffer: Self
    ) -> Self
    static func j1(
        _ buffer: Self,
        result: inout Self
    )
    static func jn(
        n: Int,
        _ buffer: Self
    ) -> Self
    static func jn(
        n: Int,
        _ buffer: Self,
        result: inout Self
    )
    static func y0(
        _ buffer: Self
    ) -> Self
    static func y0(
        _ buffer: Self,
        result: inout Self
    )
    static func y1(
        _ buffer: Self
    ) -> Self
    static func y1(
        _ buffer: Self,
        result: inout Self
    )
    static func yn(
        n: Int,
        _ buffer: Self
    ) -> Self
    static func yn(
        n: Int,
        _ buffer: Self,
        result: inout Self
    )
    static func erf(
        _ buffer: Self
    ) -> Self
    static func erf(
        _ buffer: Self,
        result: inout Self
    )
    static func erfc(
        _ buffer: Self
    ) -> Self
    static func erfc(
        _ buffer: Self,
        result: inout Self
    )
    static func tgamma(
        _ buffer: Self
    ) -> Self
    static func tgamma(
        _ buffer: Self,
        result: inout Self
    )
    static func lgamma(
        _ buffer: Self
    ) -> Self
    static func lgamma(
        _ buffer: Self,
        result: inout Self
    )
}
public extension MEQTBufferExtendedMap where Element: VectorExtendedMap {
    static func j0(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.j0(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func j0(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.j0(buffer.data, result: &result.data, count: buffer.count)
    }
    static func j1(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.j1(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func j1(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.j1(buffer.data, result: &result.data, count: buffer.count)
    }
    static func jn(
        n: Int,
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.jn(n: n, buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func jn(
        n: Int,
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.jn(n: n, buffer.data, result: &result.data, count: buffer.count)
    }
    static func y0(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.y0(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func y0(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.y0(buffer.data, result: &result.data, count: buffer.count)
    }
    static func y1(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.y1(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func y1(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.y1(buffer.data, result: &result.data, count: buffer.count)
    }
    static func yn(
        n: Int,
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.yn(n: n, buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func yn(
        n: Int,
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.yn(n: n, buffer.data, result: &result.data, count: buffer.count)
    }
    static func erf(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.erf(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func erf(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.erf(buffer.data, result: &result.data, count: buffer.count)
    }
    static func erfc(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.erfc(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func erfc(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.erfc(buffer.data, result: &result.data, count: buffer.count)
    }
    static func tgamma(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.tgamma(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func tgamma(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.tgamma(buffer.data, result: &result.data, count: buffer.count)
    }
    static func lgamma(
        _ buffer: Self
    ) -> Self {
        var result = buffer.shapeClone()
        Element.lgamma(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    
    static func lgamma(
        _ buffer: Self,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.lgamma(buffer.data, result: &result.data, count: buffer.count)
    }
}
/// Buffer Hyperbolic functions
public protocol MEQTBufferHyperbolic: MEQTUnsafeBuffer {
    static func cosh(
        _ buffer: Self
    ) -> Self
    static func cosh(
        _ buffer: Self,
        result: inout Self
    )
    static func acosh(
        _ buffer: Self
    ) -> Self
    static func acosh(
        _ buffer: Self,
        result: inout Self
    )
    static func sinh(
        _ buffer: Self
    ) -> Self
    static func sinh(
        _ buffer: Self,
        result: inout Self
    )
    static func asinh(
        _ buffer: Self
    ) -> Self
    static func asinh(
        _ buffer: Self,
        result: inout Self
    )
    static func tanh(
        _ buffer: Self
    ) -> Self
    static func tanh(
        _ buffer: Self,
        result: inout Self
    )
    static func atanh(
        _ buffer: Self
    ) -> Self
    static func atanh(
        _ buffer: Self,
        result: inout Self
    )
    
}
public extension MEQTBufferHyperbolic where Element: VectorHyperbolic {
    static func cosh( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.cosh(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func cosh( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.cosh(buffer.data, result: &result.data, count: buffer.count)
    }
    static func acosh( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.acosh(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func acosh( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.acosh(buffer.data, result: &result.data, count: buffer.count)
    }
    static func sinh( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.sinh(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func sinh( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.sinh(buffer.data, result: &result.data, count: buffer.count)
    }
    static func asinh( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.asinh(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func asinh( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.asinh(buffer.data, result: &result.data, count: buffer.count)
    }
    static func tanh( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.tanh(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func tanh( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.tanh(buffer.data, result: &result.data, count: buffer.count)
    }
    static func atanh( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.atanh(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func atanh( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.atanh(buffer.data, result: &result.data, count: buffer.count)
    }
    
}
/// Buffer-Oriented Expontential, Logarithmic, and Power
public protocol MEQTBufferExpLogPow: MEQTUnsafeBuffer {
    static func pow(
        base: Self,
        exponent: Self
    ) -> Self
    static func pow(
        base: Self,
        exponent: Self,
        result: inout Self
    )
    static func exp(
        _ buffer: Self
    ) -> Self
    static func exp(
        _ buffer: Self,
        result: inout Self
    )
    static func exp2(
        _ buffer: Self
    ) -> Self
    static func exp2(
        _ buffer: Self,
        result: inout Self
    )
    static func expm1(
        _ buffer: Self
    ) -> Self
    static func expm1(
        _ buffer: Self,
        result: inout Self
    )
    static func log(
        _ buffer: Self
    ) -> Self
    static func log(
        _ buffer: Self,
        result: inout Self
    )
    static func log10(
        _ buffer: Self
    ) -> Self
    static func log10(
        _ buffer: Self,
        result: inout Self
    )
    static func log2(
        _ buffer: Self
    ) -> Self
    static func log2(
        _ buffer: Self,
        result: inout Self
    )
    static func log1p(
        _ buffer: Self
    ) -> Self
    static func log1p(
        _ buffer: Self,
        result: inout Self
    )
    static func square(
        _ buffer: Self
    ) -> Self
    static func square(
        _ buffer: Self,
        result: inout Self
    )
    static func rsqrt(
        _ buffer: Self
    ) -> Self
    static func rsqrt(
        _ buffer: Self,
        result: inout Self
    )
    static func sqrt(
        _ buffer: Self
    ) -> Self
    static func sqrt(
        _ buffer: Self,
        result: inout Self
    )
}

public extension MEQTBufferExpLogPow where Element: VectorExpLogPow {
    static func pow(
        base: Self,
        exponent: Self
    ) -> Self {
        precondition(base.count == exponent.count, "base and exponents must be of same size.")
        var result = base.shapeClone()
        Element.pow(base: base.data, exponents: exponent.data, result: &result.data, count: result.count)
        return result
    }
    static func pow(
        base: Self,
        exponent: Self,
        result: inout Self
    ) {
        precondition(base.count == exponent.count && base.count == result.count, "base, exponent and result must be of same size.")
        Element.pow(base: base.data, exponents: exponent.data, result: &result.data, count: result.count)
    }
    static func exp( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.exp(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func exp( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.exp(buffer.data, result: &result.data, count: buffer.count)
    }
    static func exp2( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.exp2(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func exp2( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.exp2(buffer.data, result: &result.data, count: buffer.count)
    }
    static func expm1( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.expm1(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func expm1( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.expm1(buffer.data, result: &result.data, count: buffer.count)
    }
    static func log( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.log(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func log( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.log(buffer.data, result: &result.data, count: buffer.count)
    }
    static func log10( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.log10(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func log10( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.log10(buffer.data, result: &result.data, count: buffer.count)
    }
    static func log2( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.log2(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func log2( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.log2(buffer.data, result: &result.data, count: buffer.count)
    }
    static func log1p( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.log1p(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func log1p( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.log1p(buffer.data, result: &result.data, count: buffer.count)
    }
    static func square( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.square(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func square( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.square(buffer.data, result: &result.data, count: buffer.count)
    }
    static func rsqrt( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.rsqrt(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func rsqrt( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.rsqrt(buffer.data, result: &result.data, count: buffer.count)
    }
    static func sqrt( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.sqrt(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func sqrt( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.sqrt(buffer.data, result: &result.data, count: buffer.count)
    }
}

/// Buffer-Oriented Absoulte and negative functions
public protocol MEQTBufferAbsolute: MEQTUnsafeBuffer {
    static func absolute(
        _ buffer: Self
    ) -> Self
    static func absolute(
        _ buffer: Self,
        result: inout Self
    )
    static func negative(
        _ buffer: Self
    ) -> Self
    static func negative(
        _ buffer: Self,
        result: inout Self
    )
    static func negativeAbsolute(
        _ buffer: Self
    ) -> Self
    static func negativeAbsolute(
        _ buffer: Self,
        result: inout Self
    )
}

public extension MEQTBufferAbsolute where Element: VectorAbsolute {
    static func absolute( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.absolute(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func absolute( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.absolute(buffer.data, result: &result.data, count: buffer.count)
    }
    static func negative( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.negative(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func negative( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.negative(buffer.data, result: &result.data, count: buffer.count)
    }
    static func negativeAbsolute( _ buffer: Self ) -> Self {
        var result = buffer.shapeClone()
        Element.negativeAbsolute(buffer.data, result: &result.data, count: buffer.count)
        return result
    }
    static func negativeAbsolute( _ buffer: Self, result: inout Self ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.negativeAbsolute(buffer.data, result: &result.data, count: buffer.count)
    }
    
}

/// Buffer-Oriented Clipping, Limit and Threshold Operations
public protocol MEQTBufferClipping: MEQTUnsafeBuffer where Element: Comparable {
    static func clip(
        _ buffer: Self,
        to: ClosedRange<Element>
    ) -> Self
    static func clip(
        _ buffer: Self,
        to : ClosedRange<Element>,
        result: inout Self
    )
    static func invertedClip(
        _ buffer: Self,
        to: ClosedRange<Element>
    ) -> Self
    static func invertedClip(
        _ buffer: Self,
        to: ClosedRange<Element>,
        result: inout Self
    )
    static func limit(
        _ buffer: Self,
        limit: Element,
        withOutputConstant: Element
    ) -> Self
    static func limit(
        _ buffer: Self,
        limit: Element,
        withOutputConstant: Element,
        result: inout Self
    )
    static func threshold(
        _ buffer: Self,
        to lowerBound: Element,
        with rule: ThresholdRule<Element>
    ) -> Self
    static func threshold(
        _ buffer: Self,
        to lowerBound: Element,
        with rule: ThresholdRule<Element>,
        result: inout Self
    )
}
public extension MEQTBufferClipping where Element: VectorClipping {
    static func clip(
        _ buffer: Self,
        to: ClosedRange<Element>
    ) -> Self {
        var result = buffer.shapeClone()
        Element.clip(buffer.data, to: to, result: &result.data, count: buffer.count)
        return result
    }
    
    static func clip(
        _ buffer: Self,
        to : ClosedRange<Element>,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.clip(buffer.data, to: to, result: &result.data, count: buffer.count)
    }
    
    static func invertedClip(
        _ buffer: Self,
        to: ClosedRange<Element>
    ) -> Self {
        var result = buffer.shapeClone()
        Element.invertedClip(buffer.data, to: to, result: &result.data, count: buffer.count)
        return result
    }
    
    static func invertedClip(
        _ buffer: Self,
        to: ClosedRange<Element>,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size")
        Element.invertedClip(buffer.data, to: to, result: &result.data, count: buffer.count)
    }
    
    static func limit(
        _ buffer: Self,
        limit: Element,
        withOutputConstant: Element
    ) -> Self {
        var result = buffer.shapeClone()
        Element.limit(buffer.data, limit: limit, withOutputConstant: withOutputConstant, result: &result.data, count: buffer.count)
        return result
    }
    static func limit(
        _ buffer: Self,
        limit: Element,
        withOutputConstant: Element,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.limit(buffer.data, limit: limit, withOutputConstant: withOutputConstant, result: &result.data, count: buffer.count)
    }
    static func threshold(
        _ buffer: Self,
        to lowerBound: Element,
        with rule: ThresholdRule<Element>
    ) -> Self {
        var result = buffer.shapeClone()
        Element.threshold(buffer.data, to: lowerBound, with: rule, result: &result.data, count: buffer.count)
        return result
    }
    static func threshold(
        _ buffer: Self,
        to lowerBound: Element,
        with rule: ThresholdRule<Element>,
        result: inout Self
    ) {
        precondition(buffer.count == result.count, "buffer and result must be of same size.")
        Element.threshold(buffer.data, to: lowerBound, with: rule, result: &result.data, count: buffer.count)
    }
}
