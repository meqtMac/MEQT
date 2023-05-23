//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

//import Foundation

/// A type that represents an immutable buffer.
public protocol MEQTBuffer {
    associatedtype Element
    typealias Index = Int
    var count: Index { get }
    var data: [Element] {get set }
}

protocol MEQTMatrixProtocol: MEQTBuffer & CustomStringConvertible {
    var rows: Index { get set }
    var columns: Index { get set }
    
    @inlinable
    func indexIsValid(row: Index, column: Index)
    @inlinable
    subscript(row: Index, column: Index) -> Element { get set }
    
    init(rows: Index, columns: Index, repeating: Element)
    init(rows: Index, columns: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void )
}

/// Matrix Protocol without advanced operation
extension MEQTMatrixProtocol {
    @inlinable
    public func indexIsValid(row: Index, column: Index) {
        precondition(0 <= row && row < self.rows && 0 <= column && column < self.columns, "index invalid")
    }
    @inlinable
    public subscript(row: Index, column: Index) -> Element {
        get {
            indexIsValid(row: row, column: column   )
            return data[row*columns+column]
        }
        set {
            indexIsValid(row: row, column: column)
            data[row*columns+column] = newValue
        }
    }
}

/// Vector Protocol without advaned operation
protocol MEQTVectorProtocol: MEQTBuffer & CustomStringConvertible {
    subscript(index: Index) -> Element { get set }
    init(count: Index, repeating: Element)
    init(count: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void)
}

extension MEQTVectorProtocol {
    public subscript(index: Index) -> Element {
        get {
            data[index]
        }
        set {
            data[index] = newValue
        }
    }
}
