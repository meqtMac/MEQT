//
//  ArrayInitTest.swift
//  
//
//  Created by 蒋艺 on 2023/5/11.
//

import XCTest
import Accelerate

final class ArrayInitTests: XCTestCase {
    let size = 1024*1024
    let repeatVal1 = 131.1231
    
    override func measure(_ block: () -> Void) {
        measure(metrics: [XCTCPUMetric(), XCTClockMetric(), XCTMemoryMetric()], block: block)
    }
    
    func testIntArrayRepeatingInit() throws {
        let val = Int(repeatVal1)
        measure {
             let _ = [Int](repeating: val, count: size)
        }
    }
   
    func testFloatArrayRepeatingInit() throws {
        let val = Float(repeatVal1)
        measure {
            let _ = [Float](repeating: val, count: size)
        }
    }
   
    func testDoubleArrayRepeatingInit() throws {
        let val = Double(repeatVal1)
        measure {
            let _ = [Double](repeating: val, count: size)
        }
    }
    
    func testFloatArrayUninit() throws {
        measure {
            let _ = [Float](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
        }
    }
    
    func testDoubleArrayUninit() throws {
        measure {
            let _ = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
        }
    }
    
    func testIntArrayUninit() throws {
        measure {
            let _ = [Int](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
        }
    }
    
    func testDoubleArrayFill() throws {
        let val = Double(repeatVal1)
        measure {
            var uninit = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
            vDSP.fill(&uninit, with: val)
        }
    }
   
    /// first create an Float Array uninited (in fact allocated and all set to zero), then pass in to   `vDSP.fill` to init
    func testFloatArrayFill() throws {
        let val = Float(repeatVal1)
        measure {
            var uninit = [Float](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
            vDSP.fill(&uninit, with: val)
        }
    }
}
