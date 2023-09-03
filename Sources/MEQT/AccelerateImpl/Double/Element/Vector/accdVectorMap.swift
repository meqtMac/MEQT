//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/21.
//

#if canImport(Accelerate)
import Accelerate
import Darwin.C.math
//import Foundation

extension Double: VectorMap {}
extension Double: VectorTrigonometric {
    public static func cos(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
       var count = Int32(count)
        vvcos(result, vector, &count)
    }
    
    public static func cosPi(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcospi(result, vector, &count)
    }
    
    public static func sin(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsin(result, vector, &count)
    }
    
    public static func sinPi(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinpi(result, vector, &count)
    }
    
    public static func tan(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtan(result, vector, &count)
    }
    
    public static func tanPi(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanpi(result, vector, &count)
    }
    
    public static func acos(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacos(result, vector, &count)
    }
    
    public static func asin(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasin(result, vector, &count)
    }
    
    public static func atan(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan(result, vector, &count)
    }
    
    public static func atan2(_ x: UnsafePointer<Double>, _ y: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan2(result, y, x, &count)
    }
    
    public static func sincos(_ vector: UnsafePointer<Double>, sinResult: UnsafeMutablePointer<Double>, cosResult: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsincos(sinResult, cosResult, vector, &count)
    }
}

extension Double: VectorPolynomial {
    public static func evaluatePolynomial(
        usingCoefficients coefficients: UnsafePointer<Double>,
        coeffienceCount: Int,
        withVariables variables: UnsafePointer<Double>,
        variableCount: Int,
        result: UnsafeMutablePointer<Double>
    ) {
        vDSP_vpolyD(coefficients,
                    vDSP_Stride(1),
                    variables,
                    vDSP_Stride(1),
                    result,
                    vDSP_Stride(1),
                    vDSP_Length(variableCount),
                    vDSP_Length(coeffienceCount-1)
        )
    }
}

extension Double: VectorNaturalize {
    public static func truncatingRemainder(dividends: UnsafePointer<Double>, divisors: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvfmod(result, divisors, dividends, &count)
    }
    
    public static func remainder(dividends: UnsafePointer<Double>, divisors: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvremainder(result, divisors, dividends, &count)
    }
    
    public static func ceil(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvceil(result, vector, &count)
    }
    
    public static func copysign(
        magnitudes: UnsafePointer<Double>,
        signs: UnsafePointer<Double>,
        result: UnsafeMutablePointer<Double>,
        count: Int) {
        var count = Int32(count)
        vvcopysign(result, magnitudes, signs, &count)
    }
    
    public static func floor(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvfloor(result, vector, &count)
    }
    
    public static func nearestInteger(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvnint(result, vector, &count)
    }
    
    public static func reciprocal(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvrec(result, vector, &count)
    }
    
    public static func trunc(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvint(result, vector, &count)
    }
}

extension Double: VectorExtendedMap {
    public static func j0(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.j0(vector[i])
        }
    }
    
    public static func j1(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.j1(vector[i])
        }
    }
    
    public static func y0(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.y0(vector[i])
        }
    }
    
    public static func y1(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.y1(vector[i])
        }
    }
    
    public static func erf(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.erf(vector[i])
        }
    }
    
    public static func erfc(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.erfc(vector[i])
        }
    }
    
    public static func tgamma(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.tgamma(vector[i])
        }
    }
    
    public static func lgamma(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.lgamma(vector[i])
        }
    }
    
    public static func jn(n: Int, _ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count{
            result[i] = Darwin.jn(n, vector[i])
        }
    }
    
    public static func yn(n: Int, _ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        for i in 0..<count {
            result[i] = Darwin.yn(n, vector[i])
        }
    }
}

extension Double: VectorHyperbolic {
    public static func cosh(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcosh(result, vector, &count)
    }
    
    public static func acosh(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacosh(result, vector, &count)
    }
    
    public static func sinh(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinh(result, vector, &count)
    }
    
    public static func asinh(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasinh(result, vector, &count)
    }
    
    public static func tanh(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanh(result, vector, &count)
    }
    
    public static func atanh(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatanh(result, vector, &count)
    }
}

extension Double: VectorExpLogPow {
    public static func pow(base: UnsafePointer<Double>, exponents: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvpow(result, exponents, base, &count)
    }
    
    
    public static func exp(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp(result, vector, &count)
    }
    
    public static func exp2(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp2(result, vector, &count)
    }
    
    public static func expm1(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexpm1(result, vector, &count)
    }
    
    public static func log(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var coutn = Int32(count)
        vvlog(result, vector, &coutn)
    }
    
    public static func log10(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog10(result, vector, &count)
    }
    
    public static func log2(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog2(result, vector, &count)
    }
    
    public static func log1p(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog1p(result, vector, &count)
    }
    
    public static func square(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vsqD(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
    
    public static func rsqrt(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvrsqrt(result, vector, &count)
    }
    
    public static func sqrt(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsqrt(result, vector, &count)
    }
}

extension Double: VectorAbsolute {
    public static func absolute(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vabsD(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
    
    public static func negative(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vnegD(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
    
    public static func negativeAbsolute(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vnabsD(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
}

extension Double: VectorClipping {
    public static func clip(_ vector: UnsafePointer<Double>, to: ClosedRange<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var low = to.lowerBound
        var high = to.upperBound
        vDSP_vclipD(vector, 1, &low, &high, result, 1, vDSP_Length(count))
    }
    
    public static func invertedClip(_ vector: UnsafePointer<Double>, to: ClosedRange<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var low = to.lowerBound
        var high = to.upperBound
        vDSP_viclipD(vector, 1, &low, &high, result, 1, vDSP_Length(count))
    }
    
    public static func limit(_ vector: UnsafePointer<Double>, limit: Double, withOutputConstant: Double, result: UnsafeMutablePointer<Double>, count: Int) {
        var limit = limit
        var scalar = withOutputConstant
        vDSP_vlimD(vector, 1, &limit, &scalar, result, 1, vDSP_Length(count))
    }
    
    public static func threshold(_ vector: UnsafePointer<Double>, to lowerBound: Double, with rule: ThresholdRule<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        switch rule {
            case .clampToThreshold:
                var lowBound = lowerBound
                vDSP_vthrD(vector, 1, &lowBound, result, 1, vDSP_Length(count))
            case .signedConstant(let constant):
                var C = constant
                var B = lowerBound
                vDSP_vthrscD(vector, 1, &B, &C, result, 1, vDSP_Length(count))
            case .zerofill:
                var B = lowerBound
                vDSP_vthresD(vector, 1, &B, result, 1, vDSP_Length(count))
        }
    }
}
#endif
