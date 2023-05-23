//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/20.
//

                                        
    
public protocol MatrixConvolvable {
    /// kernel row and column must be odd, result must be zero padding.
    static func convolve(
        sourcePointer: UnsafePointer<Self>,
        rowCount: Int,
        columnCount: Int,
        withKernel kernel: UnsafePointer<Self>,
        kernelRowCount: Int,
        kernelColumnCount: Int,
        result: UnsafeMutablePointer<Self>
    )
}

public protocol MatrixDSPElement:
    MatrixConvolvable {}
