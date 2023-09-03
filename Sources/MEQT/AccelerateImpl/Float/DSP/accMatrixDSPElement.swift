//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

//import Foundation
#if canImport(Accelerate)
import Accelerate
extension Float: MatrixConvolvable {
    public static func convolve(sourcePointer: UnsafePointer<Float>, rowCount: Int, columnCount: Int, withKernel kernel: UnsafePointer<Float>, kernelRowCount: Int, kernelColumnCount: Int, result: UnsafeMutablePointer<Float>) {
        vDSP_imgfir(
            sourcePointer,
            vDSP_Length(rowCount),
            vDSP_Length(columnCount),
            kernel,
            result,
            vDSP_Length(kernelRowCount),
            vDSP_Length(columnCount)
        )
    }
}
#endif
