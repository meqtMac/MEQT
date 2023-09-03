//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

#if canImport(Accelerate)
import Accelerate
extension Float: MatrixMovable {
    public static func matrixMove(
        from sourcePointer: UnsafePointer<Float>,
        to destinationPoiner: UnsafeMutablePointer<Float>,
        subMatrixColumns: Int,
        subMatrixRows: Int, sourceColumns: Int,
        destinationColumns: Int)
    {
        vDSP_mmov(
            sourcePointer,
            destinationPoiner,
            vDSP_Length(subMatrixColumns),
            vDSP_Length(subMatrixRows),
            vDSP_Length(sourceColumns),
            vDSP_Length(destinationColumns)
        )
    }
}

extension Float: MatrixTransposable {
    public static func matrixTranpose(from sourcePointer: UnsafePointer<Float>, to destinationPointer: UnsafeMutablePointer<Float>, sourceColumns: Int, sourceRows: Int) {
        vDSP_mtrans(
            sourcePointer,
            1,
            destinationPointer,
            1,
            vDSP_Length(sourceColumns),
            vDSP_Length(sourceRows)
        )
    }
}

extension Float: MatrixMultiplicable {
    public static func matrixMultiply(
        lhs: UnsafePointer<Float>,
        rhs: UnsafePointer<Float>,
        result: UnsafeMutablePointer<Float>,
        resultRows: Int,
        resultColumns: Int,
        leftColumnsAndrightRows: Int) {
            vDSP_mmul(
                lhs,
                1,
                rhs,
                1,
                result,
                1,
                vDSP_Length(resultRows),
                vDSP_Length(resultColumns),
                vDSP_Length(leftColumnsAndrightRows)
            )
    }
}
#endif
