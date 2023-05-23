//
//  MatrixSpeedTests.swift
//  
//
//  Created by 蒋艺 on 2023/5/11.
//

import XCTest
import Accelerate

final class MatrixSpeedTests: XCTestCase {

    override func measure(_ block: () -> Void) {
        measure(metrics: [XCTCPUMetric(), XCTClockMetric(), XCTMemoryMetric(), XCTStorageMetric()], block: block)
    }
    
    func testPerformanceMmulFloat00320032() throws {
        let width = 0032
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00320128() throws {
        let width = 0032
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00320256() throws {
        let width = 0032
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00320512() throws {
        let width = 0032
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00321024() throws {
        let width = 0032
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00322048() throws {
        let width = 0032
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00324096() throws {
        let width = 0032
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat00328192() throws {
        let width = 0032
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01280032() throws {
        let width = 0128
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01280128() throws {
        let width = 0128
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01280256() throws {
        let width = 0128
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01280512() throws {
        let width = 0128
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01281024() throws {
        let width = 0128
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01282048() throws {
        let width = 0128
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01284096() throws {
        let width = 0128
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat01288192() throws {
        let width = 0128
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02560032() throws {
        let width = 0256
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02560128() throws {
        let width = 0256
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02560256() throws {
        let width = 0256
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02560512() throws {
        let width = 0256
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02561024() throws {
        let width = 0256
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02562048() throws {
        let width = 0256
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02564096() throws {
        let width = 0256
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat02568192() throws {
        let width = 0256
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05120032() throws {
        let width = 0512
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05120128() throws {
        let width = 0512
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05120256() throws {
        let width = 0512
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05120512() throws {
        let width = 0512
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05121024() throws {
        let width = 0512
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05122048() throws {
        let width = 0512
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05124096() throws {
        let width = 0512
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat05128192() throws {
        let width = 0512
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10240032() throws {
        let width = 1024
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10240128() throws {
        let width = 1024
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10240256() throws {
        let width = 1024
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10240512() throws {
        let width = 1024
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10241024() throws {
        let width = 1024
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10242048() throws {
        let width = 1024
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10244096() throws {
        let width = 1024
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat10248192() throws {
        let width = 1024
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20480032() throws {
        let width = 2048
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20480128() throws {
        let width = 2048
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20480256() throws {
        let width = 2048
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20480512() throws {
        let width = 2048
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20481024() throws {
        let width = 2048
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20482048() throws {
        let width = 2048
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20484096() throws {
        let width = 2048
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat20488192() throws {
        let width = 2048
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40960032() throws {
        let width = 4096
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40960128() throws {
        let width = 4096
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40960256() throws {
        let width = 4096
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40960512() throws {
        let width = 4096
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40961024() throws {
        let width = 4096
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40962048() throws {
        let width = 4096
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40964096() throws {
        let width = 4096
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat40968192() throws {
        let width = 4096
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81920032() throws {
        let width = 8192
        let height = 0032
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81920128() throws {
        let width = 8192
        let height = 0128
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81920256() throws {
        let width = 8192
        let height = 0256
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81920512() throws {
        let width = 8192
        let height = 0512
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81921024() throws {
        let width = 8192
        let height = 1024
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81922048() throws {
        let width = 8192
        let height = 2048
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81924096() throws {
        let width = 8192
        let height = 4096
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulFloat81928192() throws {
        let width = 8192
        let height = 8192
        let x = vDSP.ramp(in: 0...Float(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Float(1.0), count: height*width)
        var result = [Float](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmul(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00320032() throws {
        let width = 0032
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00320128() throws {
        let width = 0032
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00320256() throws {
        let width = 0032
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00320512() throws {
        let width = 0032
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00321024() throws {
        let width = 0032
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00322048() throws {
        let width = 0032
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00324096() throws {
        let width = 0032
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble00328192() throws {
        let width = 0032
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01280032() throws {
        let width = 0128
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01280128() throws {
        let width = 0128
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01280256() throws {
        let width = 0128
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01280512() throws {
        let width = 0128
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01281024() throws {
        let width = 0128
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01282048() throws {
        let width = 0128
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01284096() throws {
        let width = 0128
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble01288192() throws {
        let width = 0128
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02560032() throws {
        let width = 0256
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02560128() throws {
        let width = 0256
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02560256() throws {
        let width = 0256
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02560512() throws {
        let width = 0256
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02561024() throws {
        let width = 0256
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02562048() throws {
        let width = 0256
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02564096() throws {
        let width = 0256
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble02568192() throws {
        let width = 0256
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05120032() throws {
        let width = 0512
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05120128() throws {
        let width = 0512
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05120256() throws {
        let width = 0512
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05120512() throws {
        let width = 0512
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05121024() throws {
        let width = 0512
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05122048() throws {
        let width = 0512
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05124096() throws {
        let width = 0512
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble05128192() throws {
        let width = 0512
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10240032() throws {
        let width = 1024
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10240128() throws {
        let width = 1024
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10240256() throws {
        let width = 1024
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10240512() throws {
        let width = 1024
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10241024() throws {
        let width = 1024
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10242048() throws {
        let width = 1024
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10244096() throws {
        let width = 1024
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble10248192() throws {
        let width = 1024
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20480032() throws {
        let width = 2048
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20480128() throws {
        let width = 2048
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20480256() throws {
        let width = 2048
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20480512() throws {
        let width = 2048
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20481024() throws {
        let width = 2048
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20482048() throws {
        let width = 2048
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20484096() throws {
        let width = 2048
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble20488192() throws {
        let width = 2048
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40960032() throws {
        let width = 4096
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40960128() throws {
        let width = 4096
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40960256() throws {
        let width = 4096
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40960512() throws {
        let width = 4096
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40961024() throws {
        let width = 4096
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40962048() throws {
        let width = 4096
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40964096() throws {
        let width = 4096
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble40968192() throws {
        let width = 4096
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81920032() throws {
        let width = 8192
        let height = 0032
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81920128() throws {
        let width = 8192
        let height = 0128
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81920256() throws {
        let width = 8192
        let height = 0256
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81920512() throws {
        let width = 8192
        let height = 0512
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81921024() throws {
        let width = 8192
        let height = 1024
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81922048() throws {
        let width = 8192
        let height = 2048
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81924096() throws {
        let width = 8192
        let height = 4096
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
    
    func testPerformanceMmulDouble81928192() throws {
        let width = 8192
        let height = 8192
        let x = vDSP.ramp(in: 0...Double(1.0), count: width*height)
        let y = vDSP.ramp(in: 0...Double(1.0), count: height*width)
        var result = [Double](unsafeUninitializedCapacity: width*width) { buffer, initializedCount in
            initializedCount = width*width
        }
        measure {
            vDSP_mmulD(x, 1, y, 1, &result, 1, vDSP_Length(width), vDSP_Length(width), vDSP_Length(height))
        }
    }
}
