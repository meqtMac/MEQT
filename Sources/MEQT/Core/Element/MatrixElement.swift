//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

public protocol MEQTMatrixElement:
    MatrixTransposable,
    MatrixMovable,
    MatrixMultiplicable {}


public protocol MatrixMovable {
    static func matrixMove(
        from sourcePointer: UnsafePointer<Self>,
        to destinationPoiner: UnsafeMutablePointer<Self>,
        subMatrixColumns: Int,
        subMatrixRows: Int,
        sourceColumns: Int,
        destinationColumns: Int
    )
}

public protocol MatrixTransposable {
    static func matrixTranpose(
        from sourcePointer: UnsafePointer<Self>,
        to destinationPointer: UnsafeMutablePointer<Self>,
        sourceColumns: Int,
        sourceRows: Int
    )
}

public protocol MatrixMultiplicable{
    static func matrixMultiply(
        lhs: UnsafePointer<Self>,
        rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        resultRows: Int,
        resultColumns: Int,
        leftColumnsAndrightRows: Int
    )
}

