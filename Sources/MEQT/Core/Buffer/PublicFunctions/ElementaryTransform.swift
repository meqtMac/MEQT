//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

// TODO: vector only
//public func reverse<T>(_ buffer: inout T) where T: MEQTBufferTransform
//public func reversed<T>(_ buffer: T) -> T where T: MEQTBufferTransform
//
//public func sort<T>(_ buffer: inout T, using sortOrder: SortOrder)where T: MEQTBufferTransform
//
//public func sorted<T>(_ buffer: T, using sortOrder: SortOrder) -> T where T: MEQTBufferTransform

//public func integrate<T>(_ buffer: T, using rule: IntegrationRule, stepSize: Element) -> T where T: MEQTBufferTransform

/// Computes single-precision mean and standard deviation, and then calculates new elements to have a zero mean and a unit standard deviation.
public func normalize<T>(_ buffer: inout T) where T: MEQTBufferTransform {
    T.normalize(&buffer)
}

public func normalized<T>(_ buffer: T) -> T where T: MEQTBufferTransform {
    T.normalized(buffer)
}


