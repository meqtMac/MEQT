//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

//import Foundation

#if canImport(Accelerate)
import Accelerate

extension Float: VectorReduce {}
extension Float: VectorExtrama {
    public static func minimum(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_minv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func maximumMagnitude(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_maxmgv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func maximum(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_maxv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func indexOfMaximum(_ vector: UnsafePointer<Float>, count: Int) -> (Int, Float) {
        var result: Float = 0.0
        var index = vDSP_Length(0)
        vDSP_maxvi(vector, 1, &result, &index, vDSP_Length(count))
        return (Int(index), result)
    }
    
    public static func indexOfMaximumMagnitude(_ vector: UnsafePointer<Float>, count: Int) -> (Int, Float) {
        var result: Float = 0.0
        var index = vDSP_Length(0)
        vDSP_maxmgvi(vector, 1, &result, &index, vDSP_Length(count))
        return (Int(index), result)
    }
    
    public static func indexOfMinimum(_ vector: UnsafePointer<Float>, count: Int) -> (Int, Float) {
        var result: Float = 0.0
        var index = vDSP_Length(0)
        vDSP_minvi(vector, 1, &result, &index, vDSP_Length(count))
        return (Int(index), result)
    }
    
    
}
extension Float: VectorAverage {
    public static func mean(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_meanv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func meanMagnitude(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_meamgv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func meanSquare(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_measqv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func rootMeanSquare(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_rmsqv(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    
}
extension Float: VectorSummation {
    public static func sum(_ vector: UnsafePointer<Float>, count: Int) -> Float {
        var result: Float = 0.0
        vDSP_sve(vector, 1, &result, vDSP_Length(count))
        return result
    }
}
extension Float: VectorZeroCrossing {
    public static func countZeroCrossing(_ vector: UnsafePointer<Float>, count: Int) -> Int {
        var result = vDSP_Length(0)
        var C = vDSP_Length(0)
        vDSP_nzcros(vector, 1, vDSP_Length(count), &C, &result, vDSP_Length(count))
        return Int(result)
    }
}

#endif

