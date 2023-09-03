//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

import Foundation
#if canImport(Accelerate)
import Accelerate

extension Float: VectorMap {}

extension Float: VectorTrigonometric {
    public static func cos(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvcosf(result, vector, &count)
        }
    
    public static func cosPi(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvcospif(result, vector, &count)
        }
    
    public static func sin(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvsinf(result, vector, &count)
        }
    
    public static func sinPi(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvsinpif(result, vector, &count)
        }
    
    public static func tan(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvtanf(result, vector, &count)
        }
    
    public static func tanPi(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvtanpif(result, vector, &count)
        }
    
    public static func acos(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvacosf(result, vector, &count)
        }
    
    public static func asin(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvasinf(result, vector, &count)
        }
    
    public static func atan(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvatanf(result, vector, &count)
        }
    
    public static func atan2(
        _ x: UnsafePointer<Float>,
        _ y: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvatan2f(result, y, x, &count)
        }
    
    public static func sincos(
        _ vector: UnsafePointer<Float>,
        sinResult: UnsafeMutablePointer<Float>,
        cosResult: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvsincosf(sinResult, cosResult, vector, &count)
        }
}

extension Float: VectorPolynomial {
    public static func evaluatePolynomial(
        usingCoefficients coefficients: UnsafePointer<Float>,
        coeffienceCount: Int,
        withVariables variables: UnsafePointer<Float>,
        variableCount: Int,
        result: UnsafeMutablePointer<Float>) {
            vDSP_vpoly(
                coefficients,
                1,
                variables,
                1,
                result,
                1,
                vDSP_Length(variableCount),
                vDSP_Length(coeffienceCount-1)
            )
        }
}

extension Float: VectorNaturalize {
    public static func truncatingRemainder(
        dividends: UnsafePointer<Float>,
        divisors: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvfmodf(result, divisors, dividends, &count)
        }
    
    public static func remainder(dividends: UnsafePointer<Float>, divisors: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvremainderf(result, divisors, dividends, &count)
    }
    
    public static func ceil(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvceilf(result, vector, &count)
        }
    
    public static func copysign(
        magnitudes: UnsafePointer<Float>,
        signs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvcopysignf(result, magnitudes, signs, &count)
        }
    
    public static func floor(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvfloorf(result, vector, &count)
        }
    
    public static func nearestInteger(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvrecf(result, vector, &count)
        }
    
    public static func reciprocal(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvrecf(result, vector, &count)
        }
    
    public static func trunc(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var count = Int32(count)
            vvintf(result, vector, &count)
        }
}

extension Float: VectorExtendedMap {
    public static func j0(
        _ vector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            for i in 0..<count {
                result[i] = Float( Foundation.j0(Double(vector[i])) )
            }
    }

    public static func j1(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Float( Foundation.j1(Double(vector[i])) )
        }
    }

    public static func y0(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Float( Foundation.y0(Double(vector[i])))
        }
    }

    public static func y1(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Float( Foundation.y1(Double(vector[i])))
        }
    }

    public static func erf(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] =  Foundation.erf(vector[i])
        }
    }

    public static func erfc(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Foundation.erfcf(vector[i])
        }
    }

    public static func tgamma(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Foundation.tgammaf(vector[i])
        }
    }

    public static func lgamma(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Foundation.lgammaf(vector[i])
        }
    }

    public static func jn(n: Int, _ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Float( Foundation.jn(n, Double(vector[i])) )
        }
    }

    public static func yn(n: Int, _ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        for i in 0..<count {
            result[i] = Float( Foundation.yn(n, Double(vector[i])))
        }
    }


}

extension Float: VectorHyperbolic {
    public static func cosh(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcoshf(result, vector, &count)
    }
    
    public static func acosh(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacoshf(result, vector, &count)
    }
    
    public static func sinh(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinhf(result, vector, &count)
    }
    
    public static func asinh(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinhf(result, vector, &count)
    }
    
    public static func tanh(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanhf(result, vector, &count)
    }
    
    public static func atanh(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanhf(result, vector, &count)
    }
}

extension Float: VectorExpLogPow {
    public static func pow(base: UnsafePointer<Float>, exponents: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvpowf(result, exponents, base, &count)
    }
    
    
    public static func exp(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpf(result, vector, &count)
    }
    
    public static func exp2(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexp2f(result, vector, &count)
    }
    
    public static func expm1(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpm1f(result, vector, &count)
    }
    
    public static func log(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var coutn = Int32(count)
        vvlogf(result, vector, &coutn)
    }
    
    public static func log10(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog10f(result, vector, &count)
    }
    
    public static func log2(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog2f(result, vector, &count)
    }
    
    public static func log1p(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog1pf(result, vector, &count)
    }
    
    public static func square(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vsq(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
    
    public static func rsqrt(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvrsqrtf(result, vector, &count)
    }
    
    public static func sqrt(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsqrtf(result, vector, &count)
    }
}

extension Float: VectorAbsolute {
    public static func absolute(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vabs(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
    
    public static func negative(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vneg(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
    
    public static func negativeAbsolute(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vnabs(vector, vDSP_Stride(1), result, vDSP_Stride(1), vDSP_Length(count))
    }
}

extension Float: VectorClipping {
    public static func clip(_ vector: UnsafePointer<Float>, to: ClosedRange<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var low = to.lowerBound
        var high = to.upperBound
        vDSP_vclip(vector, 1, &low, &high, result, 1, vDSP_Length(count))
    }
    
    public static func invertedClip(_ vector: UnsafePointer<Float>, to: ClosedRange<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var low = to.lowerBound
        var high = to.upperBound
        vDSP_viclip(vector, 1, &low, &high, result, 1, vDSP_Length(count))
    }
    
    public static func limit(_ vector: UnsafePointer<Float>, limit: Float, withOutputConstant: Float, result: UnsafeMutablePointer<Float>, count: Int) {
        var limit = limit
        var scalar = withOutputConstant
        vDSP_vlim(vector, 1, &limit, &scalar, result, 1, vDSP_Length(count))
    }
    
    public static func threshold(_ vector: UnsafePointer<Float>, to lowerBound: Float, with rule: ThresholdRule<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        switch rule {
            case .clampToThreshold:
                var lowBound = lowerBound
                vDSP_vthr(vector, 1, &lowBound, result, 1, vDSP_Length(count))
            case .signedConstant(let constant):
                var C = constant
                var B = lowerBound
                vDSP_vthrsc(vector, 1, &B, &C, result, 1, vDSP_Length(count))
            case .zerofill:
                var B = lowerBound
                vDSP_vthres(vector, 1, &B, result, 1, vDSP_Length(count))
        }
    }
}

#endif
