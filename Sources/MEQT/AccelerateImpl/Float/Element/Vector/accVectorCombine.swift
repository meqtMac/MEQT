//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

#if canImport(Accelerate)
import Accelerate
extension Float: VectorCombine {}
extension Float: VectorArithmetic {
    public static func add(
        _ lhs: UnsafePointer<Float>,
        _ rhs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            
            vDSP_vadd(
                lhs,
                1,
                rhs,
                1,
                result,
                1,
                vDSP_Length(count)
            )
            
        }
    
    public static func add(
        _ lhs: UnsafePointer<Float>,
        _ rhs: Float,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var scalar = rhs
            vDSP_vsadd(
                lhs,
                1,
                &scalar,
                result,
                1,
                vDSP_Length(count)
            )
        }
    
    public static func subtract(
        _ lhs: UnsafePointer<Float>,
        _ rhs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            vDSP_vsub(
                rhs,
                1,
                lhs,
                1,
                result,
                1,
                vDSP_Length(count)
            )
        }
    
    public static func subtract(
        _ lhs: UnsafePointer<Float>,
        _ rhs: Float,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var scalar = -rhs
            vDSP_vsadd(lhs,
                       1,
                       &scalar,
                       result,
                       1,
                       vDSP_Length(count)
            )
        }
    
    public static func multiply(_ lhs: UnsafePointer<Float>, _ rhs: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vmul(
            lhs,
            1,
            rhs,
            1,
            result,
            1,
            vDSP_Length(count)
        )
    }
    
    public static func multiply(_ lhs: UnsafePointer<Float>, _ rhs: Float, result: UnsafeMutablePointer<Float>, count: Int) {
        var scalar = rhs
        vDSP_vsmul(
            lhs,
            1,
            &scalar,
            result,
            1,
            vDSP_Length(count))
    }
    
    public static func divide(_ lhs: UnsafePointer<Float>, _ rhs: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vdiv(
            rhs,
            1,
            lhs,
            1,
            result,
            1,
            vDSP_Length(count)
        )
    }
    
    public static func divide(_ lhs: UnsafePointer<Float>, _ rhs: Float, result: UnsafeMutablePointer<Float>, count: Int) {
        var scalar = rhs
        vDSP_vsdiv(
            lhs,
            1,
            &scalar,
            result,
            1,
            vDSP_Length(count)
        )
    }
}

extension Float: VectorHypotenuse {
    public static func hypot(
        _ lhs: UnsafePointer<Float>,
        _ rhs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            
            let zeros = [Self](unsafeUninitializedCapacity: count) { buffer, initializedCount in
                vDSP_vclr(buffer.baseAddress!, 1, vDSP_Length(count))
            }
            vDSP_vpythg(
                lhs,
                1,
                rhs,
                1,
                zeros,
                1,
                zeros,
                1,
                result,
                1,
                vDSP_Length(count)
            )
        }
    
    
}

extension Float: VectorDistance {
    public static func distanceSquared(
        _ lhs: UnsafePointer<Float>,
        _ rhs: UnsafePointer<Float>,
        count: Int) -> Float {
            var result: Float = 0.0
            vDSP_distancesq(
                lhs,
                1,
                rhs,
                1,
                &result,
                vDSP_Length(count)
            )
            return result
        }
    
    
}

extension Float: VectorTaperMerge {
    public static func taperedMerge(
        _ lhs: UnsafePointer<Float>,
        _ rhs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            vDSP_vtmerg(
                lhs,
                1,
                rhs,
                1,
                result,
                1,
                vDSP_Length(count)
            )
        }
}

extension Float: VectorLinearInterpolate {
    public static func linearInterpolate(_ lhs: UnsafePointer<Float>, _ rhs: UnsafePointer<Float>, using interpolationConstant: Float, result: UnsafeMutablePointer<Float>, count: Int) {
        
        var constant = interpolationConstant
        vDSP_vintb(
            lhs,
            1,
            rhs,
            1,
            &constant,
            result,
            1,
            vDSP_Length(count)
        )
        
    }
    
    public static func linearInterpolate(
        elementsOf vector: UnsafePointer<Float>,
        elementsCount: Int,
        using contorlVector: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            
            vDSP_vlint(
                vector,
                contorlVector,
                1,
                result,
                1,
                vDSP_Length(count),
                vDSP_Length(count)
            )
            
        }
}
extension Float: VectorCompare {
    public static func minimum(_ lhs: UnsafePointer<Float>, _ rhs: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        
        vDSP_vmin(
            lhs,
            1,
            rhs,
            1,
            result,
            1,
            vDSP_Length(count)
        )
    }
    
    
    public static func maximum(
        _ lhs: UnsafePointer<Float>,
        _ rhs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            
            vDSP_vmax(
                lhs,
                1,
                rhs,
                1,
                result,
                1,
                vDSP_Length(count)
            )
        }
    
}

extension Float: VectorEnvelope {
    public static func envelope(
        _ vector: UnsafePointer<Float>,
        upperBound: UnsafePointer<Float>,
        lowerBound: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int)
    {
        vDSP_venvlp(
            upperBound,
            1,
            lowerBound,
            1,
            vector,
            1,
            result,
            1,
            vDSP_Length(count)
        )
    }
}
#endif
