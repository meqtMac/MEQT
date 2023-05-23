//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

//import Foundation
//MARK: Transform (Vector) -> Vector non iter
public protocol VectorTransform:
    VectorReverse,
    VectorSort,
    VectorNormalize,
    VectorIntegrate {}

public protocol VectorReverse {
    static func reverse(
        _ vector: UnsafeMutablePointer<Self>,
        count: Int
    )
}

public protocol VectorSort {
    static func sort(
        _ vector: UnsafeMutablePointer<Self>,
        sortOrder: SortOrder,
        count: Int
    )
}

public protocol VectorNormalize {
    /// Computes single-precision mean and standard deviation, and then calculates new elements to have a zero mean and a unit standard deviation.
    static func normalize(
        _ vector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}

public protocol VectorIntegrate {
    static func integrate(
        _ vector: UnsafePointer<Self>,
        using rule: IntegrationRule,
        result: UnsafeMutablePointer<Self>,
        stepSize: Self,
        count: Int
    )
    
}
