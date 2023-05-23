//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//


//MARK: Generation (Vector?) -> Vector, non match in count
public protocol VectorGeneration: Comparable {
    static var one: Self { get }
    static func ramp(
        withInitialValue initialValue: Self,
        increment: Self,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func ramp(
        in range: ClosedRange<Self>,
        result: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func clear(
        _ vector: UnsafeMutablePointer<Self>,
        count: Int
    )
    static func fill(
        _ vector: UnsafeMutablePointer<Self>,
        with value: Self,
        count: Int
    )
}

//TODO: Compression?
//public protocol VectorCompression {
////    var count: Int { get }
//    static func compress(
//        _ vector: UnsafePointer<Self>,
//        gatingVector: UnsafePointer<Self>,
//        result: UnsafeMutablePointer<Self>,
//        count: Int
//    )
//}

//TODO: Gather?
//public protocol VectorGather {
////    var count: Int { get }
//    static func
//}

//MARK: Interpolate moved to Combination
//public protocol VectorInterploateGeneration {
//    var count: Int { get }
//}
