//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//


#if canImport(Accelerate)
import Accelerate
extension Double: VectorTransform {}
extension Double: VectorReverse {
    public static func reverse(_ vector: UnsafeMutablePointer<Double>, count: Int) {
        vDSP_vrvrsD(vector, 1, vDSP_Length(count))
    }
}
extension Double: VectorSort {
    public static func sort(_ vector: UnsafeMutablePointer<Double>, sortOrder: SortOrder, count: Int) {
        switch sortOrder{
            case .ascending:
                vDSP_vsortD(vector, vDSP_Length(count), 1)
            case .descending:
                vDSP_vsortD(vector, vDSP_Length(count), -1)
        }
    }
}
extension Double: VectorNormalize {
    public static func normalize(_ vector: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, count: Int) {
        var mean = 0.0
        var std = 0.0
        vDSP_normalizeD(vector, 1, result, 1, &mean, &std, vDSP_Length(count))
    }
}
extension Double: VectorIntegrate {
    public static func integrate(_ vector: UnsafePointer<Double>, using rule: IntegrationRule, result: UnsafeMutablePointer<Double>, stepSize: Double, count: Int) {
        switch rule{
            case .runningSum:
                var weight = stepSize
                vDSP_vrsumD(vector, 1, &weight, result, 1, vDSP_Length(count))
            case .simpson:
                var step = stepSize
                vDSP_vsimpsD(vector, 1, &step, result, 1, vDSP_Length(count))
            case .trapezoidal:
                var step = stepSize
                vDSP_vtrapzD(vector, 1, &step, result, 1, vDSP_Length(count))
        }
    }
}
#endif
