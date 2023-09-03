//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

//import Foundation
#if canImport(Accelerate)
import Accelerate
extension Float: VectorGeneration {
    public static var one: Float { 1.0 }
     
    public static func ramp(
        withInitialValue initialValue: Float,
        increment: Float,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var initial = initialValue
            var increment = increment
            vDSP_vramp(
                &initial,
                &increment,
                result,
                1,
                vDSP_Length(count)
            )
    }

    
    public static func ramp(
        in range: ClosedRange<Float>,
        result: UnsafeMutablePointer<Float>,
        count: Int) {
            var base = range.lowerBound
            var end = range.upperBound
            vDSP_vgen(
                &base,
                &end,
                result,
                1,
                vDSP_Length(count)
            )
    }
    
    public static func clear(_ vector: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vclr(
            vector,
            1,
            vDSP_Length(count)
        )
    }
    
    public static func fill(_ vector: UnsafeMutablePointer<Float>, with value: Float, count: Int) {
        var scalar = value
        vDSP_vfill(
            &scalar,
            vector,
            1,
            vDSP_Length(count)
        )
    }
}
#endif
