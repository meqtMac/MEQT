//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/21.
//
public protocol MEQTBufferCombine:
    MEQTBufferArithmetic,
    MEQTBufferHypotenuse,
    MEQTBufferDistance,
    MEQTBufferTaperMerge,
    MEQTBufferLinearInterpolate,
    MEQTBufferMinMax,
    MEQTBufferEnvelope {}

/// Buffer-Oriented Arithmetic Operation and operator
public protocol MEQTBufferArithmetic: MEQTUnsafeBuffer  {
    static func add(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    
    static func add(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func add(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    )
    
    static func add(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    
    static func add(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    )
    
    static func add(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    )
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    
    static func subtract(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    )
    
    static func subtract(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    )
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    
    static func multiply(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    )
    
    static func multiply(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func divide(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    
    static func divide(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func divide(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    )
    
    static func divide(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    
    static func divide(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    )
    
    static func divide(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func + (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func + (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    static func + (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func += (
        _ lhs: inout Self,
        _ rhs: Self
    )
    
    static func += (
        _ lhs: inout Self,
        _ rhs: Element
    )
    static func - (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func - (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    static func - (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func -= (
        _ lhs: inout Self,
        _ rhs: Self
    )
    
    static func -= (
        _ lhs: inout Self,
        _ rhs: Element
    )
    static func * (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func * (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    static func * (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func *= (
        _ lhs: inout Self,
        _ rhs: Self
    )
    
    static func *= (
        _ lhs: inout Self,
        _ rhs: Element
    )
    static func / (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    
    static func / (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self
    
    static func / (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self
    
    static func /= (
        _ lhs: inout Self,
        _ rhs: Self
    )
    
    static func /= (
        _ lhs: inout Self,
        _ rhs: Element
    )
}

public extension MEQTBufferArithmetic where Element: VectorArithmetic {
    static func add(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs, and result must be of same size")
        Element.add(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    
    static func add(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.add(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
    
    static func add(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    ) {
        precondition(lhs.count == result.count, "lhs and result must be of same size.")
        Element.add(lhs.data, rhs, result: &result.data, count: result.count)
    }
    
    static func add(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        var result = lhs.shapeClone()
        Element.add(lhs.data, rhs, result: &result.data, count: result.count)
        return result
    }
    
    
    static func add(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(rhs.count == result.count, "lhs and result must be of same size.")
        Element.add(rhs.data, lhs, result: &result.data, count: result.count)
    }
    
    static func add(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        var result = rhs.shapeClone()
        Element.add(rhs.data, lhs, result: &result.data, count: result.count)
        return result
    }
    static func subtract(
        
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs, and result must be of same size")
        Element.subtract(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.subtract(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    ) {
        precondition(lhs.count == result.count, "lhs and result must be of same size.")
        Element.subtract(lhs.data, rhs, result: &result.data, count: result.count)
    }
    
    static func subtract(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        var result = lhs.shapeClone()
        Element.subtract(lhs.data, rhs, result: &result.data, count: result.count)
        return result
    }
    
    
    static func subtract(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(rhs.count == result.count, "lhs and result must be of same size.")
        Element.subtract(rhs.data, lhs, result: &result.data, count: result.count)
    }
    
    static func subtract(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        var result = rhs.shapeClone()
        Element.subtract(rhs.data, lhs, result: &result.data, count: result.count)
        return result
    }
    static func multiply(
        
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs, and result must be of same size")
        Element.multiply(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.multiply(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    ) {
        precondition(lhs.count == result.count, "lhs and result must be of same size.")
        Element.multiply(lhs.data, rhs, result: &result.data, count: result.count)
    }
    
    static func multiply(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        var result = lhs.shapeClone()
        Element.multiply(lhs.data, rhs, result: &result.data, count: result.count)
        return result
    }
    
    
    static func multiply(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(rhs.count == result.count, "lhs and result must be of same size.")
        Element.multiply(rhs.data, lhs, result: &result.data, count: result.count)
    }
    
    static func multiply(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        var result = rhs.shapeClone()
        Element.multiply(rhs.data, lhs, result: &result.data, count: result.count)
        return result
    }
    static func divide(
        
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs, and result must be of same size")
        Element.divide(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    
    static func divide(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.divide(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
    
    static func divide(
        _ lhs: Self,
        _ rhs: Element,
        result: inout Self
    ) {
        precondition(lhs.count == result.count, "lhs and result must be of same size.")
        Element.divide(lhs.data, rhs, result: &result.data, count: result.count)
    }
    
    static func divide(
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        var result = lhs.shapeClone()
        Element.divide(lhs.data, rhs, result: &result.data, count: result.count)
        return result
    }
    
    
    static func divide(
        _ lhs: Element,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(rhs.count == result.count, "lhs and result must be of same size.")
        Element.divide(rhs.data, lhs, result: &result.data, count: result.count)
    }
    
    static func divide(
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        var result = rhs.shapeClone()
        Element.divide(rhs.data, lhs, result: &result.data, count: result.count)
        return result
    }
    
    static func + (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        add(lhs, rhs)
    }
    
    static func + (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        add(lhs, rhs)
    }
    
    static func + (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        add(lhs, rhs)
    }
    
    static func += (
        _ lhs: inout Self,
        _ rhs: Self
    ) {
        add(lhs, rhs, result: &lhs)
    }
    
    static func += (
        _ lhs: inout Self,
        _ rhs: Element
    ) {
        add(lhs, rhs, result: &lhs)
    }
    static func * (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        multiply(lhs, rhs)
    }
    
    static func * (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        multiply(lhs, rhs)
    }
    
    static func * (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        multiply(lhs, rhs)
    }
    
    static func *= (
        _ lhs: inout Self,
        _ rhs: Self
    ) {
        multiply(lhs, rhs, result: &lhs)
    }
    
    static func *= (
        _ lhs: inout Self,
        _ rhs: Element
    ) {
        multiply(lhs, rhs, result: &lhs)
    }
    static func - (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        subtract(lhs, rhs)
    }
    
    static func - (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        subtract(lhs, rhs)
    }
    
    static func - (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        subtract(lhs, rhs)
    }
    
    static func -= (
        _ lhs: inout Self,
        _ rhs: Self
    ) {
        subtract(lhs, rhs, result: &lhs)
    }
    
    static func -= (
        _ lhs: inout Self,
        _ rhs: Element
    ) {
        subtract(lhs, rhs, result: &lhs)
    }
    static func / (
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        divide(lhs, rhs)
    }
    
    static func / (
        _ lhs: Self,
        _ rhs: Element
    ) -> Self {
        divide(lhs, rhs)
    }
    
    static func / (
        _ lhs: Element,
        _ rhs: Self
    ) -> Self {
        divide(lhs, rhs)
    }
    
    static func /= (
        _ lhs: inout Self,
        _ rhs: Self
    ) {
        divide(lhs, rhs, result: &lhs)
    }
    
    static func /= (
        _ lhs: inout Self,
        _ rhs: Element
    ) {
        divide(lhs, rhs, result: &lhs)
    }
}

/// Buffer-Oriented Hypotenuse
public protocol MEQTBufferHypotenuse: MEQTUnsafeBuffer {
    static func hypot(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    static func hypot(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
}

public extension MEQTBufferHypotenuse where Element: VectorHypotenuse {
    static func hypot(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs and result must be of same size.")
        Element.hypot(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    static func hypot(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size.")
        var result = lhs.shapeClone()
        Element.hypot(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
}

/// Buffer-Oriented Distance
public protocol MEQTBufferDistance: MEQTUnsafeBuffer {
    static func distanceSquared(
        _ lhs: Self,
        _ rhs: Self
    ) -> Element
}

public extension MEQTBufferDistance where Element: VectorDistance {
    static func distanceSquared(
        _ lhs: Self,
        _ rhs: Self
    ) -> Element {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size.")
        return Element.distanceSquared(lhs.data, rhs.data,  count: lhs.count)
    }
}

/// Buffer-Oriented TaperMerge
public protocol MEQTBufferTaperMerge: MEQTUnsafeBuffer {
    static func taperedMerge(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    static func taperedMerge(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
}

public extension MEQTBufferTaperMerge where Element: VectorTaperMerge {
    static func taperedMerge(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "rhs, lhs and result must be of same size" )
        Element.taperedMerge(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    
    static func taperedMerge(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.taperedMerge(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
}

public protocol MEQTBufferLinearInterpolate: MEQTUnsafeBuffer {
    static func linearInterpolate(
        _ lhs: Self,
        _ rhs: Self,
        using interpolationConstant: Element,
        result: inout Self
    )
    static func linearInterpolate(
        _ lhs: Self,
        _ rhs: Self,
        using interpolationConstant: Element
    ) -> Self
    
    
}

public extension MEQTBufferLinearInterpolate where Element : VectorLinearInterpolate {
    static func linearInterpolate(
        _ lhs: Self,
        _ rhs: Self,
        using interpolationConstant: Element,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count)
        Element.linearInterpolate(lhs.data, rhs.data, using: interpolationConstant, result: &result.data, count: result.count)
    }
    static func linearInterpolate(
        _ lhs: Self,
        _ rhs: Self,
        using interpolationConstant: Element
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.linearInterpolate(lhs.data, rhs.data, using: interpolationConstant, result: &result.data, count: result.count)
        return result
    }
}

public extension MEQTVectorBuffer where Element: VectorLinearInterpolate {
    /// vector only
    static func linearInterpolate(
        elementsOf vector: Self,
        using controlVector: Self,
        result: inout Self
    ) {
        precondition(controlVector.count == result.count, "control vector and result must be of same size")
        Element.linearInterpolate(
            elementsOf: vector.data,
            elementsCount: vector.count,
            using: controlVector.data,
            result: &result.data,
            count: result.count
        )
    }
    
    /// vector only
    static func linearInterpolate(
        elementsOf vector: Self,
        using controlVector: Self
    ) -> Self {
        var result = controlVector.shapeClone()
        Element.linearInterpolate(
            elementsOf: vector.data,
            elementsCount: vector.count,
            using: controlVector.data,
            result: &result.data,
            count: result.count
        )
        return result
    }
}

public protocol MEQTBufferMinMax: MEQTUnsafeBuffer {
    static func maximum(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    static func maximum(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
    static func minimum(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self
    static func minimum(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    )
}

public extension MEQTBufferMinMax where Element: VectorCompare {
    static func maximum(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.maximum(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
    static func maximum(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs and result must be of same size")
        Element.maximum(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    static func minimum(
        _ lhs: Self,
        _ rhs: Self
    ) -> Self {
        precondition(lhs.count == rhs.count, "lhs and rhs must be of same size")
        var result = lhs.shapeClone()
        Element.minimum(lhs.data, rhs.data, result: &result.data, count: result.count)
        return result
    }
    static func minimum(
        _ lhs: Self,
        _ rhs: Self,
        result: inout Self
    ) {
        precondition(lhs.count == rhs.count && lhs.count == result.count, "lhs, rhs and result must be of same size")
        Element.minimum(lhs.data, rhs.data, result: &result.data, count: result.count)
    }
    
}

public protocol MEQTBufferEnvelope: MEQTUnsafeBuffer {
    static func envelope(
        _ buffer: Self,
        upperBound: Self,
        lowerBound: Self
    ) -> Self
    
    static func envelope(
        _ buffer: Self,
        upperBound: Self,
        lowerBound: Self,
        result: inout Self
    )
}

public extension MEQTBufferEnvelope where Element: VectorEnvelope {
    
    static func envelope(
        _ buffer: Self,
        upperBound: Self,
        lowerBound: Self
    ) -> Self {
        precondition(buffer.count == upperBound.count && buffer.count == lowerBound.count, "buffer, upperBound and lowerBound must be of same size.")
        var result = buffer.shapeClone()
        Element.envelope(buffer.data, upperBound: upperBound.data, lowerBound: lowerBound.data, result: &result.data, count: result.count)
        return result
    }
    
    static func envelope(
        _ buffer: Self,
        upperBound: Self,
        lowerBound: Self,
        result: inout Self
    ) {
        precondition(buffer.count == upperBound.count && buffer.count == lowerBound.count && buffer.count == result.count, "buffer, upperBound and lowerBound must be fo same size")
        Element.envelope(buffer.data, upperBound: upperBound.data, lowerBound: lowerBound.data, result: &result.data, count: result.count)
    }
}
