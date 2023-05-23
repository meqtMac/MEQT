//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/21.
//

public protocol MEQTBufferGeneration: MEQTUnsafeBuffer where Element: Comparable {
    mutating func clear()
    mutating func fill(with value: Element)
}


public extension MEQTBufferGeneration where Element: VectorGeneration {
   mutating func clear() {
        Element.clear(&self.data, count: self.count)
    }
    mutating func fill(with value: Element) {
        Element.fill(&self.data, with: value, count: self.count)
    }
}

// MARK: Vector Only
public extension MEQTVectorBuffer where Element: VectorGeneration {
         static func ramp(
            withInitialValue initialValue: Element,
            increment: Element,
            count: Int
        ) -> Self {
            var result = Self(count: count)
            Element.ramp(withInitialValue: initialValue, increment: increment, result: &result.data, count: count)
            return result
        }
        static func ramp(
            in range: ClosedRange<Element>,
            count: Int
        ) -> Self {
            var result = Self(count: count)
            Element.ramp(in: range, result: &result.data, count: count)
            return result
        }
        mutating func formRamp(
            withInitialValue initialValue: Element,
            increment: Element
        ) {
            Element.ramp(withInitialValue: initialValue, increment: increment, result: &self.data, count: self.count)
        }
        mutating func formRamp(
            in range: ClosedRange<Element>
        ) {
            Element.ramp(in: range, result: &self.data, count: self.count)
        }
    
}
