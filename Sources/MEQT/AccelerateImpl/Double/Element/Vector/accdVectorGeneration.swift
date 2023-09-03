//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

//import Foundation
#if canImport(Accelerate)
import Accelerate
extension Double: VectorGeneration {
    public static let one = 1.0
    public static func ramp(withInitialValue initialValue: Double, increment: Double, result: UnsafeMutablePointer<Double>, count: Int) {
        var initial = initialValue
        var increment = increment
        vDSP_vrampD(&initial, &increment, result, 1, vDSP_Length(count))
    }
    
    public static func ramp(in range: ClosedRange<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var base = range.lowerBound
        var end = range.upperBound
        vDSP_vgenD(&base, &end, result, 1, vDSP_Length(count))
    }
    
    public static func clear(_ vector: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vclrD(vector, 1, vDSP_Length(count))
    }
    
    public static func fill(_ vector: UnsafeMutablePointer<Double>, with value: Double, count: Int) {
        var scalar = value
        vDSP_vfillD(&scalar, vector, 1, vDSP_Length(count))
    }
}
#endif

