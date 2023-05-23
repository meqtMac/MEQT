//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

//MARK: Reduce (Vector) -> Scalar
public protocol VectorReduce:
    VectorAverage,
    VectorExtrama,
    VectorSummation,
    VectorZeroCrossing {}

public protocol VectorExtrama {
    static func maximum(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
    
   static func maximumMagnitude(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
    
    static func indexOfMaximum(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> (Int, Self)
    
    static func indexOfMaximumMagnitude(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> (Int, Self)
    
    static func minimum(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
    
    static func indexOfMinimum(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> (Int, Self)
 
}

public protocol VectorAverage {
    static func mean(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
    static func meanMagnitude(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
    static func meanSquare(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
    static func rootMeanSquare(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
}

public protocol VectorSummation {
    static func sum(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Self
}

public protocol VectorZeroCrossing {
//    var count: Int { get }
    static func countZeroCrossing(
        _ vector: UnsafePointer<Self>,
        count: Int
    ) -> Int
}
