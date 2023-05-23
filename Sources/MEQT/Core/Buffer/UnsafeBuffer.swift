//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/21.
//

public protocol MEQTUnsafeBuffer: MEQTBuffer {
    func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R
    
    mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) -> R) -> R
    
    /// clone shape with value unintialized
    func shapeClone() -> Self
    
    @inlinable
    static func initIndexVaild(index: Index)
}

public extension MEQTUnsafeBuffer where Element: VectorGeneration {
    mutating func clear() {
        Element.clear(&data, count: self.count)
    }
    mutating func fill(with value: Element) {
        Element.fill(&data, with: value, count: self.count)
    }
}

public extension MEQTUnsafeBuffer {
    func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R {
        try data.withUnsafeBufferPointer(body)
    }
    
    mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) -> R) -> R {
        data.withUnsafeMutableBufferPointer(body)
    }
    
    /// use precondition to set index is valid
    @inlinable
    static func initIndexVaild(index: Index) {
        precondition(index > 0, "index invalid")
    }
    
    
}

