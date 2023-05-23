//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/21.
//


public protocol MEQTBufferTransform: MEQTUnsafeBuffer {
   /// Computes single-precision mean and standard deviation, and then calculates new elements to have a zero mean and a unit standard deviation.
    static func normalize(_ buffer: inout Self)
    static func normalized(_ buffer: Self) -> Self
}

public extension MEQTBufferTransform where Element: VectorTransform {
    static func normalize(_ buffer: inout Self) {
        Element.normalize(buffer.data, result: &buffer.data, count: buffer.count)
    }
    static func normalized(_ buffer: Self) -> Self {
        var result = buffer.shapeClone()
        Element.normalize(buffer.data, result: &result.data, count: result.count)
        return result
    }
}

// MARK: Vector specific
public extension MEQTVectorBuffer where Element: VectorReverse {
    static func reverse(_ buffer: inout Self) {
        Element.reverse(&buffer.data, count: buffer.count)
    }
    static func reversed(_ buffer: Self) -> Self {
        var result = buffer
        Element.reverse(&result.data, count: result.count)
        return result
    }
}

public extension MEQTVectorBuffer where Element: VectorSort {
    static func sort(_ buffer: inout Self, using sortOrder: SortOrder) {
        Element.sort(&buffer.data, sortOrder: sortOrder, count: buffer.count)
    }
    static func sorted(_ buffer: Self, using sortOrder: SortOrder) -> Self {
        var result = buffer
        Element.sort(&result.data, sortOrder: sortOrder, count: result.count)
        return result
    }
}

public extension MEQTVectorBuffer where Element: VectorIntegrate {
    static func intergrate(
        _ buffer: Self,
        using rule: IntegrationRule,
        stepSize: Element
    ) -> Self {
        var result = buffer.shapeClone()
        Element.integrate(buffer.data, using: rule, result: &result.data, stepSize: stepSize, count: result.count)
        return result
    }
}
