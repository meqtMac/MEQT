//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

#if canImport(Accelerate)
import Accelerate
extension Double: VectorCombine {}
extension Double: VectorArithmetic {
    public static func add(
        _ lhs: UnsafePointer<Double>,
        _ rhs: UnsafePointer<Double>,
        result: UnsafeMutablePointer<Double>,
        count: Int) {
            
        vDSP_vaddD(
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
        _ lhs: UnsafePointer<Double>,
        _ rhs: Double,
        result: UnsafeMutablePointer<Double>,
        count: Int) {
        var scalar = rhs
        vDSP_vsaddD(
            lhs,
            1,
            &scalar,
            result,
            1,
            vDSP_Length(count)
        )
    }
    
    public static func subtract(_ lhs: UnsafePointer<Double>, _ rhs: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vsubD(rhs, 1, lhs, 1, result, 1, vDSP_Length(count))
    }
    
    public static func subtract(_ lhs: UnsafePointer<Double>, _ rhs: Double, result: UnsafeMutablePointer<Double>, count: Int) {
        var scalar = -rhs
        vDSP_vsaddD(lhs, 1, &scalar, result, 1, vDSP_Length(count))
    }
    
    public static func multiply(_ lhs: UnsafePointer<Double>, _ rhs: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vmulD(lhs, 1, rhs, 1, result, 1, vDSP_Length(count))
    }
    
    public static func multiply(_ lhs: UnsafePointer<Double>, _ rhs: Double, result: UnsafeMutablePointer<Double>, count: Int) {
        var scalar = rhs
        vDSP_vsmulD(lhs, 1, &scalar, result, 1, vDSP_Length(count))
    }
    
    public static func divide(_ lhs: UnsafePointer<Double>, _ rhs: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vdivD(rhs, 1, lhs, 1, result, 1, vDSP_Length(count))
    }
    
    public static func divide(_ lhs: UnsafePointer<Double>, _ rhs: Double, result: UnsafeMutablePointer<Double>, count: Int) {
        var scalar = rhs
        vDSP_vsdivD(lhs, 1, &scalar, result, 1, vDSP_Length(count))
    }
}

extension Double: VectorHypotenuse {
    public static func hypot(
        _ lhs: UnsafePointer<Double>,
        _ rhs: UnsafePointer<Double>,
        result: UnsafeMutablePointer<Double>,
        count: Int) {
            let zeros = [Self](unsafeUninitializedCapacity: count) { buffer, initializedCount in
                initializedCount = count
                vDSP_vclrD(buffer.baseAddress!, 1, vDSP_Length(count))
            }
            vDSP_vpythgD(lhs, 1, rhs, 1, zeros, 1, zeros, 1, result, 1, vDSP_Length(count))
    }
}
extension Double: VectorDistance {
    public static func distanceSquared(
        _ lhs: UnsafePointer<Double>,
        _ rhs: UnsafePointer<Double>,
        count: Int) -> Double {
            var result = 0.0
            vDSP_distancesqD(lhs, 1, rhs, 1, &result, vDSP_Length(count))
            return result
    }
}
extension Double: VectorTaperMerge {
    /// x, y: result[0] = x[0], result[-1] = y[-1]
    public static func taperedMerge(
        _ lhs: UnsafePointer<Double>,
        _ rhs: UnsafePointer<Double>,
        result: UnsafeMutablePointer<Double>,
        count: Int) {
            vDSP_vtmergD(lhs, 1, rhs, 1, result, 1, vDSP_Length(count))
    }
}
extension Double: VectorLinearInterpolate {
    public static func linearInterpolate(
        _ lhs: UnsafePointer<Double>,
        _ rhs: UnsafePointer<Double>,
        using interpolationConstant: Double,
        result: UnsafeMutablePointer<Double>,
        count: Int
    ) {
        var constant = interpolationConstant
        vDSP_vintbD(lhs, 1, rhs, 1, &constant, result, 1, vDSP_Length(count))
    }
    
    public static func linearInterpolate(
        elementsOf vector: UnsafePointer<Double>,
        elementsCount: Int,
        using contorlVector: UnsafePointer<Double>,
        result: UnsafeMutablePointer<Double>,
        count: Int
    ) {
        vDSP_vlintD(vector, contorlVector, 1, result, 1, vDSP_Length(count), vDSP_Length(elementsCount))
    }
}
extension Double: VectorCompare {
    public static func minimum(_ lhs: UnsafePointer<Double>, _ rhs: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vminD(lhs, 1, rhs, 1, result, 1, vDSP_Length(count))
    }
    
    public static func maximum(
        _ lhs: UnsafePointer<Double>,
        _ rhs: UnsafePointer<Double>,
        result: UnsafeMutablePointer<Double>,
        count: Int
    ) {
        vDSP_vmaxD(lhs, 1, rhs, 1, result, 1, vDSP_Length(count))
    }
}
extension Double: VectorEnvelope {
    public static func envelope(_ vector: UnsafePointer<Double>, upperBound: UnsafePointer<Double>, lowerBound: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_venvlpD(upperBound, 1, lowerBound, 1, vector, 1, result, 1, vDSP_Length(count))
    }
}
#endif
