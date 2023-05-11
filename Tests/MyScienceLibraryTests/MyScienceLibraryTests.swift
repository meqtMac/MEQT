import XCTest
import Accelerate
import SwiftUI
@testable import MyScienceLibrary

final class MyScienceLibraryTests: XCTestCase {
    public static let width = 1024
    public static let height = 1024
    public static let size = width * height
    var ltArr2Dd = LTArray2D<Double>.linspace(start: 0, end: 1.0, width: size)
    var holder = vDSP.ramp(in: 0...0.0, count: size)
    var array = vDSP.ramp(in: 0...1.0, count: size)
    override func measure(_ block: () -> Void) {
        measure(metrics: [XCTCPUMetric(), XCTClockMetric(), XCTMemoryMetric(), XCTStorageMetric()], block: block)
    }
    
   
    public func testReshape() throws {
        let width = 128
        let height = 156
        let lt = LTArray2D<Float>(width: width, height: height)
        lt.inPlaceReshape(width: height, height: width)
        XCTAssertEqual(lt.width, height)
        XCTAssertEqual(lt.height, width)
    }

    public func testFloatAllocation() throws {
        measure {
            let _ = LTArray2D<Float>(repeating: Float(1.0), width: Self.size, height: 1)
        }
    }
    
    public func testFloatAllocationStd() throws {
        measure {
            let _ = [Float](repeating: Float(1.0), count: Self.size)
        }
    }
    
    public func testFloatFill() throws {
        measure {
            vDSP.fill(&holder, with: 1.0)
        }
    }
    
    public func testFloatConstRampIn() throws {
        measure {
            let _ = vDSP.ramp(in: 0...Float(0), count: Self.size)
        }
    }
    
    public func testFloatConstRampInit() throws {
        measure {
            let _ = vDSP.ramp(withInitialValue: Float(0), increment: Float(0), count: Self.size)
        }
    }
    
//    public func testFloatInitRepeat() throws {
//        measure {
//        }
//    }
    
    public func testCos() {
        measure() {
            vForce.cos(ltArr2Dd, result: &holder)
        }
    }
    
    public func testCosArray() {
        measure {
            vForce.cos(array, result: &holder)
        }
    }
    
    public func testCosReturn() {
        measure {
            let _ = vForce.cos(ltArr2Dd)
        }
        
    }
    
    public func testCosReturnArray() {
        measure {
            let _ = vForce.cos(array)
        }
    }
    
    public func testSin() {
        measure() {
            vForce.sin(ltArr2Dd, result: &holder)
        }
    }
    
    public func testSinArray() {
        measure {
            vForce.sin(array, result: &holder)
        }
    }
    
    public func testSinReturn() {
        measure {
            let _ = vForce.sin(ltArr2Dd)
        }
    }
    
    public func testSinArrayReturn() {
        measure {
            let _ = vForce.sin(array)
        }
    }
    
    public func testExp() {
        measure() {
            vForce.exp(ltArr2Dd, result: &holder)
        }
    }
    
    public func testExpArray() {
        measure {
            vForce.exp(array, result: &holder)
        }
    }
    
    public func testLog() {
        measure() {
            vForce.log(ltArr2Dd, result: &holder)
        }
    }
    
    public func testLogArray() {
        measure {
            vForce.log(array, result: &holder)
        }
    }
    
    public func testSqrt() {
        measure {
            vForce.sqrt(ltArr2Dd, result: &holder)
        }
    }
    
    public func testSqrtArray() {
        measure {
            vForce.sqrt(array, result: &holder)
        }
    }
    
    public func testMmul() {
        let M = 1024
        let N = 1024
        let P = 1024
        let x = vDSP.ramp(in: -1.0...1.0, count: M * N)
        let y = vDSP.ramp(in: -1.0...1.0, count: N * P)
        var result = vDSP.ramp(withInitialValue: 0.0, increment: 0.0, count:  M * P)
        measure {
            vDSP_mmulD(x, vDSP_Stride(1), y, vDSP_Stride(1), &result, vDSP_Stride(1), vDSP_Length(M), vDSP_Length(N), vDSP_Length(P))
        }
    }
    
//    vImageBuffer
    
    public func testArrayRampIn() {
        measure {
            let _ = vDSP.ramp(in: 0...1.0, count: MyScienceLibraryTests.size)
        }
    }
    
    public func testLTArray2DLinspace() {
        measure {
            let _ = LTArray2D<Double>.linspace(start: 0, end: 1.0, width: MyScienceLibraryTests.size)
        }
        
    }
}
