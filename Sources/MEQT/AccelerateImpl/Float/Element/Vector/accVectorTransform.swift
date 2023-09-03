//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

//import Foundation
#if canImport(Accelerate)
import Accelerate
extension Float: VectorTransform {}
extension Float: VectorReverse {
    public static func reverse(_ vector: UnsafeMutablePointer<Float>, count: Int) {
        vDSP_vrvrs(vector, 1, vDSP_Length(count))
    }
}
extension Float: VectorSort {
    public static func sort(_ vector: UnsafeMutablePointer<Float>, sortOrder: SortOrder, count: Int) {
        switch sortOrder{
            case .ascending:
                vDSP_vsort(vector, vDSP_Length(count), 1)
            case .descending:
                vDSP_vsort(vector, vDSP_Length(count), -1)
        }
    }
}
extension Float: VectorNormalize {
    public static func normalize(_ vector: UnsafePointer<Float>, result: UnsafeMutablePointer<Float>, count: Int) {
        var mean: Float = 0.0
        var std: Float = 0.0
        vDSP_normalize(vector, 1, result, 1, &mean, &std, vDSP_Length(count))
    }
}
extension Float: VectorIntegrate {
    public static func integrate(_ vector: UnsafePointer<Float>, using rule: IntegrationRule, result: UnsafeMutablePointer<Float>, stepSize: Float, count: Int) {
        switch rule{
            case .runningSum:
                var weight = stepSize
                vDSP_vrsum(vector, 1, &weight, result, 1, vDSP_Length(count))
            case .simpson:
                var step = stepSize
                vDSP_vsimps(vector, 1, &step, result, 1, vDSP_Length(count))
            case .trapezoidal:
                var step = stepSize
                vDSP_vtrapz(vector, 1, &step, result, 1, vDSP_Length(count))
        }
    }
}
#endif
