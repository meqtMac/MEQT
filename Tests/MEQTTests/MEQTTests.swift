import XCTest
import Accelerate
@testable import MEQT

final class MEQTTests: XCTestCase {
    public static let rows = 1024
    public static let columns = 1024
    public static let count = rows * columns
    typealias Matrix = MEQTMatrix<Double>
    typealias Vector = MEQTVector<Double>
    override func measure(_ block: () -> Void) {
        measure(metrics: [XCTCPUMetric(), XCTClockMetric(), XCTMemoryMetric()], block: block)
    }
    func testMdCos() throws {
        let m = Matrix(rows: Self.rows, columns: Self.columns, repeating: .one)
        measure {
            let _ = cos(m)
       }
    }
    
    func testMdCosA() throws {
        let m = Matrix(rows: Self.rows, columns: Self.columns, repeating: .one)
        var holder = Matrix(rows: Self.rows, columns: Self.columns)
        measure {
            cos(m, result: &holder)
        }
    }
    
    func testVdCos() throws {
        let v = Vector(count: Self.count, repeating: 1.0)
        measure {
            let _ = cos(v)
        }
    }
    func testVdCosA() throws {
        let v = Vector(count: Self.count, repeating: 1.0)
        var holder = Vector(count: Self.count)
        measure {
            cos(v , result: &holder)
        }
    }
    func testVdFCos() throws {
        let arr = Vector(count: Self.count, repeating: 1.0)
        measure {
            let _ = vForce.cos(arr.data)
        }
    }
    func testVdFCosA() throws {
        let arr = Vector(count: Self.count, repeating: 1.0)
        var holder = Vector(count: Self.count)
        measure {
            let _ = vForce.cos(arr.data)
            vForce.cos(arr.data, result: &holder.data)
        }
    }
    
    func testArrdFCos() throws {
        let arr = [Double](repeating: 1.0, count: Self.count)
        measure {
            let _ = vForce.cos(arr)
        }
    }
    
    func testArrdFCosA() throws {
        let arr = [Double](repeating: 1.0, count: Self.count)
        var holder = [Double](repeating: 0.0, count: Self.count)
        measure{
            vForce.cos(arr, result: &holder)
        }
    }
}
