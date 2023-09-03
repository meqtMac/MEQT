//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/7.
//

import Foundation
import MEQT

typealias Matrix = MEQTMatrix<Double>
typealias Vector = MEQTVector<Double>
@resultBuilder
struct ArrayBuilder {
    typealias Component = [Double]
    typealias Expression = Double
    static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }
    static func buildExpression(_ element: Component) -> Component {
        return element
    }
   static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }
    static func buildEither(first component: Component) -> Component {
        return component
    }
    static func buildEither(second component: Component) -> Component {
        return component
    }
    static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }
    static func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
}

extension Matrix {
    public init(_ rows: Index, _ columns: Index, @ArrayBuilder buffer: () -> [Double]) {
        self.init(rows: rows, columns: columns, data: buffer())
    }
}

@resultBuilder
struct MatrixRowBuilder {
    static func buildExpression(_ element: [Double]) -> Matrix{
        return Matrix(rows: 1, columns: element.count, data: element)
    }
    static func buildExpression(_ element: Vector) -> Matrix{
        return Matrix(rows: 1, columns: element.count, data: element)
    }
    static func buildExpression(_ element: Matrix) -> Matrix{
        return element
    }
    static func buildOptional(_ component: Matrix?) -> Matrix {
        guard let component = component else { fatalError() }
        return component
    }
    static func buildEither(first component: Matrix) -> Matrix {
        return component
    }
    static func buildEither(second component: Matrix) -> Matrix{
        return component
    }
    static func buildArray(_ components: [Matrix]) -> Matrix{
        guard let columns = components.first?.columns else {
            fatalError()
        }
        var rows = 0
        for component in components {
            if component.columns != columns {
                fatalError()
            }
            rows += component.rows
        }
        var buffer = [Double](unsafeUninitializedCapacity: rows*columns) { buffer, initializedCount in
            initializedCount = 0
        }
        for component in components {
            buffer.append(contentsOf: component.data)
        }
        return Matrix(rows: rows, columns:  columns, data: buffer)
    }
    static func buildBlock(_ components: Matrix...) -> Matrix {
        guard let columns = components.first?.columns else {
            fatalError()
        }
        var rows = 0
        for component in components {
            if component.columns != columns {
                fatalError()
            }
            rows += component.rows
        }
        var buffer = [Double](unsafeUninitializedCapacity: rows*columns) { buffer, initializedCount in
            initializedCount = 0
        }
        for component in components {
            buffer.append(contentsOf: component.data)
        }
        return Matrix(rows: rows, columns:  columns, data: buffer)
    }
}

@resultBuilder
struct MatrixColumnBuilder {
    static func buildExpression(_ element: [Double]) -> Matrix{
        return Matrix(rows: element.count, columns: 1, data: element)
    }
    static func buildExpression(_ element: Vector) -> Matrix{
        return Matrix(rows: element.count, columns: 1, data: element)
    }
    static func buildExpression(_ element: Matrix) -> Matrix{
        return element
    }
    static func buildOptional(_ component: Matrix?) -> Matrix {
        guard let component = component else { fatalError() }
        return component
    }
    static func buildEither(first component: Matrix) -> Matrix {
        return component
    }
    static func buildEither(second component: Matrix) -> Matrix{
        return component
    }
    static func buildArray(_ components: [Matrix]) -> Matrix{
       guard let rows = components.first?.rows else {
            fatalError()
        }
        var columns = 0
        for component in components {
            if component.rows != rows {
                fatalError()
            }
            columns += component.columns
        }
        var buffer = [Double](unsafeUninitializedCapacity: rows*columns) { buffer, initializedCount in
            initializedCount = 0
        }
        for component in components {
            buffer.append(contentsOf: component.T.data)
        }
        return Matrix(rows: columns, columns:  rows, data: buffer).T
    }
    static func buildBlock(_ components: Matrix...) -> Matrix {
        guard let rows = components.first?.rows else {
            fatalError()
        }
        var columns = 0
        for component in components {
            if component.rows != rows {
                fatalError()
            }
            columns += component.columns
        }
        var buffer = [Double](unsafeUninitializedCapacity: rows*columns) { buffer, initializedCount in
            initializedCount = 0
        }
        for component in components {
            buffer.append(contentsOf: component.T.data)
        }
        return Matrix(rows: columns, columns:  rows, data: buffer).T
        
    }
}

func Rows(@MatrixRowBuilder buffer: () -> Matrix) -> Matrix {
    return buffer()
}

func Columns(@MatrixColumnBuilder buffer: () -> Matrix) -> Matrix {
    return buffer()
}

let A = Matrix(3, 3) {
    [1, 0, 0]
    [0, 1, 0]
    [0, 0, 1]
}
let B: [Double] = [1, 1, 1]
let C = Columns {
    A; B
}
let D = Rows {
    [0, 0, 0, 1]
}
let E = Rows {
    C
    D
}

print(A)
print(B)
print(C)
print(D)
print(E)
