# MEQT
Swift wrapper for numerical operation. Aims to provide Protocols with Accelerate Implement on Apple platforms and use OpenBLAS ... Implement on Linux and Windows.


Snapshot running in Xcode playground. Visualization implemented by comformation to `CustomPlaygroundDisplayConvertible` Protocol.
![Snapshot](Resources/demo01.png)

## Objective
- Cover data types of UInt, Int, Floating Point, to Complex, SIMD, and Quaternions.
- Basic Matrix Operation, Linear Algebra, DSP ...
- Comparable efficient to common Numerical Programming tools with clear syntax (not short).


## Example
A glimpse of syntax
``` swift
import MEQT
typealias Vector = MEQTVector<Double>
typealias Matrix = MEQTMatrix<Double>
let x: Vector = Vector.ramp(in: -1.0...1.0, count: 1024)
let y = Matrix(columns: 1, row: x)

let ones: Matrix = Matrix.ones(1024, 1)
var m1 = Matrix(rows: 1024, column: x)
let m2 = y.mmul( ones.T )
square(m1, result: &m1)
m1 += m2 * m2
// absolute( j0( m1 * 5 * .pi ) )*128
m1[0..<512, 0..<512] = m2[512..<1024, 512..<1024]*2
// m1*128
```

if you use Accelerate framework, it would be like 
``` swift
import Accelerate
let acx = vDSP.ramp(in: -1.0...1.0, count: 1024)
let acy = vDSP.ramp(in: -1.0...1.0, count: 1024)
let acones = [Double](repeating: 1.0, count: 1024)

var mm1 = [Double](unsafeUninitializedCapacity: 1024*1024) { buffer, initializedCount in
    initializedCount = 1024*1024
    vDSP_mmulD(
        acx,
        vDSP_Stride(1),
        acones,
        vDSP_Stride(1),
        buffer.baseAddress!,
        vDSP_Stride(1),
        vDSP_Length(1024),
        vDSP_Length(1024),
        vDSP_Length(1)
    )
}
let mm2 = [Double](unsafeUninitializedCapacity: 1024*1024) { buffer, initializedCount in
    initializedCount = 1024*1024
    vDSP_mmulD(
        acones,
        vDSP_Stride(1),
        acy,
        vDSP_Stride(1),
        buffer.baseAddress!,
        vDSP_Stride(1),
        vDSP_Length(1024),
        vDSP_Length(1024),
        vDSP_Length(1)
    )
}

mm1.withUnsafeMutableBufferPointer { m1Buffer in
    if let cptr = m1Buffer.baseAddress {
        mm2.withUnsafeBufferPointer { buffer in
            if let aptr = buffer.baseAddress?.advanced(by: 1024*511+511) {
                vDSP_mmovD(
                    aptr,
                    cptr,
                    vDSP_Length(512),
                    vDSP_Length(512),
                    vDSP_Length(1024),
                    vDSP_Length(1024)
                )
            }
        }
    }
}
```

## Current State
- Protocols for Basic Operations
- macOS Basic Implementation for Double with Accelerate Framework
- No document yet 🤕.
