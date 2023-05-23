//
//  FunctionVarientSpeedTest.swift
//  
//
//  Created by 蒋艺 on 2023/5/15.
//

import XCTest
import Accelerate
import simd

final class FunctionVarientSpeedTest: XCTestCase {
    static let size = 1024*1024
    let floatArray = vDSP.ramp(in: -2*Float.pi...2*Float.pi, count: size)
    
    let doubleArray = vDSP.ramp(in: -2*Double.pi...2*Double.pi, count: size)
    let simdArray = Array(repeating: SIMD8(repeating: 1.0), count: size/8)
    override func measure(_ block: () -> Void) {
        measure(metrics: [XCTCPUMetric(), XCTClockMetric(), XCTMemoryMetric()], block: block)
    }
    
    func testFloatArrayCosRangeAssign() throws {
        var arr = [Float](repeating: 0, count: Self.size)
        measure {
            for i in 0..<floatArray.count {
                arr[i] = cos(floatArray[i])
            }
        }
    }
    
    func testFloatArrayCosMapReturn() throws {
        measure {
            let _ = floatArray.map { cos($0) }
        }
    }
    
    func testFloatArrayCosAccelerateReturn() throws {
        measure {
            let _ = vForce.cos(floatArray)
        }
    }
    
    func testFloatArrayCosAccelerateAssign() throws {
        var arr = [Float](repeating: 0, count: Self.size)
        measure {
            vForce.cos(floatArray, result: &arr)
        }
    }
    
    func testSIMDdArrayCosMapReturn() throws {
        measure {
            let _ = simdArray.map{cos($0)}
        }
    }
    
}
