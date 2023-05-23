//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/21.
//

public protocol MEQTBufferReduce:
    MEQTBufferAverage,
    MEQTBufferExtrama,
    MEQTBufferSum,
    MEQTBufferZeroCrossing {}

/// Buffer Oriented Extrama
public protocol MEQTBufferExtrama: MEQTUnsafeBuffer {
    static func maximum(_ buffer: Self) -> Element
    static func maximumMagnitude(_ buffer: Self) -> Element
    static func indexOfMaximum(_ buffer: Self) -> (Index, Element)
    static func indexOfMaximumMagnitude(_ buffer: Self) -> (Index, Element)
    static func minimum(_ buffer: Self) -> Element
    static func indexOfMinimum(_ buffer: Self) -> (Index, Element)
}

public extension MEQTBufferExtrama where Element: VectorExtrama {
    static func maximum(_ buffer: Self) -> Element {
        Element.maximum(buffer.data, count:buffer.count)
    }
    static func maximumMagnitude(_ buffer: Self) -> Element {
        Element.maximumMagnitude(buffer.data, count: buffer.count)
    }
    static func indexOfMaximum(_ buffer: Self) -> (Index, Element) {
        Element.indexOfMaximum(buffer.data, count: buffer.count)
    }
    static func indexOfMaximumMagnitude(_ buffer: Self) -> (Index, Element) {
        Element.indexOfMaximumMagnitude(buffer.data, count: buffer.count)
    }
    static func minimum(_ buffer: Self) -> Element {
        Element.minimum(buffer.data, count: buffer.count)
    }
    static func indexOfMinimum(_ buffer: Self) -> (Index, Element) {
        Element.indexOfMinimum(buffer.data, count: buffer.count)
    }
}

/// Buffer Oriented Average
public protocol MEQTBufferAverage: MEQTUnsafeBuffer {
    static func mean( _ buffer: Self ) -> Element
    static func meanMagintude(_ buffer: Self) -> Element
    static func meanSquare(_ buffer: Self) -> Element
    static func rootMeanSquare(_ buffer: Self) -> Element
}

public extension MEQTBufferAverage where Element: VectorAverage {
    static func mean( _ buffer: Self ) -> Element {
        Element.mean(buffer.data, count: buffer.count)
    }
    static func meanMagintude(_ buffer: Self) -> Element {
        Element.meanMagnitude(buffer.data, count: buffer.count)
    }
    static func meanSquare(_ buffer: Self) -> Element {
        Element.meanSquare(buffer.data, count: buffer.count)
    }
    static func rootMeanSquare(_ buffer: Self) -> Element {
        Element.rootMeanSquare(buffer.data, count: buffer.count)
    }
    
}

public protocol MEQTBufferSum: MEQTUnsafeBuffer {
    static func sum(_ buffer: Self) -> Element
}

public extension MEQTBufferSum where Element: VectorSummation {
    static func sum(_ buffer: Self) -> Element {
        Element.sum(buffer.data, count: buffer.count)
    }
}

/// Buffer Oriented Zero Crossing Search
public protocol MEQTBufferZeroCrossing: MEQTUnsafeBuffer {
    static func countZeroCrossing(_ buffer: Self) -> Int
}

public extension MEQTBufferZeroCrossing where Element: VectorZeroCrossing {
    static func countZeroCrossing(_ buffer: Self) -> Int {
        Element.countZeroCrossing(buffer.data, count: buffer.count)
    }
}

