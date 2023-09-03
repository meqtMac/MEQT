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
    
    func testPerformanceMmulFloat32x32() throws {
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
    
   
    func testPerformanceMmulFloat128x128() throws {
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
    
    func testPerformanceMmulFloat1024x1024() throws {
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
    
    func testPerformanceMmulFloat2048x2048() throws {
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
   
   
    func testPerformanceMmulFloat4096x4096() throws {
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
    

}
