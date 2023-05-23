//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

#if canImport(Accelerate)
import Accelerate
extension Double: MatrixConvolvable {
    public static func convolve(
        sourcePointer: UnsafePointer<Double>,
        rowCount: Int,
        columnCount: Int,
        withKernel kernel: UnsafePointer<Double>,
        kernelRowCount: Int,
        kernelColumnCount: Int,
        result: UnsafeMutablePointer<Double>
    ) {
            vDSP_imgfirD(
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
