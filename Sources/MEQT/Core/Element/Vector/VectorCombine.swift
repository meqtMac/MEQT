//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

//MARK: Combination (Vector, Vector) -> Vector
public protocol VectorCombine:
    VectorArithmetic,
    VectorHypotenuse,
    VectorDistance,
    VectorTaperMerge,
    VectorLinearInterpolate,
    VectorCompare,
    VectorEnvelope {}

public protocol VectorArithmetic {
    static func add(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func add(
        _ lhs: UnsafePointer<Self>,
        _ rhs: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
   static func subtract(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func subtract(
        _ lhs: UnsafePointer<Self>,
        _ rhs: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
   static func multiply(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func multiply(
        _ lhs: UnsafePointer<Self>,
        _ rhs: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
   static func divide(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func divide(
        _ lhs: UnsafePointer<Self>,
        _ rhs: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorHypotenuse {
    static func hypot(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorDistance {
    static func distanceSquared(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        count: Int
    ) -> Self
}
public protocol VectorTaperMerge {
    static func taperedMerge(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorLinearInterpolate {
    static func linearInterpolate(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        using interpolationConstant: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    
    static func linearInterpolate(
        elementsOf vector: UnsafePointer<Self>,
        elementsCount: Int,
        using contorlVector: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorCompare {
    static func maximum(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func minimum(
        _ lhs: UnsafePointer<Self>,
        _ rhs: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
public protocol VectorEnvelope {
//    var count: Int { get }
    static func envelope(
        _ vector: UnsafePointer<Self>,
        upperBound: UnsafePointer<Self>,
        lowerBound: UnsafePointer<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
}
