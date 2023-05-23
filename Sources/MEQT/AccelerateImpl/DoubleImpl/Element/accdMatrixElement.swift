//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//
#if canImport(Accelerate)
import Accelerate

extension Double: MatrixMovable {
    public static func matrixMove(from sourcePointer: UnsafePointer<Double>, to destinationPoiner: UnsafeMutablePointer<Double>, subMatrixColumns: Int, subMatrixRows: Int, sourceColumns: Int, destinationColumns: Int) {
        vDSP_mmovD(sourcePointer, destinationPoiner, vDSP_Length(subMatrixColumns), vDSP_Length(subMatrixRows), vDSP_Length(sourceColumns), vDSP_Length(destinationColumns)
        )
    }
}

extension Double: MatrixTransposable {
    public static func matrixTranpose(
        from sourcePointer: UnsafePointer<Double>,
        to destinationPointer: UnsafeMutablePointer<Double>,
        sourceColumns: Int,
        sourceRows: Int) {
            vDSP_mtransD(
                sourcePointer,
                1,
                destinationPointer,
                1,
                vDSP_Length(sourceColumns),
                vDSP_Length(sourceColumns)
            )
    }
}

extension Double: MatrixMultiplicable {
    public static func matrixMultiply(lhs: UnsafePointer<Double>, rhs: UnsafePointer<Double>, result: UnsafeMutablePointer<Double>, resultRows: Int, resultColumns: Int, leftColumnsAndrightRows: Int) {
        vDSP_mmulD(
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
