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
    let repeatVal1 = 1.0
    let repeatVal2 = 151451.151451
    override func measure(_ block: () -> Void) {
        measure(metrics: [XCTCPUMetric(), XCTClockMetric(), XCTMemoryMetric(), XCTStorageMetric()], block: block)
    }
    
    func testIntArrayRepeatingInit1() throws {
        let val = Int(repeatVal1)
        measure {
            let _ = [Int](repeating: val, count: size)
        }
    }
    
    func testIntArrayRepeatingInit2() throws {
        let val = Int(repeatVal2)
        measure {
            let _ = [Int](repeating: val, count: size)
        }
    }
    
    func testFloatArrayRepeatingInit1() throws {
        let val = Float(repeatVal1)
        measure {
            let _ = [Float](repeating: val, count: size)
        }
    }
    
    func testFloatArrayRepeatingInit2() throws {
        let val = Float(repeatVal2)
        measure {
            let _ = [Float](repeating: val, count: size)
        }
    }
    
    func testDoubleArrayRepeatingInit1() throws {
        let val = Double(repeatVal1)
        measure {
            let _ = [Double](repeating: val, count: size)
        }
    }
    
    func testDoubleArrayRepeatingInit2() throws {
        let val = Double(repeatVal2)
        measure {
            let _ = [Double](repeating: val, count: size)
        }
    }
    
    func testFloatArrayBufferInit1() throws {
        let val = Float(repeatVal1)
        measure {
            let _ = [Float](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                buffer.initialize(repeating: val)
                initializedCount = size
            }
        }
   }
    
    func testFloatArrayBufferInit2() throws {
        let val = Float(repeatVal2)
        measure {
            let _ = [Float](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                buffer.initialize(repeating: val)
                initializedCount = size
            }
        }
   }
    
    func testDoubleArrayBufferInit1() throws {
        let val = Double(repeatVal1)
        measure {
            let _ = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                buffer.initialize(repeating: val)
                initializedCount = size
            }
        }
   }
    
    func testDoubleArrayBufferInit2() throws {
        let val = Double(repeatVal2)
        measure {
            let _ = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                buffer.initialize(repeating: val)
                initializedCount = size
            }
        }
        let fill = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
            buffer.initialize(repeating: val)
            initializedCount = size
        }
        let repeating = [Double](repeating: val, count: size)
        XCTAssertEqual(fill, repeating)
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
    
    func testDoubleArrayFill1() throws {
        let val = Double(repeatVal1)
        measure {
            var uninit = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
            vDSP.fill(&uninit, with: val)
        }
    }
    
    func testDoubleArrayFill2() throws {
        let val = Double(repeatVal2)
        measure {
            var uninit = [Double](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
            vDSP.fill(&uninit, with: val)
        }
    }
    
    /// first create an Float Array uninited (in fact allocated and all set to zero), then pass in to   `vDSP.fill` to init
    func testFloatArrayFill1() throws {
        let val = Float(repeatVal1)
        measure {
            var uninit = [Float](unsafeUninitializedCapacity: size) { buffer, initializedCount in
                initializedCount = size
            }
            vDSP.fill(&uninit, with: val)
        }
    }
}
