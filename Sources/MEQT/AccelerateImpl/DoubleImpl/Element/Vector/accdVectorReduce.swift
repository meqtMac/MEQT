//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

#if canImport(Accelerate)
import Accelerate
extension Double: VectorReduce {}
extension Double: VectorExtrama {
    public static func minimum(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_minvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func maximumMagnitude(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_maxmgvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func maximum(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_maxvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func indexOfMaximum(_ vector: UnsafePointer<Double>, count: Int) -> (Int, Double) {
        var result = 0.0
        var index = vDSP_Length(0)
        vDSP_maxviD(vector, 1, &result, &index, vDSP_Length(count))
        return (Int(index), result)
    }
    
    public static func indexOfMaximumMagnitude(_ vector: UnsafePointer<Double>, count: Int) -> (Int, Double) {
        var result = 0.0
        var index = vDSP_Length(0)
        vDSP_maxmgviD(vector, 1, &result, &index, vDSP_Length(count))
        return (Int(index), result)
    }
    
    public static func indexOfMinimum(_ vector: UnsafePointer<Double>, count: Int) -> (Int, Double) {
        var result = 0.0
        var index = vDSP_Length(0)
        vDSP_minviD(vector, 1, &result, &index, vDSP_Length(count))
        return (Int(index), result)
    }
    
    
}
extension Double: VectorAverage {
    public static func mean(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_meanvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func meanMagnitude(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_meamgvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func meanSquare(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_measqvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    public static func rootMeanSquare(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_rmsqvD(vector, 1, &result, vDSP_Length(count))
        return result
    }
    
    
}
extension Double: VectorSummation {
    public static func sum(_ vector: UnsafePointer<Double>, count: Int) -> Double {
        var result = 0.0
        vDSP_sveD(vector, 1, &result, vDSP_Length(count))
        return result
    }
}
extension Double: VectorZeroCrossing {
    public static func countZeroCrossing(_ vector: UnsafePointer<Double>, count: Int) -> Int {
        var result = vDSP_Length(0)
        var C = vDSP_Length(0)
        vDSP_nzcrosD(vector, 1, vDSP_Length(count), &C, &result, vDSP_Length(count))
        return Int(result)
    }
}
#endif
