//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

#if canImport(Accelerate)
public struct MEQTMatrix<Element>: MEQTMatrixBuffer & MEQTMatrixInit where Element: MEQTElement {
    public var rows: Index
    public var columns: Index
    public var data: [Element]
    public var count: Index { rows * columns}
    
    /// init without initialize value, can't be called outside Module
    public init(rows: Index, columns: Index) {
        Self.initIndexVaild(index: rows)
        Self.initIndexVaild(index: columns)
        self.rows = rows
        self.columns = columns
        self.data = [Element](unsafeUninitializedCapacity: rows*columns) { buffer, initializedCount in
            initializedCount = rows*columns
        }
    }
    
    // MARK: extension
    public init(rows: Index, column: MEQTVector<Element>) {
        let columns = column.count
        self.init(rows: rows, columns: columns)
        for rowCounter in 0..<self.rows {
            for columnCount in 0..<self.columns {
                self.data[rowCounter*self.columns+columnCount] = column.data[columnCount]
            }
        }
    }
    public init(columns: Index, row: MEQTVector<Element>) {
        let rows = row.count
        self.init(rows: rows, columns: columns)
        for rowCounter in 0..<self.rows {
            for columnCount in 0..<self.columns {
                self.data[rowCounter*self.columns+columnCount] = row.data[columnCount]
            }
        }
    }
    public init(rows: Index, columns: Index, data: MEQTVector<Element>) {
        self.init(rows: rows, columns: columns, data: data.data)
    }
    public init(_ rows: Index, _ columns: Index, data: MEQTVector<Element>) {
        self.init(rows: rows, columns: columns, data: data.data)
    }
}


public struct MEQTVector<Element>: MEQTVectorBuffer & MEQTVectorInit where Element: MEQTElement {
    public var count: Index
    public var data: [Element]
    
    /// init without initialize value, can't be called outside Module
    public init(count: Index) {
        Self.initIndexVaild(index: count)
        self.count = count
        self.data = [Element](unsafeUninitializedCapacity: count) { buffer, initializedCount in
            initializedCount = count
        }
    }
}
#endif
