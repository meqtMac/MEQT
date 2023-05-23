//
//  File.swift
//  
//  Created by 蒋艺 on 2023/5/22.
//

public protocol MEQTMatrixInit: MEQTUnsafeBuffer {
    var rows: Index {get set}
    var columns: Index {get set}
    static func zeros(rows: Index, columns: Index) -> Self
    static func zeros(_ rows: Index, _ columns: Index) -> Self
    static func ones(rows: Index, columns: Index) -> Self
    static func ones(_ rows: Index, _ columns: Index) -> Self
    init(rows: Index, columns: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void)
    init(_ rows: Index, _ columns: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void)
    init(rows: Index, columns: Index, repeating: Element)
    init(_ rows: Index, _ columns: Index, _ repeating: Element)
    init(rows: Index, column: [Element])
    init(rows: Index, column: Element...)
    //    init(rows: Index, column: any MEQTVectorBuffer)
    init(columns: Index, row: [Element])
    init(columns: Index, row: Element...)
    //    init(columns: Index, row: any MEQTVectorBuffer)
    /// init with out initalize data, can't be called directroy outside module
    init(rows: Index, columns: Index)
    init(_ rows: Index, _ columns: Index)
    init(rows: Index, columns: Index, data: [Element])
    init(_ rows: Index, _ columns: Index, data: [Element])
    init(rows: Index, columns: Index, data: Element...)
    init(_ rows: Index, _ columns: Index, data: Element...)
    //    init(rows: Index, columns: Index, data: any MEQTVectorBuffer)
    
}

public extension MEQTMatrixInit where Element: VectorGeneration {
    static func zeros(rows: Index, columns: Index) -> Self {
        return Self(rows: rows, columns: columns) { buffer in
            Element.clear(buffer.baseAddress!, count: columns*rows)
        }
    }
    static func zeros(_ rows: Index, _ columns: Index) -> Self {
        zeros(rows: rows, columns: columns)
    }
    static func ones(rows: Index, columns: Index) -> Self {
        return Self(rows: rows, columns: columns) { buffer in
            Element.fill(buffer.baseAddress!, with: .one, count: rows*columns)
        }
    }
    static func ones(_ rows: Index, _ columns: Index) -> Self {
        ones(rows: rows, columns: columns)
    }
    
    init(rows: Index, columns: Index, repeating: Element) {
        self.init(rows: rows, columns: columns) { buffer in
            Element.fill(buffer.baseAddress!, with: repeating, count: rows*columns)
        }
    }
    init(_ rows: Index, _ columns: Index, _ repeating: Element) {
        self.init(rows: rows, columns: columns, repeating: repeating)
    }
    
    
    init(_ rows: Index, _ columns: Index) {
        self.init(rows: rows, columns: columns)
    }
    init(rows: Index, columns: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void) {
        Self.initIndexVaild(index: rows)
        Self.initIndexVaild(index: columns)
        self.init(rows: rows, columns: columns)
        self.data = [Element](unsafeUninitializedCapacity: rows*columns) { buffer, initializedCount in
            initializedCount = rows*columns
            initializer(&buffer)
        }
    }
    init(_ rows: Index, _ columns: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void) {
        self.init(rows: rows, columns: columns, initializer: initializer)
    }
    
   init(rows: Index, column: [Element]) {
        self.init(rows: rows, columns: column.count)
        for rowCounter in 0..<self.rows {
            for columnCount in 0..<self.columns {
                self.data[rowCounter*self.columns+columnCount] = column[columnCount]
            }
        }
    }
    
    init(rows: Index, column: Element...) {
        self.init(rows: rows, columns: column.count)
        for rowCounter in 0..<self.rows {
            for columnCount in 0..<self.columns {
                self.data[rowCounter*self.columns+columnCount] = column[columnCount]
            }
        }
    }
    //    init<T>(rows: Index, column: any MEQTVectorBuffer)   {
    //        self.init(rows: rows, columns: column.count) { buffer in
    //            for rowCounter in 0..<rows {
    //                for columnCounter in 0..<column.count {
    //                    buffer[rowCounter*self.columns + columnCounter] = column.data[columnCounter]
    //                }
    //            }
    //        }
    //    }
    init(columns: Index, row: [Element]) {
        self.init(rows: row.count, columns: columns)
        for rowCounter in 0..<self.rows {
            for columnCount in 0..<self.columns {
                self.data[rowCounter*self.columns+columnCount] = row[rowCounter]
            }
        }
    }
    
    init(columns: Index, row: Element...) {
        self.init(rows: row.count, columns: columns)
        for rowCounter in 0..<self.rows {
            for columnCount in 0..<self.columns {
                self.data[rowCounter*self.columns+columnCount] = row[rowCounter]
            }
        }
    }
    
    //    init(columns: Index, row: any MEQTVectorBuffer)
    init(rows: Index, columns: Index, data: [Element]) {
        precondition(rows*columns == data.count, "data count invaild")
        self.init(rows: rows, columns: columns)
        self.data = data
    }
    init(_ rows: Index, _ columns: Index, data: [Element]) {
        self.init(rows: rows, columns: columns, data: data)
    }
    init(rows: Index, columns: Index, data: Element...) {
        precondition(rows*columns == data.count, "data count invaild")
        self.init(rows: rows, columns: columns)
        self.data = data
    }
    init(_ rows: Index, _ columns: Index, data: Element...) {
        self.init(rows: rows, columns: columns, data: data)
    }
    func shapeClone() -> Self {
        Self(rows: self.rows, columns: self.columns)
    }
}
public protocol MEQTVectorInit: MEQTVectorBuffer where Element: Comparable {
    static func zeros(count: Index) -> Self
    static func zeros(_ count: Index) -> Self
    static func ones(count: Index) -> Self
    static func ones(_ count: Index) -> Self
    static func ramp(withInitialValue initialValue: Element,
                     increment: Element,
                     count: Int) -> Self
    static func ramp(in range: ClosedRange<Element>,
                     count: Int) -> Self
    init(count: Index, repeating: Element)
    init(_ count: Index, repeating: Element)
    init(from: [Element])
    init(literal: Element...)
}

public extension MEQTVectorInit where Element: VectorGeneration {
    static func zeros(count: Index) -> Self {
        Self(count: count) { buffer in
            Element.clear(buffer.baseAddress!, count: count)
        }
    }
    static func zeros(_ count: Index) -> Self{
        Self.zeros(count: count)
    }
    static func ones(count: Index) -> Self {
        Self(count: count) { buffer in
            Element.fill(buffer.baseAddress!, with: Element.one, count: count)
        }
    }
    static func ones(_ count: Index) -> Self {
        Self.ones(count: count)
    }
    static func ramp(withInitialValue initialValue: Element,
                     increment: Element,
                     count: Int) -> Self{
        Self(count: count) { buffer in
            Element.ramp(withInitialValue: initialValue, increment: increment, result: buffer.baseAddress!, count: count)
        }
    }
    static func ramp(in range: ClosedRange<Element>,
                     count: Int) -> Self {
        Self(count: count) { buffer in
            Element.ramp(in: range, result: buffer.baseAddress!, count: count)
        }
    }
    init(count: Index, repeating: Element) {
        self.init(count: count)
        Element.fill(&self.data, with: repeating, count: count)
    }
    init(_ count: Index, repeating: Element) {
        self.init(count: count, repeating: repeating)
    }
    init(count: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void) {
        self.init(count: count)
        self.data.withUnsafeMutableBufferPointer { buffer in
            initializer(&buffer)
        }
    }
    
    init(from array: [Element]) {
        self.init(count: array.count)
        for i in 0..<array.count{
            self.data[i] = array[i]
        }
    }
    init(literal: Element...) {
        self.init(count: literal.count)
        for i in 0..<literal.count {
            self.data[i] = literal[i]
        }
    }
    func shapeClone() -> Self {
        Self(count: self.count)
    }
    
}

