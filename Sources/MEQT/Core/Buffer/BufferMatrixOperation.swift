//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

public protocol MEQTMatrixBuffer: MEQTUnsafeBuffer & MEQTBufferCombine & MEQTBufferMap & MEQTBufferReduce & MEQTBufferTransform & MEQTBufferGeneration & CustomStringConvertible  {
    var rows: Index { get set }
    var columns: Index { get set }
    @inlinable
    func indexIsValid(row: Index, column: Index)
    @inlinable
    subscript(row: Index, column: Index) -> Element { get set }
    
    @inlinable
    func indexRangeIsVaild<R>(rows: R, columns: R) where R: IndexRange
    @inlinable
    subscript<R>(rows: R, columns: R) -> Self where R: IndexRange { get set }
    
    var T: Self { get }
    static func transpose(_ source: Self) -> Self
    static func mmul(_ lhs: Self, _ rhs: Self) -> Self
    func mmul(_ rhs: Self) -> Self
    init(rows: Index, columns: Index, repeating: Element)
    init(rows: Index, columns: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void )
    /// init with value unintialized
    init(rows: Index, columns: Index)
}

public extension MEQTMatrixBuffer where Element: MEQTMatrixElement {
    @inlinable
    func indexIsValid(row: Index, column: Index) {
        precondition(row >= 0 && column >= 0  && row < rows && column < columns, "index invalid")
    }
    
    @inlinable
    subscript(row: Index, column: Index) -> Element {
        get {
            indexIsValid(row: row, column: column)
            return data[row * columns + column]
        }
        set {
            indexIsValid(row: row, column: column)
            data[row * columns + column] = newValue
        }
    }
    
    @inlinable
    func indexRangeIsVaild<R>(rows: R, columns: R) where R: IndexRange {
        indexIsValid(row: rows.startIndex(), column: columns.startIndex())
        indexIsValid(row: rows.endIndex(cutBy: self.rows), column: columns.endIndex(cutBy: self.columns) )
    }
    
    @inlinable
    subscript<R>(rows: R, columns: R) -> Self where R: IndexRange {
        get {
            self.indexRangeIsVaild(rows: rows, columns: columns)
            let subRows = rows.count(cutBy: self.rows)
            let subColumns = columns.count(cutBy: self.columns)
            let rowStart = rows.startIndex()
            let columnsStart = columns.startIndex()
            
            return Self(
                rows: rows.count(cutBy: self.rows),
                columns: columns.count(cutBy: self.columns)) { buffer in
                    self.withUnsafeBufferPointer { sourceBuffer in
                        let sPtr = sourceBuffer.baseAddress!.advanced(by: rowStart * self.columns + columnsStart)
                         Element.matrixMove(
                            from: sPtr,
                            to: buffer.baseAddress!,
                            subMatrixColumns: subColumns,
                            subMatrixRows: subRows,
                            sourceColumns: self.columns,
                            destinationColumns: subColumns
                         )
                    }
               }
        }
        set {
            self.indexRangeIsVaild(rows: rows, columns: columns)
            
            let subRows = rows.count(cutBy: self.rows)
            let subColumns = columns.count(cutBy: self.columns)
            let rowStart = rows.startIndex()
            let columnsStart = columns.startIndex()
            precondition(subColumns == newValue.columns && subRows == newValue.rows, "newValue shape doesn't match" )
            
            var result = self
            result.withUnsafeMutableBufferPointer { rBuffer in
                let rPtr = rBuffer.baseAddress!.advanced(by: rowStart*self.columns + columnsStart)
                Element.matrixMove(from: newValue.data, to: rPtr, subMatrixColumns: subColumns, subMatrixRows: subRows, sourceColumns: newValue.columns, destinationColumns: self.columns)
            }
            self = result
       }
    }
    static func transpose(_ source: Self) -> Self {
        Self.init(rows: source.columns, columns: source.rows) { resultBufferPtr in
                Element.matrixTranpose(
                    from: source.data,
                    to: resultBufferPtr.baseAddress!,
                    sourceColumns: source.columns,
                    sourceRows: source.rows
                )
            }
    }
    var T: Self { Self.transpose(self) }
    static func mmul(_ lhs: Self, _ rhs: Self) -> Self {
        precondition(lhs.columns == rhs.rows, "lhs and rhs not multipliable")
        return Self.init(rows: lhs.rows, columns: rhs.columns) { buffer in
            Element.matrixMultiply(
                lhs: lhs.data,
                rhs: rhs.data,
                result: buffer.baseAddress!,
                resultRows: lhs.rows,
                resultColumns: rhs.columns,
                leftColumnsAndrightRows: lhs.columns
            )
        }
    }
    func mmul(_ rhs: Self) -> Self {
        Self.mmul(self, rhs)
    }
}

public extension MEQTMatrixBuffer where Element: MEQTElementDescriptable {
    var description: String {
        let maxRows = min(rows, 8)
        let maxColumns = min(columns, 8)
        var result = ""
        
        result += "(\(rows), \(columns))\n"
        
        for i in 0..<maxRows {
            for j in 0..<maxColumns {
                let index = i * columns + j
                let value = data[index]
                
                result += value.descript + "\t"
            }
            
            if columns > maxColumns {
                result += "⋯\t"
            }
            result += "\n"
        }
        
        if rows > maxRows {
            for _ in 0..<maxColumns {
                result += "⋮\t"
            }
            if columns > maxColumns {
                result += "⋱\n"
            }
        }
        return result
    }
}
public protocol MEQTVectorBuffer: MEQTUnsafeBuffer & MEQTBufferCombine & MEQTBufferMap & MEQTBufferReduce & MEQTBufferTransform & MEQTBufferGeneration where Element : Comparable {
    @inlinable
    subscript(index: Index) -> Element { get set }
    
    @inlinable
    func indexRangeIsVaild<R>(range: R) where R: IndexRange
    subscript<R>(range: R) -> Self where R: IndexRange { get set }
    
    /// init with value uninitalized
    init(count: Index)
    init(count: Index, repeating: Element)
    init(count: Index, initializer: (inout UnsafeMutableBufferPointer<Element>) -> Void )
}

public extension MEQTVectorBuffer where Element: MEQTMatrixElement {
    @inlinable
    subscript(index: Index) -> Element {
        get {
            return data[index]
        }
        set {
            data[index] = newValue
        }
    }
    
    @inlinable
    func indexRangeIsVaild<R>(range: R) where R: IndexRange {
        precondition(0 <= range.startIndex() && range.endIndex(cutBy: count) < count, "index range invaild")
    }
    subscript<R>(range: R) -> Self where R: IndexRange {
        get {
            indexRangeIsVaild(range: range)
            return Self(count: range.count(cutBy: count)) { buffer in
                self.withUnsafeBufferPointer { sBuffer in
                    let sPtr = sBuffer.baseAddress!.advanced(by: range.startIndex())
                    Element.matrixMove(from: sPtr, to: buffer.baseAddress!, subMatrixColumns: range.count(cutBy: count), subMatrixRows: 1, sourceColumns: count, destinationColumns: range.count(cutBy: count))
                }
            }
        }
        set {
            indexRangeIsVaild(range: range)
            let subCount = range.count(cutBy: count)
            let subStart = range.startIndex()
            var result = self
            result.withUnsafeMutableBufferPointer { rBuffer in
                let rPtr = rBuffer.baseAddress!.advanced(by: subStart)
                Element.matrixMove(from: newValue.data, to: rPtr, subMatrixColumns: subCount, subMatrixRows: 1, sourceColumns: subCount, destinationColumns: self.count)
            }
            self = result
        }
            
    }
}

//MARK: Index Range
public protocol IndexRange {
    func startIndex() -> MEQTBuffer.Index
    func endIndex(cutBy count: MEQTBuffer.Index) -> MEQTBuffer.Index
}
extension IndexRange {
    public func count(cutBy count: MEQTBuffer.Index) -> MEQTBuffer.Index {
        self.endIndex(cutBy: count) - self.startIndex() + 1
    }
}

extension ClosedRange: IndexRange  where Bound == Int {
    public func startIndex() -> Int { lowerBound }
    public func endIndex(cutBy count: Int) -> Int { upperBound }
}

extension PartialRangeFrom: IndexRange where Bound == Int {
    public func startIndex() -> Int { lowerBound }
    public func endIndex(cutBy count: Int) -> Int { count - 1 }
}

extension PartialRangeThrough: IndexRange where Bound == Int {
    public func startIndex() -> Int { 0 }
    public func endIndex(cutBy count: Int) -> Int { upperBound }
}

extension PartialRangeUpTo: IndexRange where Bound == Int {
    public func startIndex() -> Int { 0 }
    public func endIndex(cutBy count: Int) -> Int { upperBound - 1 }
}

extension Range: IndexRange where Bound == Int {
    public func startIndex() -> Int { lowerBound }
    public func endIndex(cutBy count: Int) -> Int { upperBound - 1 }
}

